import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

/// 언어 전환 스위치 위젯
/// Single Responsibility: 한국어/영어 전환 기능
class LanguageToggleSwitch extends StatelessWidget {
  final Locale currentLocale;
  final ValueChanged<Locale> onLocaleChanged;

  const LanguageToggleSwitch({
    super.key,
    required this.currentLocale,
    required this.onLocaleChanged,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isKorean = currentLocale.languageCode == 'ko';

    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: AppColors.grey10,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: AppColors.grey20,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildLanguageOption(
            text: l10n.koreanShort,
            isSelected: isKorean,
            onTap: () => onLocaleChanged(const Locale('ko')),
          ),
          _buildLanguageOption(
            text: l10n.englishShort,
            isSelected: !isKorean,
            onTap: () => onLocaleChanged(const Locale('en')),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageOption({
    required String text,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        margin: const EdgeInsets.all(2),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.grey80 : Colors.transparent,
          borderRadius: BorderRadius.circular(2),
          border: isSelected
              ? null
              : Border.all(color: Colors.transparent, width: 1),
        ),
        child: Text(
          text,
          style: AppTextStyles.bodySmall.copyWith(
            color: isSelected ? AppColors.white : AppColors.grey600,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}