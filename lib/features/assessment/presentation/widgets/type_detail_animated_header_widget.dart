import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/animations/app_animations.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/mbti_type.dart';
import '../../data/services/mbti_localization_service.dart';

/// MBTI 타입 상세 페이지 애니메이션 헤더 위젯
/// Single Responsibility: 애니메이션이 적용된 헤더 표시
class TypeDetailAnimatedHeaderWidget extends StatelessWidget {
  final MBTIType type;
  final Animation<double> fadeAnimation;
  final Animation<Offset> slideAnimation;

  const TypeDetailAnimatedHeaderWidget({
    super.key,
    required this.type,
    required this.fadeAnimation,
    required this.slideAnimation,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final localizationService = MBTILocalizationService(l10n);

    return SlideTransition(
      position: slideAnimation,
      child: FadeTransition(
        opacity: fadeAnimation,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Row(
            children: [
              TapBounceAnimation(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border.all(color: AppColors.grey30, width: 1),
                  ),
                  child: Icon(
                    Icons.arrow_back,
                    color: AppColors.grey80,
                    size: 20,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${type.code} - ${type.name}',
                      style: AppTextStyles.headlineSmall.copyWith(
                        color: AppColors.grey900,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      localizationService.getLocalizedCategoryName(type.category),
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.grey600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
