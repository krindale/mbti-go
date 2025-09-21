import 'package:flutter/material.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/question.dart';

class MBTIQuestionsLikert {
  // 5-point Likert Scale MBTI Assessment Questions (20 questions)
  static List<Question> getQuickAssessmentQuestions(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return [
      // E/I Questions (5)
      Question(
        id: 1,
        text: l10n.question1,
        dimension: QuestionDimension.ei,
        options: [
          QuestionOption(text: l10n.completelyA, score: -2.0, value: 1),
          QuestionOption(text: l10n.mostlyA, score: -1.0, value: 2),
          QuestionOption(text: l10n.neutral, score: 0.0, value: 3),
          QuestionOption(text: l10n.mostlyB, score: 1.0, value: 4),
          QuestionOption(text: l10n.completelyB, score: 2.0, value: 5),
        ],
      ),
      Question(
        id: 2,
        text: l10n.question2,
        dimension: QuestionDimension.ei,
        options: [
          QuestionOption(text: l10n.completelyA, score: -2.0, value: 1),
          QuestionOption(text: l10n.mostlyA, score: -1.0, value: 2),
          QuestionOption(text: l10n.neutral, score: 0.0, value: 3),
          QuestionOption(text: l10n.mostlyB, score: 1.0, value: 4),
          QuestionOption(text: l10n.completelyB, score: 2.0, value: 5),
        ],
      ),
      Question(
        id: 3,
        text: l10n.question3,
        dimension: QuestionDimension.ei,
        options: [
          QuestionOption(text: l10n.completelyA, score: -2.0, value: 1),
          QuestionOption(text: l10n.mostlyA, score: -1.0, value: 2),
          QuestionOption(text: l10n.neutral, score: 0.0, value: 3),
          QuestionOption(text: l10n.mostlyB, score: 1.0, value: 4),
          QuestionOption(text: l10n.completelyB, score: 2.0, value: 5),
        ],
      ),
      Question(
        id: 4,
        text: l10n.question4,
        dimension: QuestionDimension.ei,
        options: [
          QuestionOption(text: l10n.completelyA, score: -2.0, value: 1),
          QuestionOption(text: l10n.mostlyA, score: -1.0, value: 2),
          QuestionOption(text: l10n.neutral, score: 0.0, value: 3),
          QuestionOption(text: l10n.mostlyB, score: 1.0, value: 4),
          QuestionOption(text: l10n.completelyB, score: 2.0, value: 5),
        ],
      ),
      Question(
        id: 5,
        text: l10n.question5,
        dimension: QuestionDimension.ei,
        options: [
          QuestionOption(text: l10n.completelyA, score: -2.0, value: 1),
          QuestionOption(text: l10n.mostlyA, score: -1.0, value: 2),
          QuestionOption(text: l10n.neutral, score: 0.0, value: 3),
          QuestionOption(text: l10n.mostlyB, score: 1.0, value: 4),
          QuestionOption(text: l10n.completelyB, score: 2.0, value: 5),
        ],
      ),

      // S/N Questions (5)
      Question(
        id: 6,
        text: l10n.question6,
        dimension: QuestionDimension.sn,
        options: [
          QuestionOption(text: l10n.completelyA, score: -2.0, value: 1),
          QuestionOption(text: l10n.mostlyA, score: -1.0, value: 2),
          QuestionOption(text: l10n.neutral, score: 0.0, value: 3),
          QuestionOption(text: l10n.mostlyB, score: 1.0, value: 4),
          QuestionOption(text: l10n.completelyB, score: 2.0, value: 5),
        ],
      ),
      Question(
        id: 7,
        text: l10n.question7,
        dimension: QuestionDimension.sn,
        options: [
          QuestionOption(text: l10n.completelyA, score: -2.0, value: 1),
          QuestionOption(text: l10n.mostlyA, score: -1.0, value: 2),
          QuestionOption(text: l10n.neutral, score: 0.0, value: 3),
          QuestionOption(text: l10n.mostlyB, score: 1.0, value: 4),
          QuestionOption(text: l10n.completelyB, score: 2.0, value: 5),
        ],
      ),
      Question(
        id: 8,
        text: l10n.question8,
        dimension: QuestionDimension.sn,
        options: [
          QuestionOption(text: l10n.completelyA, score: 2.0, value: 1),
          QuestionOption(text: l10n.mostlyA, score: 1.0, value: 2),
          QuestionOption(text: l10n.neutral, score: 0.0, value: 3),
          QuestionOption(text: l10n.mostlyB, score: -1.0, value: 4),
          QuestionOption(text: l10n.completelyB, score: -2.0, value: 5),
        ],
      ),
      Question(
        id: 9,
        text: l10n.question9,
        dimension: QuestionDimension.sn,
        options: [
          QuestionOption(text: l10n.completelyA, score: -2.0, value: 1),
          QuestionOption(text: l10n.mostlyA, score: -1.0, value: 2),
          QuestionOption(text: l10n.neutral, score: 0.0, value: 3),
          QuestionOption(text: l10n.mostlyB, score: 1.0, value: 4),
          QuestionOption(text: l10n.completelyB, score: 2.0, value: 5),
        ],
      ),
      Question(
        id: 10,
        text: l10n.question10,
        dimension: QuestionDimension.sn,
        options: [
          QuestionOption(text: l10n.completelyA, score: -2.0, value: 1),
          QuestionOption(text: l10n.mostlyA, score: -1.0, value: 2),
          QuestionOption(text: l10n.neutral, score: 0.0, value: 3),
          QuestionOption(text: l10n.mostlyB, score: 1.0, value: 4),
          QuestionOption(text: l10n.completelyB, score: 2.0, value: 5),
        ],
      ),

      // T/F Questions (5)
      Question(
        id: 11,
        text: l10n.question11,
        dimension: QuestionDimension.tf,
        options: [
          QuestionOption(text: l10n.completelyA, score: -2.0, value: 1),
          QuestionOption(text: l10n.mostlyA, score: -1.0, value: 2),
          QuestionOption(text: l10n.neutral, score: 0.0, value: 3),
          QuestionOption(text: l10n.mostlyB, score: 1.0, value: 4),
          QuestionOption(text: l10n.completelyB, score: 2.0, value: 5),
        ],
      ),
      Question(
        id: 12,
        text: l10n.question12,
        dimension: QuestionDimension.tf,
        options: [
          QuestionOption(text: l10n.completelyA, score: -2.0, value: 1),
          QuestionOption(text: l10n.mostlyA, score: -1.0, value: 2),
          QuestionOption(text: l10n.neutral, score: 0.0, value: 3),
          QuestionOption(text: l10n.mostlyB, score: 1.0, value: 4),
          QuestionOption(text: l10n.completelyB, score: 2.0, value: 5),
        ],
      ),
      Question(
        id: 13,
        text: l10n.question13,
        dimension: QuestionDimension.tf,
        options: [
          QuestionOption(text: l10n.completelyA, score: -2.0, value: 1),
          QuestionOption(text: l10n.mostlyA, score: -1.0, value: 2),
          QuestionOption(text: l10n.neutral, score: 0.0, value: 3),
          QuestionOption(text: l10n.mostlyB, score: 1.0, value: 4),
          QuestionOption(text: l10n.completelyB, score: 2.0, value: 5),
        ],
      ),
      Question(
        id: 14,
        text: l10n.question14,
        dimension: QuestionDimension.tf,
        options: [
          QuestionOption(text: l10n.completelyA, score: -2.0, value: 1),
          QuestionOption(text: l10n.mostlyA, score: -1.0, value: 2),
          QuestionOption(text: l10n.neutral, score: 0.0, value: 3),
          QuestionOption(text: l10n.mostlyB, score: 1.0, value: 4),
          QuestionOption(text: l10n.completelyB, score: 2.0, value: 5),
        ],
      ),
      Question(
        id: 15,
        text: l10n.question15,
        dimension: QuestionDimension.tf,
        options: [
          QuestionOption(text: l10n.completelyA, score: -2.0, value: 1),
          QuestionOption(text: l10n.mostlyA, score: -1.0, value: 2),
          QuestionOption(text: l10n.neutral, score: 0.0, value: 3),
          QuestionOption(text: l10n.mostlyB, score: 1.0, value: 4),
          QuestionOption(text: l10n.completelyB, score: 2.0, value: 5),
        ],
      ),

      // J/P Questions (5)
      Question(
        id: 16,
        text: l10n.question16,
        dimension: QuestionDimension.jp,
        options: [
          QuestionOption(text: l10n.completelyA, score: -2.0, value: 1),
          QuestionOption(text: l10n.mostlyA, score: -1.0, value: 2),
          QuestionOption(text: l10n.neutral, score: 0.0, value: 3),
          QuestionOption(text: l10n.mostlyB, score: 1.0, value: 4),
          QuestionOption(text: l10n.completelyB, score: 2.0, value: 5),
        ],
      ),
      Question(
        id: 17,
        text: l10n.question17,
        dimension: QuestionDimension.jp,
        options: [
          QuestionOption(text: l10n.completelyA, score: -2.0, value: 1),
          QuestionOption(text: l10n.mostlyA, score: -1.0, value: 2),
          QuestionOption(text: l10n.neutral, score: 0.0, value: 3),
          QuestionOption(text: l10n.mostlyB, score: 1.0, value: 4),
          QuestionOption(text: l10n.completelyB, score: 2.0, value: 5),
        ],
      ),
      Question(
        id: 18,
        text: l10n.question18,
        dimension: QuestionDimension.jp,
        options: [
          QuestionOption(text: l10n.completelyA, score: -2.0, value: 1),
          QuestionOption(text: l10n.mostlyA, score: -1.0, value: 2),
          QuestionOption(text: l10n.neutral, score: 0.0, value: 3),
          QuestionOption(text: l10n.mostlyB, score: 1.0, value: 4),
          QuestionOption(text: l10n.completelyB, score: 2.0, value: 5),
        ],
      ),
      Question(
        id: 19,
        text: l10n.question19,
        dimension: QuestionDimension.jp,
        options: [
          QuestionOption(text: l10n.completelyA, score: -2.0, value: 1),
          QuestionOption(text: l10n.mostlyA, score: -1.0, value: 2),
          QuestionOption(text: l10n.neutral, score: 0.0, value: 3),
          QuestionOption(text: l10n.mostlyB, score: 1.0, value: 4),
          QuestionOption(text: l10n.completelyB, score: 2.0, value: 5),
        ],
      ),
      Question(
        id: 20,
        text: l10n.question20,
        dimension: QuestionDimension.jp,
        options: [
          QuestionOption(text: l10n.completelyA, score: -2.0, value: 1),
          QuestionOption(text: l10n.mostlyA, score: -1.0, value: 2),
          QuestionOption(text: l10n.neutral, score: 0.0, value: 3),
          QuestionOption(text: l10n.mostlyB, score: 1.0, value: 4),
          QuestionOption(text: l10n.completelyB, score: 2.0, value: 5),
        ],
      ),
    ];
  }
}
