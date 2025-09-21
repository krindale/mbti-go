import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/animations/app_animations.dart';
import '../../domain/entities/assessment_result.dart';
import '../../../../l10n/app_localizations.dart';

/// MBTI 결과 페이지 강점/약점 위젯
/// Single Responsibility: 강점과 개선점 표시
class ResultStrengthsWeaknessesWidget extends StatelessWidget {
  final AssessmentResult result;

  const ResultStrengthsWeaknessesWidget({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return BounceInAnimation(
      delay: AnimationConstants.staggerDelay(2),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Card(
                elevation: 2,
                shape: const RoundedRectangleBorder(),
                color: AppColors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.star, color: AppColors.grey70, size: 20),
                          const SizedBox(width: 8),
                          Text(
                            AppLocalizations.of(context)!.strengths,
                            style: AppTextStyles.titleMedium.copyWith(
                              color: AppColors.grey90,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      ...result.type.strengths.map((strength) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            children: [
                              Container(
                                width: 4,
                                height: 4,
                                decoration: const BoxDecoration(
                                  color: AppColors.grey70,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  strength,
                                  style: AppTextStyles.bodySmall,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Card(
                elevation: 2,
                shape: const RoundedRectangleBorder(),
                color: AppColors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.trending_up,
                            color: AppColors.grey60,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            AppLocalizations.of(context)!.improvementAreas,
                            style: AppTextStyles.titleMedium.copyWith(
                              color: AppColors.grey80,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      ...result.type.weaknesses.map((weakness) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            children: [
                              Container(
                                width: 4,
                                height: 4,
                                decoration: const BoxDecoration(
                                  color: AppColors.grey60,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  weakness,
                                  style: AppTextStyles.bodySmall,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
