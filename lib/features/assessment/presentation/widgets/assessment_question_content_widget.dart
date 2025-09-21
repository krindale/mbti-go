import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/animations/app_animations.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/question.dart';

/// MBTI 검사 페이지 질문 콘텐츠 위젯
/// Single Responsibility: 질문과 리커트 척도 옵션 표시
class AssessmentQuestionContentWidget extends StatelessWidget {
  final PageController pageController;
  final List<Question> questions;
  final Map<int, Answer> answers;
  final Function(QuestionOption) onAnswerSelected;

  const AssessmentQuestionContentWidget({
    super.key,
    required this.pageController,
    required this.questions,
    required this.answers,
    required this.onAnswerSelected,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: questions.length,
      itemBuilder: (context, index) {
        return AnimatedSwitcher(
          duration: AnimationConstants.normal,
          child: _buildQuestionCard(context, questions[index]),
        );
      },
    );
  }

  Widget _buildQuestionCard(BuildContext context, Question question) {
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
                        AppLocalizations.of(context)!.completelyOptionA,
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.grey600,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        AppLocalizations.of(context)!.middle,
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.grey600,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        AppLocalizations.of(context)!.completelyOptionB,
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
                        onTap: () => onAnswerSelected(option),
                        child: AnimatedContainer(
                          duration: AnimationConstants.fast,
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
}
