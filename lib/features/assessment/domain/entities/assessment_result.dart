import 'package:equatable/equatable.dart';
import 'mbti_type.dart';

enum AssessmentType { quick, full }

class AssessmentResult extends Equatable {
  final String id;
  final MBTIType type;
  final Map<String, double> scores;
  final DateTime completedAt;
  final AssessmentType testType;
  final double reliability;

  const AssessmentResult({
    required this.id,
    required this.type,
    required this.scores,
    required this.completedAt,
    required this.testType,
    required this.reliability,
  });

  @override
  List<Object?> get props => [
    id,
    type,
    scores,
    completedAt,
    testType,
    reliability,
  ];

  // Helper methods to get individual dimension scores
  double get extraversionScore => scores['E'] ?? 0.0;
  double get introversionScore => scores['I'] ?? 0.0;
  double get sensingScore => scores['S'] ?? 0.0;
  double get intuitionScore => scores['N'] ?? 0.0;
  double get thinkingScore => scores['T'] ?? 0.0;
  double get feelingScore => scores['F'] ?? 0.0;
  double get judgingScore => scores['J'] ?? 0.0;
  double get perceivingScore => scores['P'] ?? 0.0;

  // Helper method to get dominant preference for each dimension
  String get extraversionPreference =>
      extraversionScore > introversionScore ? 'E' : 'I';
  String get sensingPreference => sensingScore > intuitionScore ? 'S' : 'N';
  String get thinkingPreference => thinkingScore > feelingScore ? 'T' : 'F';
  String get judgingPreference => judgingScore > perceivingScore ? 'J' : 'P';

  // Helper method to get preference strength
  double getPreferenceStrength(String dimension) {
    switch (dimension) {
      case 'EI':
        return (extraversionScore - introversionScore).abs();
      case 'SN':
        return (sensingScore - intuitionScore).abs();
      case 'TF':
        return (thinkingScore - feelingScore).abs();
      case 'JP':
        return (judgingScore - perceivingScore).abs();
      default:
        return 0.0;
    }
  }

  // Helper method to get preference clarity level
  String getPreferenceClarity(String dimension) {
    final strength = getPreferenceStrength(dimension);
    if (strength >= 0.6) {
      return 'Clear';
    } else if (strength >= 0.3) {
      return 'Moderate';
    } else {
      return 'Slight';
    }
  }

  // Helper method to check if result is reliable
  bool get isReliable => reliability >= 0.7;

  // Copy with method for updating result
  AssessmentResult copyWith({
    String? id,
    MBTIType? type,
    Map<String, double>? scores,
    DateTime? completedAt,
    AssessmentType? testType,
    double? reliability,
  }) {
    return AssessmentResult(
      id: id ?? this.id,
      type: type ?? this.type,
      scores: scores ?? this.scores,
      completedAt: completedAt ?? this.completedAt,
      testType: testType ?? this.testType,
      reliability: reliability ?? this.reliability,
    );
  }
}
