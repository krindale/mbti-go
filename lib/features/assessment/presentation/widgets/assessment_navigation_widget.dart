import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/question.dart';

/// MBTI 검사 페이지 네비게이션 위젯
/// Single Responsibility: 이전/다음 버튼과 완료 버튼 표시
class AssessmentNavigationWidget extends StatelessWidget {
  final int currentQuestionIndex;
  final List<Question> questions;
  final Map<int, Answer> answers;
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final VoidCallback onComplete;

  const AssessmentNavigationWidget({
    super.key,
    required this.currentQuestionIndex,
    required this.questions,
    required this.answers,
    required this.onPrevious,
    required this.onNext,
    required this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    final isAnswered = answers.containsKey(questions[currentQuestionIndex].id);
    final isLastQuestion = currentQuestionIndex >= questions.length - 1;

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        children: [
          if (currentQuestionIndex > 0)
            Expanded(
              child: GestureDetector(
                onTap: onPrevious,
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
                        AppLocalizations.of(context)!.previous,
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
            child: isAnswered
                ? GestureDetector(
                    onTap: isLastQuestion ? onComplete : onNext,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: const BoxDecoration(color: AppColors.grey90),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            isLastQuestion ? AppLocalizations.of(context)!.complete : AppLocalizations.of(context)!.next,
                            style: AppTextStyles.buttonText,
                          ),
                          const SizedBox(width: 8),
                          Icon(
                            isLastQuestion ? Icons.check : Icons.arrow_forward,
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
                          AppLocalizations.of(context)!.pleaseSelectAnswer,
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
