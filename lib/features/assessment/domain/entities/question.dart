import 'package:equatable/equatable.dart';

enum QuestionDimension { ei, sn, tf, jp }

class Question extends Equatable {
  final int id;
  final String text;
  final List<QuestionOption> options;
  final QuestionDimension dimension;
  final bool isReversed;

  const Question({
    required this.id,
    required this.text,
    required this.options,
    required this.dimension,
    this.isReversed = false,
  });

  @override
  List<Object?> get props => [id, text, options, dimension, isReversed];
}

class QuestionOption extends Equatable {
  final String text;
  final double score; // -2.0 to +2.0 for 5-point scale
  final int value; // 1-5 for Likert scale

  const QuestionOption({
    required this.text,
    required this.score,
    required this.value,
  });

  @override
  List<Object?> get props => [text, score, value];
}

class Answer extends Equatable {
  final int questionId;
  final QuestionOption selectedOption;
  final DateTime answeredAt;

  const Answer({
    required this.questionId,
    required this.selectedOption,
    required this.answeredAt,
  });

  @override
  List<Object?> get props => [questionId, selectedOption, answeredAt];
}
