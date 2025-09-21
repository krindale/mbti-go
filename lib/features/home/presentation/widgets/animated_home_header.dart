import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/providers/locale_provider.dart';
import '../../../../core/widgets/language_toggle_switch.dart';

/// 애니메이션이 포함된 홈 헤더 위젯
/// Single Responsibility: 홈페이지 상단 헤더 표시
class AnimatedHomeHeader extends StatelessWidget {
  final Animation<double> fadeAnimation;
  final Animation<Offset> slideAnimation;

  const AnimatedHomeHeader({
    super.key,
    required this.fadeAnimation,
    required this.slideAnimation,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final localeProvider = Provider.of<LocaleProvider>(context);

    return SlideTransition(
      position: slideAnimation,
      child: FadeTransition(
        opacity: fadeAnimation,
        child: Container(
          padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border(
              bottom: BorderSide(color: AppColors.grey20, width: 1),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 4,
                height: 32,
                decoration: const BoxDecoration(color: AppColors.grey80),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title row with language toggle
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            l10n.homeTitle,
                            style: AppTextStyles.headlineMedium.copyWith(
                              color: AppColors.grey100,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: LanguageToggleSwitch(
                            currentLocale: localeProvider.locale,
                            onLocaleChanged: (locale) {
                              localeProvider.setLocale(locale);
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      l10n.homeSubtitle,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.grey70,
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
