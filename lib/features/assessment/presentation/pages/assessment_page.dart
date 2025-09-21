import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/animations/app_animations.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/question.dart';
import '../../domain/entities/assessment_result.dart';
import '../../data/datasources/mbti_types_repository.dart';
import '../../data/services/mbti_localization_service.dart';
import '../../data/datasources/mbti_questions_likert.dart';
import '../widgets/assessment_header_widget.dart';
import '../widgets/assessment_progress_widget.dart';
import '../widgets/assessment_question_content_widget.dart';
import '../widgets/assessment_navigation_widget.dart';
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

  late final List<Question> questions;
  final Map<int, Answer> answers = {};
  int currentQuestionIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _progressAnimationController = AnimationController(
      duration: AnimationConstants.normal,
      vsync: this,
    );
    _progressAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _progressAnimationController,
        curve: AnimationConstants.slideUp,
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Initialize questions with BuildContext when it's available
    questions = MBTIQuestionsLikert.getQuickAssessmentQuestions(context);
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
      duration: AnimationConstants.normal,
      curve: AnimationConstants.slideUp,
    );
    _updateProgress();
  }

  void _previousQuestion() {
    if (currentQuestionIndex > 0) {
      setState(() {
        currentQuestionIndex--;
      });
      _pageController.previousPage(
        duration: AnimationConstants.normal,
        curve: AnimationConstants.slideUp,
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
    final l10n = AppLocalizations.of(context)!;
    final localizationService = MBTILocalizationService(l10n);
    final repository = MBTITypesRepository(localizationService);
    final mbtiType = repository.getTypeByCode(typeCode)!;

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
                AssessmentHeaderWidget(
                  currentQuestionIndex: currentQuestionIndex,
                  totalQuestions: questions.length,
                  onBackPressed: () {
                    if (currentQuestionIndex > 0) {
                      _previousQuestion();
                    } else {
                      Navigator.of(context).pop();
                    }
                  },
                ),
                AssessmentProgressWidget(
                  currentQuestionIndex: currentQuestionIndex,
                  totalQuestions: questions.length,
                  progressAnimation: _progressAnimation,
                ),
                Expanded(
                  child: AssessmentQuestionContentWidget(
                    pageController: _pageController,
                    questions: questions,
                    answers: answers,
                    onAnswerSelected: _selectAnswer,
                  ),
                ),
                AssessmentNavigationWidget(
                  currentQuestionIndex: currentQuestionIndex,
                  questions: questions,
                  answers: answers,
                  onPrevious: _previousQuestion,
                  onNext: _nextQuestion,
                  onComplete: _completeAssessment,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
