import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/animations/app_animations.dart';
import '../../domain/entities/question.dart';
import '../../domain/entities/assessment_result.dart';
import '../../data/datasources/mbti_data.dart';
import '../../data/datasources/mbti_questions_likert.dart';
import 'result_page.dart';

class AssessmentPage extends StatefulWidget {
  const AssessmentPage({super.key});

  @override
  State<AssessmentPage> createState() => _AssessmentPageState();
}

class _AssessmentPageState extends State<AssessmentPage>
    with TickerProviderStateMixin {
  late PageController _pageController;
  late AnimationController _progressAnimationController;
  late Animation<double> _progressAnimation;

  final List<Question> questions =
      MBTIQuestionsLikert.getQuickAssessmentQuestions();
  final Map<int, Answer> answers = {};
  int currentQuestionIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _progressAnimationController = AnimationController(
      duration: AppAnimations.normal,
      vsync: this,
    );
    _progressAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _progressAnimationController,
        curve: AppAnimations.slideUp,
      ),
    );
    _updateProgress();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _progressAnimationController.dispose();
    super.dispose();
  }

  void _updateProgress() {
    final progress = currentQuestionIndex / questions.length;
    _progressAnimationController.animateTo(progress);
  }

  void _selectAnswer(QuestionOption option) {
    HapticFeedback.lightImpact();

    setState(() {
      answers[questions[currentQuestionIndex].id] = Answer(
        questionId: questions[currentQuestionIndex].id,
        selectedOption: option,
        answeredAt: DateTime.now(),
      );
    });

    // Move to next question after a short delay
    Future.delayed(const Duration(milliseconds: 300), () {
      if (currentQuestionIndex < questions.length - 1) {
        _nextQuestion();
      } else {
        _completeAssessment();
      }
    });
  }

  void _nextQuestion() {
    setState(() {
      currentQuestionIndex++;
    });
    _pageController.nextPage(
      duration: AppAnimations.normal,
      curve: AppAnimations.slideUp,
    );
    _updateProgress();
  }

  void _previousQuestion() {
    if (currentQuestionIndex > 0) {
      setState(() {
        currentQuestionIndex--;
      });
      _pageController.previousPage(
        duration: AppAnimations.normal,
        curve: AppAnimations.slideUp,
      );
      _updateProgress();
    }
  }

  void _completeAssessment() {
    final result = _calculateResult();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => ResultPage(result: result)),
    );
  }

  AssessmentResult _calculateResult() {
    // Initialize dimension scores
    final dimensionScores = <String, double>{
      'EI': 0.0, // E/I dimension total score
      'SN': 0.0, // S/N dimension total score
      'TF': 0.0, // T/F dimension total score
      'JP': 0.0, // J/P dimension total score
    };

    // Count answers per dimension for reliability calculation
    final answerCounts = <String, int>{'EI': 0, 'SN': 0, 'TF': 0, 'JP': 0};

    // Sum of absolute scores for reliability calculation
    final absoluteScores = <String, double>{
      'EI': 0.0,
      'SN': 0.0,
      'TF': 0.0,
      'JP': 0.0,
    };

    // Calculate scores from answers using 5-point Likert scale
    for (final answer in answers.values) {
      final question = questions.firstWhere((q) => q.id == answer.questionId);
      final score = answer.selectedOption.score; // -2.0 to +2.0

      String dimensionKey;
      switch (question.dimension) {
        case QuestionDimension.ei:
          dimensionKey = 'EI';
          break;
        case QuestionDimension.sn:
          dimensionKey = 'SN';
          break;
        case QuestionDimension.tf:
          dimensionKey = 'TF';
          break;
        case QuestionDimension.jp:
          dimensionKey = 'JP';
          break;
      }

      dimensionScores[dimensionKey] = dimensionScores[dimensionKey]! + score;
      answerCounts[dimensionKey] = answerCounts[dimensionKey]! + 1;
      absoluteScores[dimensionKey] =
          absoluteScores[dimensionKey]! + score.abs();
    }

    // Determine MBTI type based on average scores
    final energyType = (dimensionScores['EI']! / answerCounts['EI']!) >= 0
        ? 'E'
        : 'I';
    final perceptionType = (dimensionScores['SN']! / answerCounts['SN']!) >= 0
        ? 'S'
        : 'N';
    final decisionType = (dimensionScores['TF']! / answerCounts['TF']!) >= 0
        ? 'T'
        : 'F';
    final lifestyleType = (dimensionScores['JP']! / answerCounts['JP']!) >= 0
        ? 'J'
        : 'P';

    final typeCode = '$energyType$perceptionType$decisionType$lifestyleType';
    final mbtiType = MBTIData.getTypeByCode(typeCode)!;

    // Calculate reliability based on response consistency
    double reliability = 0.0;

    // Base reliability on how decisive the answers are
    for (final dimension in ['EI', 'SN', 'TF', 'JP']) {
      final maxAbsScore = absoluteScores[dimension]! / answerCounts[dimension]!;

      // Higher scores indicate more decisive answers
      final dimensionReliability = maxAbsScore / 2.0; // Normalize to 0-1
      reliability += dimensionReliability;
    }
    reliability = (reliability / 4.0).clamp(
      0.5,
      0.95,
    ); // Average and clamp to reasonable range

    // Convert dimension scores to traditional format for display
    final scores = <String, double>{};
    for (final dimension in ['EI', 'SN', 'TF', 'JP']) {
      final avgScore = dimensionScores[dimension]! / answerCounts[dimension]!;
      final firstLetter = dimension[0];
      final secondLetter = dimension[1];

      if (avgScore >= 0) {
        scores[firstLetter] =
            0.5 + (avgScore / 4.0); // Convert to 0.5-1.0 range
        scores[secondLetter] =
            0.5 - (avgScore / 4.0); // Convert to 0.0-0.5 range
      } else {
        scores[firstLetter] =
            0.5 + (avgScore / 4.0); // Convert to 0.0-0.5 range
        scores[secondLetter] =
            0.5 - (avgScore / 4.0); // Convert to 0.5-1.0 range
      }
    }

    return AssessmentResult(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      type: mbtiType,
      scores: scores,
      completedAt: DateTime.now(),
      testType: AssessmentType.quick,
      reliability: reliability,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        if (currentQuestionIndex > 0) {
          _previousQuestion();
        } else {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        body: Container(
          color: AppColors.grey10,
          child: SafeArea(
            child: Column(
              children: [
                _buildHeader(),
                _buildProgressBar(),
                Expanded(child: _buildQuestionContent()),
                _buildNavigationButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              if (currentQuestionIndex > 0) {
                _previousQuestion();
              } else {
                Navigator.of(context).pop();
              }
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(color: AppColors.grey30, width: 1),
              ),
              child: Icon(Icons.arrow_back, color: AppColors.grey80, size: 20),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'MBTI 간편 검사',
                  style: AppTextStyles.headlineSmall.copyWith(
                    color: AppColors.grey900,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${currentQuestionIndex + 1} / ${questions.length}',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.grey600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '진행률',
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.grey600,
                ),
              ),
              Text(
                '${(currentQuestionIndex / questions.length * 100).toInt()}%',
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.grey70,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            height: 8,
            width: double.infinity,
            decoration: const BoxDecoration(color: AppColors.grey30),
            child: AnimatedBuilder(
              animation: _progressAnimation,
              builder: (context, child) {
                final progress = currentQuestionIndex / questions.length;
                return Row(
                  children: [
                    Expanded(
                      flex: (progress * 1000).toInt(),
                      child: Container(
                        height: 8,
                        decoration: const BoxDecoration(
                          color: AppColors.grey80,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: ((1.0 - progress) * 1000).toInt(),
                      child: const SizedBox(),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionContent() {
    return PageView.builder(
      controller: _pageController,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: questions.length,
      itemBuilder: (context, index) {
        return AnimatedSwitcher(
          duration: AppAnimations.normal,
          child: _buildQuestionCard(questions[index]),
        );
      },
    );
  }

  Widget _buildQuestionCard(Question question) {
    final selectedAnswer = answers[question.id];

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            elevation: 2,
            shadowColor: AppColors.black.withValues(alpha: 0.1),
            shape: const RoundedRectangleBorder(),
            color: AppColors.white,
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      color: AppColors.grey80,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.psychology,
                      color: AppColors.white,
                      size: 32,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    question.text,
                    style: AppTextStyles.headlineSmall.copyWith(
                      color: AppColors.grey900,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  // Likert Scale Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '전혀\n아니다',
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.grey600,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        '보통\n이다',
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.grey600,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        '매우\n그렇다',
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.grey600,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Likert Scale Radio Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: question.options.map((option) {
                      final isSelected =
                          selectedAnswer?.selectedOption == option;
                      final value = option.value;

                      return GestureDetector(
                        onTap: () => _selectAnswer(option),
                        child: AnimatedContainer(
                          duration: AppAnimations.fast,
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isSelected
                                ? AppColors.grey80
                                : AppColors.white,
                            border: Border.all(
                              color: isSelected
                                  ? AppColors.grey80
                                  : AppColors.grey40,
                              width: isSelected ? 3 : 2,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              value.toString(),
                              style: AppTextStyles.titleMedium.copyWith(
                                color: isSelected
                                    ? AppColors.white
                                    : AppColors.grey700,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 24),
                  // Selected Option Text
                  if (selectedAnswer != null)
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.grey10,
                        border: Border.all(color: AppColors.grey30, width: 1),
                      ),
                      child: Text(
                        selectedAnswer.selectedOption.text,
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.grey800,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationButtons() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        children: [
          if (currentQuestionIndex > 0)
            Expanded(
              child: GestureDetector(
                onTap: _previousQuestion,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border.all(color: AppColors.grey30, width: 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.arrow_back,
                        color: AppColors.grey600,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '이전',
                        style: AppTextStyles.buttonText.copyWith(
                          color: AppColors.grey600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          if (currentQuestionIndex > 0) const SizedBox(width: 16),
          Expanded(
            flex: 2,
            child: answers.containsKey(questions[currentQuestionIndex].id)
                ? GestureDetector(
                    onTap: currentQuestionIndex < questions.length - 1
                        ? _nextQuestion
                        : _completeAssessment,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: const BoxDecoration(color: AppColors.grey90),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            currentQuestionIndex < questions.length - 1
                                ? '다음'
                                : '완료',
                            style: AppTextStyles.buttonText,
                          ),
                          const SizedBox(width: 8),
                          Icon(
                            currentQuestionIndex < questions.length - 1
                                ? Icons.arrow_forward
                                : Icons.check,
                            color: AppColors.white,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  )
                : Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      color: AppColors.grey20,
                      border: Border.all(color: AppColors.grey30, width: 1),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '답변을 선택해주세요',
                          style: AppTextStyles.buttonText.copyWith(
                            color: AppColors.grey500,
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
