import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/animations/app_animations.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/mbti_type.dart';

/// MBTI 타입 상세 페이지 성격 특성 카드 위젯
/// Single Responsibility: 성격 특성 설명 표시
class TypeDetailDescriptionCardWidget extends StatelessWidget {
  final MBTIType type;

  const TypeDetailDescriptionCardWidget({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return BounceInAnimation(
      delay: AnimationConstants.staggerDelay(1),
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
                    Icon(Icons.psychology, color: AppColors.grey70, size: 24),
                    const SizedBox(width: 8),
                    Text(
                      AppLocalizations.of(context)!.personalityTraits,
                      style: AppTextStyles.headlineSmall.copyWith(
                        color: AppColors.grey900,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _buildTraitItem(context, AppLocalizations.of(context)!.extroversionVsIntroversion, type.code[0]),
                _buildTraitItem(context, AppLocalizations.of(context)!.sensingVsIntuition, type.code[1]),
                _buildTraitItem(context, AppLocalizations.of(context)!.thinkingVsFeeling, type.code[2]),
                _buildTraitItem(context, AppLocalizations.of(context)!.judgingVsPerceiving, type.code[3]),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTraitItem(BuildContext context, String trait, String preference) {
    final l10n = AppLocalizations.of(context)!;
    final Map<String, String> traitDescriptions = {
      'E': l10n.extrovertedDescription,
      'I': l10n.introvertedDescription,
      'S': l10n.sensingDescription,
      'N': l10n.intuitiveDescription,
      'T': l10n.thinkingDescription,
      'F': l10n.feelingDescription,
      'J': l10n.judgingDescription,
      'P': l10n.perceivingDescription,
    };

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: AppColors.grey80,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                preference,
                style: AppTextStyles.titleMedium.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  trait,
                  style: AppTextStyles.bodyMedium.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  traitDescriptions[preference] ?? '',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.grey600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
