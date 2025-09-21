import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/animations/app_animations.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/mbti_type.dart';
import '../../data/services/mbti_localization_service.dart';

/// MBTI 타입 상세 페이지 메인 카드 위젯
/// Single Responsibility: 타입 기본 정보 카드 표시
class TypeDetailMainCardWidget extends StatelessWidget {
  final MBTIType type;

  const TypeDetailMainCardWidget({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final localizationService = MBTILocalizationService(l10n);
    return BounceInAnimation(
      delay: AnimationConstants.staggerDelay(0),
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
                Hero(
                  tag: 'mbti_image_${type.code}',
                  child: Container(
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
                        type.imagePath,
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
                ),
                const SizedBox(height: 24),
                Text(
                  type.code,
                  style: AppTextStyles.displaySmall.copyWith(
                    color: AppColors.grey90,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  type.name,
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
                    localizationService.getLocalizedCategoryName(type.category),
                    style: AppTextStyles.labelLarge.copyWith(
                      color: AppColors.grey70,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  type.description,
                  style: AppTextStyles.bodyLarge.copyWith(
                    height: 1.6,
                    color: AppColors.grey700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
