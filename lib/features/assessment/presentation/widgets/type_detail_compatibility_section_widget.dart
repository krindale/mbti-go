import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/animations/app_animations.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/mbti_type.dart';

/// MBTI 타입 상세 페이지 궁합 섹션 위젯
/// Single Responsibility: 타입 간 궁합 정보 표시
class TypeDetailCompatibilitySectionWidget extends StatelessWidget {
  final MBTIType type;

  const TypeDetailCompatibilitySectionWidget({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return BounceInAnimation(
      delay: AnimationConstants.staggerDelay(5),
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
                    Icon(Icons.favorite, color: AppColors.grey70, size: 24),
                    const SizedBox(width: 8),
                    Text(
                      l10n.compatibilityInfo,
                      style: AppTextStyles.headlineSmall.copyWith(
                        color: AppColors.grey900,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  l10n.compatibilityFeatureComingSoon(type.name),
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.grey600,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.grey10,
                    border: Border.all(color: AppColors.grey30, width: 1),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: AppColors.grey70,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          l10n.compatibilityFeatureNote,
                          style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.grey70,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
