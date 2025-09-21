import 'package:flutter/material.dart';
import '../../domain/entities/question.dart';
import '../../domain/entities/assessment_result.dart';
import '../../domain/services/assessment_calculator.dart';
import '../../data/datasources/mbti_questions_likert.dart';

/// 평가 상태 관리 컨트롤러
/// Single Responsibility: 평가 진행 상태와 비즈니스 로직 관리
class AssessmentController extends ChangeNotifier {
  final AssessmentCalculator _calculator;

  AssessmentController(this._calculator);

  List<Question>? _questions;
  final Map<int, Answer> _answers = {};
  int _currentQuestionIndex = 0;

  // Getters
  List<Question> get questions => _questions != null ? List.unmodifiable(_questions!) : [];
  Map<int, Answer> get answers => Map.unmodifiable(_answers);
  int get currentQuestionIndex => _currentQuestionIndex;
  int get totalQuestions => _questions?.length ?? 0;
  double get progressPercentage => (_questions?.length ?? 0) > 0 ? _currentQuestionIndex / _questions!.length : 0.0;
  bool get isLastQuestion => (_questions?.length ?? 0) > 0 && _currentQuestionIndex >= _questions!.length - 1;
  bool get canGoBack => _currentQuestionIndex > 0;
  Question get currentQuestion => _questions![_currentQuestionIndex];
  Answer? get currentAnswer => _answers[currentQuestion.id];

  /// 질문 초기화
  void initializeQuestions(BuildContext context) {
    _questions = MBTIQuestionsLikert.getQuickAssessmentQuestions(context);
    notifyListeners();
  }

  /// 답변 선택
  void selectAnswer(QuestionOption option) {
    _answers[currentQuestion.id] = Answer(
      questionId: currentQuestion.id,
      selectedOption: option,
      answeredAt: DateTime.now(),
    );
    notifyListeners();
  }

  /// 다음 질문으로 이동
  bool nextQuestion() {
    if (_questions != null && _currentQuestionIndex < _questions!.length - 1) {
      _currentQuestionIndex++;
      notifyListeners();
      return true;
    }
    return false;
  }

  /// 이전 질문으로 이동
  bool previousQuestion() {
    if (_currentQuestionIndex > 0) {
      _currentQuestionIndex--;
      notifyListeners();
      return true;
    }
    return false;
  }

  /// 평가 결과 계산
  AssessmentResult calculateResult() {
    if (_questions == null) {
      throw StateError('Questions not initialized. Call initializeQuestions() first.');
    }
    return _calculator.calculateResult(
      questions: _questions!,
      answers: _answers,
    );
  }

  /// 평가 초기화
  void reset() {
    _currentQuestionIndex = 0;
    _answers.clear();
    notifyListeners();
  }

  /// 특정 질문으로 이동
  void goToQuestion(int index) {
    if (_questions != null && index >= 0 && index < _questions!.length) {
      _currentQuestionIndex = index;
      notifyListeners();
    }
  }

  /// 답변 완료 여부 확인
  bool isQuestionAnswered(int questionIndex) {
    if (_questions == null || questionIndex < 0 || questionIndex >= _questions!.length) return false;
    final question = _questions![questionIndex];
    return _answers.containsKey(question.id);
  }

  /// 모든 질문이 답변되었는지 확인
  bool get isAllQuestionsAnswered => _questions != null && _answers.length == _questions!.length;

  /// 답변률 계산
  double get answerPercentage => _questions != null && _questions!.isNotEmpty
      ? _answers.length / _questions!.length
      : 0.0;
}
