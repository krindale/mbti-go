import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/animations/app_animations.dart';
import '../../domain/entities/assessment_result.dart';

/// MBTI 결과 페이지 메인 결과 카드 위젯
/// Single Responsibility: 결과 타입과 기본 정보 표시
class ResultCardWidget extends StatelessWidget {
  final AssessmentResult result;

  const ResultCardWidget({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return BounceInAnimation(
      delay: AppAnimations.staggerDelay(0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Card(
          elevation: 2,
          shadowColor: AppColors.black.withValues(alpha: 0.1),
          shape: const RoundedRectangleBorder(),
          color: AppColors.white,
          child: Container(
            padding: const EdgeInsets.all(32),
            child: Column(
              children: [
                Container(
                  width: 160,
                  height: 160,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.grey10,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.grey60.withValues(alpha: 0.2),
                        blurRadius: 6,
                        offset: const Offset(1, 1),
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      result.type.imagePath,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(
                          Icons.person,
                          size: 60,
                          color: AppColors.white,
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  result.type.code,
                  style: AppTextStyles.displaySmall.copyWith(
                    color: AppColors.grey90,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  result.type.name,
                  style: AppTextStyles.headlineMedium.copyWith(
                    color: AppColors.grey800,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.grey20,
                    border: Border.all(color: AppColors.grey40, width: 1),
                  ),
                  child: Text(
                    result.type.categoryName,
                    style: AppTextStyles.labelLarge.copyWith(
                      color: AppColors.grey70,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  result.type.description,
                  style: AppTextStyles.bodyLarge.copyWith(height: 1.6),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.verified,
                      color: result.isReliable
                          ? AppColors.grey70
                          : AppColors.grey60,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '신뢰도: ${(result.reliability * 100).toInt()}%',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: result.isReliable
                            ? AppColors.grey70
                            : AppColors.grey60,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
