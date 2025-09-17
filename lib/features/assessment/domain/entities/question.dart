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
  final double score;
  final String preference; // E, I, S, N, T, F, J, P

  const QuestionOption({
    required this.text,
    required this.score,
    required this.preference,
  });

  @override
  List<Object?> get props => [text, score, preference];
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