import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/animations/app_animations.dart';
import '../../domain/entities/assessment_result.dart';

/// MBTI 결과 페이지 상세 설명 위젯
/// Single Responsibility: 타입의 상세한 이야기와 설명 표시
class ResultDetailedDescriptionWidget extends StatelessWidget {
  final AssessmentResult result;

  const ResultDetailedDescriptionWidget({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return BounceInAnimation(
      delay: AppAnimations.staggerDelay(4),
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
                    Icon(Icons.auto_stories, color: AppColors.grey70, size: 24),
                    const SizedBox(width: 8),
                    Text(
                      '당신의 이야기',
                      style: AppTextStyles.headlineSmall.copyWith(
                        color: AppColors.grey900,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  result.type.detailedDescription,
                  style: AppTextStyles.bodyLarge.copyWith(
                    height: 1.8,
                    color: AppColors.grey800,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
