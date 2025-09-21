import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/animations/app_animations.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/mbti_type.dart';

/// MBTI 타입 상세 페이지 액션 버튼 위젯
/// Single Responsibility: 페이지 하단 액션 버튼들 표시
class TypeDetailActionButtonsWidget extends StatelessWidget {
  final MBTIType type;

  const TypeDetailActionButtonsWidget({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BounceInAnimation(
      delay: AnimationConstants.staggerDelay(6),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: TapBounceAnimation(
                onTap: () {
                  HapticFeedback.lightImpact();
                  Navigator.of(
                    context,
                  ).pushNamedAndRemoveUntil('/', (route) => false);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(color: AppColors.grey90),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.home, color: AppColors.white, size: 20),
                      const SizedBox(width: 8),
                      Text(l10n.goBackHome, style: AppTextStyles.buttonText),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: TapBounceAnimation(
                onTap: () {
                  HapticFeedback.lightImpact();
                  Navigator.of(context).pop();
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border.all(color: AppColors.grey30, width: 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.arrow_back, color: AppColors.grey80, size: 20),
                      const SizedBox(width: 8),
                      Text(
                        l10n.goBack,
                        style: AppTextStyles.buttonText.copyWith(
                          color: AppColors.grey80,
                        ),
                      ),
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
