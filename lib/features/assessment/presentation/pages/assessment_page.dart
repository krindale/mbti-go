import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/animations/app_animations.dart';
import '../../domain/entities/question.dart';
import '../../domain/entities/assessment_result.dart';
import '../../data/datasources/mbti_data.dart';
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

  final List<Question> questions = MBTIData.getQuickAssessmentQuestions();
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
    _progressAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _progressAnimationController,
      curve: AppAnimations.slideUp,
    ));
    _updateProgress();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _progressAnimationController.dispose();
    super.dispose();
  }

  void _updateProgress() {
    final progress = (currentQuestionIndex + 1) / questions.length;
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
      MaterialPageRoute(
        builder: (context) => ResultPage(result: result),
      ),
    );
  }

  AssessmentResult _calculateResult() {
    final scores = <String, double>{
      'E': 0.0,
      'I': 0.0,
      'S': 0.0,
      'N': 0.0,
      'T': 0.0,
      'F': 0.0,
      'J': 0.0,
      'P': 0.0,
    };

    // Calculate scores from answers
    for (final answer in answers.values) {
      final preference = answer.selectedOption.preference;
      final score = answer.selectedOption.score;
      scores[preference] = (scores[preference] ?? 0.0) + score;
    }

    // Normalize scores (0-1 scale)
    final totalEI = scores['E']! + scores['I']!;
    final totalSN = scores['S']! + scores['N']!;
    final totalTF = scores['T']! + scores['F']!;
    final totalJP = scores['J']! + scores['P']!;

    if (totalEI > 0) {
      scores['E'] = scores['E']! / totalEI;
      scores['I'] = scores['I']! / totalEI;
    }
    if (totalSN > 0) {
      scores['S'] = scores['S']! / totalSN;
      scores['N'] = scores['N']! / totalSN;
    }
    if (totalTF > 0) {
      scores['T'] = scores['T']! / totalTF;
      scores['F'] = scores['F']! / totalTF;
    }
    if (totalJP > 0) {
      scores['J'] = scores['J']! / totalJP;
      scores['P'] = scores['P']! / totalJP;
    }

    // Determine MBTI type
    final energyType = scores['E']! > scores['I']! ? 'E' : 'I';
    final perceptionType = scores['S']! > scores['N']! ? 'S' : 'N';
    final decisionType = scores['T']! > scores['F']! ? 'T' : 'F';
    final lifestyleType = scores['J']! > scores['P']! ? 'J' : 'P';

    final typeCode = '$energyType$perceptionType$decisionType$lifestyleType';
    final mbtiType = MBTIData.getTypeByCode(typeCode)!;

    // Calculate reliability (simplified)
    final reliability = 0.8; // For demo purposes

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
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.primary.withValues(alpha: 0.1),
              AppColors.secondary.withValues(alpha: 0.05),
              Colors.white,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildHeader(),
              _buildProgressBar(),
              Expanded(
                child: _buildQuestionContent(),
              ),
              _buildNavigationButtons(),
            ],
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
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.white.withValues(alpha: 0.9),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.grey200.withValues(alpha: 0.5),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(
                Icons.arrow_back,
                color: AppColors.grey700,
                size: 24,
              ),
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
                '${((currentQuestionIndex + 1) / questions.length * 100).toInt()}%',
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            height: 6,
            decoration: BoxDecoration(
              color: AppColors.grey200,
              borderRadius: BorderRadius.circular(3),
            ),
            child: AnimatedBuilder(
              animation: _progressAnimation,
              builder: (context, child) {
                return FractionallySizedBox(
                  widthFactor: _progressAnimation.value,
                  alignment: Alignment.centerLeft,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: AppColors.primaryGradient,
                      ),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
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
            elevation: 8,
            shadowColor: AppColors.primary.withValues(alpha: 0.1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: AppColors.primaryGradient,
                      ),
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
                  ...question.options.map((option) {
                    final isSelected = selectedAnswer?.selectedOption == option;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: GestureDetector(
                        onTap: () => _selectAnswer(option),
                        child: AnimatedContainer(
                          duration: AppAnimations.fast,
                          curve: Curves.easeInOut,
                          width: double.infinity,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppColors.primary.withValues(alpha: 0.1)
                                : AppColors.grey50,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: isSelected
                                  ? AppColors.primary
                                  : AppColors.grey200,
                              width: 2,
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? AppColors.primary
                                      : AppColors.white,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: isSelected
                                        ? AppColors.primary
                                        : AppColors.grey300,
                                    width: 2,
                                  ),
                                ),
                                child: isSelected
                                    ? Icon(
                                        Icons.check,
                                        color: AppColors.white,
                                        size: 16,
                                      )
                                    : null,
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Text(
                                  option.text,
                                  style: AppTextStyles.bodyLarge.copyWith(
                                    color: isSelected
                                        ? AppColors.primary
                                        : AppColors.grey800,
                                    fontWeight: isSelected
                                        ? FontWeight.w600
                                        : FontWeight.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
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
                    color: AppColors.grey100,
                    borderRadius: BorderRadius.circular(12),
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
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: AppColors.primaryGradient,
                        ),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primary.withValues(alpha: 0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
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
                      color: AppColors.grey200,
                      borderRadius: BorderRadius.circular(12),
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