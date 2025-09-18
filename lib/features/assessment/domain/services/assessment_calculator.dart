import '../entities/question.dart';
import '../entities/assessment_result.dart';
import '../../data/datasources/mbti_data.dart';

/// MBTI 평가 결과 계산 서비스
/// Single Responsibility: 평가 답변을 기반으로 MBTI 결과 계산
class AssessmentCalculator {
  /// 답변들을 기반으로 평가 결과 계산
  static AssessmentResult calculateResult({
    required List<Question> questions,
    required Map<int, Answer> answers,
  }) {
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

      dimensionScores[dimensionKey] =
          (dimensionScores[dimensionKey] ?? 0.0) + score;
      answerCounts[dimensionKey] = (answerCounts[dimensionKey] ?? 0) + 1;
      absoluteScores[dimensionKey] =
          (absoluteScores[dimensionKey] ?? 0.0) + score.abs();
    }

    // Determine MBTI type based on dimension scores
    final mbtiTypeCode = _determineMBTIType(dimensionScores);

    // Calculate reliability based on response consistency
    double overallReliability = 0.0;
    for (final dimension in ['EI', 'SN', 'TF', 'JP']) {
      final count = answerCounts[dimension] ?? 1;
      final absoluteSum = absoluteScores[dimension] ?? 0.0;
      final maxPossibleScore = count * 2.0;
      final reliability = count > 0
          ? (absoluteSum / maxPossibleScore).clamp(0.0, 1.0)
          : 0.0;
      overallReliability += reliability;
    }
    overallReliability = (overallReliability / 4.0).clamp(0.5, 0.95);

    // Convert dimension scores to traditional format for display
    final scores = <String, double>{};
    for (final dimension in ['EI', 'SN', 'TF', 'JP']) {
      final totalScore = dimensionScores[dimension] ?? 0.0;
      final count = answerCounts[dimension] ?? 1;
      final avgScore = totalScore / count;

      final firstLetter = dimension[0];
      final secondLetter = dimension[1];

      if (avgScore >= 0) {
        scores[firstLetter] = 0.5 + (avgScore / 4.0).clamp(0.0, 0.5);
        scores[secondLetter] = 0.5 - (avgScore / 4.0).clamp(0.0, 0.5);
      } else {
        scores[firstLetter] = 0.5 + (avgScore / 4.0).clamp(-0.5, 0.0);
        scores[secondLetter] = 0.5 - (avgScore / 4.0).clamp(-0.5, 0.0);
      }
    }

    // Get type data
    final typeData = MBTIData.getTypeByCode(mbtiTypeCode)!;

    return AssessmentResult(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      type: typeData,
      scores: scores,
      completedAt: DateTime.now(),
      testType: AssessmentType.quick,
      reliability: overallReliability,
    );
  }

  /// 차원 점수를 기반으로 MBTI 타입 결정
  static String _determineMBTIType(Map<String, double> dimensionScores) {
    final ei = dimensionScores['EI'] ?? 0.0;
    final sn = dimensionScores['SN'] ?? 0.0;
    final tf = dimensionScores['TF'] ?? 0.0;
    final jp = dimensionScores['JP'] ?? 0.0;

    String type = '';

    // E/I dimension - positive score favors Extraversion (E)
    type += ei >= 0 ? 'E' : 'I';

    // S/N dimension - positive score favors Sensing (S)
    type += sn >= 0 ? 'S' : 'N';

    // T/F dimension - positive score favors Thinking (T)
    type += tf >= 0 ? 'T' : 'F';

    // J/P dimension - positive score favors Judging (J)
    type += jp >= 0 ? 'J' : 'P';

    return type;
  }
}
