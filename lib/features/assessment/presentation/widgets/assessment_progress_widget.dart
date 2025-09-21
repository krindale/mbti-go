import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../l10n/app_localizations.dart';

/// MBTI 검사 페이지 진행률 위젯
/// Single Responsibility: 검사 진행률 표시
class AssessmentProgressWidget extends StatelessWidget {
  final int currentQuestionIndex;
  final int totalQuestions;
  final Animation<double> progressAnimation;

  const AssessmentProgressWidget({
    super.key,
    required this.currentQuestionIndex,
    required this.totalQuestions,
    required this.progressAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.progressLabel,
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.grey600,
                ),
              ),
              Text(
                '${(currentQuestionIndex / totalQuestions * 100).toInt()}%',
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.grey70,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            height: 8,
            width: double.infinity,
            decoration: const BoxDecoration(color: AppColors.grey30),
            child: AnimatedBuilder(
              animation: progressAnimation,
              builder: (context, child) {
                final progress = currentQuestionIndex / totalQuestions;
                return Row(
                  children: [
                    Expanded(
                      flex: (progress * 1000).toInt(),
                      child: Container(
                        height: 8,
                        decoration: const BoxDecoration(
                          color: AppColors.grey80,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: ((1.0 - progress) * 1000).toInt(),
                      child: const SizedBox(),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
