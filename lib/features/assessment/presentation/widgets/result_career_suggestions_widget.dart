import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/animations/app_animations.dart';
import '../../domain/entities/assessment_result.dart';

/// MBTI 결과 페이지 커리어 제안 위젯
/// Single Responsibility: 추천 직업 목록 표시
class ResultCareerSuggestionsWidget extends StatelessWidget {
  final AssessmentResult result;

  const ResultCareerSuggestionsWidget({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return BounceInAnimation(
      delay: AppAnimations.staggerDelay(3),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Card(
          elevation: 2,
          shape: const RoundedRectangleBorder(),
          color: AppColors.white,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.work, color: AppColors.grey70, size: 24),
                    const SizedBox(width: 8),
                    Text(
                      '추천 직업',
                      style: AppTextStyles.headlineSmall.copyWith(
                        color: AppColors.grey900,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: result.type.careers.map((career) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.grey20,
                        border: Border.all(color: AppColors.grey40, width: 1),
                      ),
                      child: Text(
                        career,
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.grey70,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
