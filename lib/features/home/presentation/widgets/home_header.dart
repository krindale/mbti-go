import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/animations/app_animations.dart';
import '../../../../l10n/app_localizations.dart';

/// 홈페이지 상단 헤더 위젯
/// Single Responsibility: 앱 제목과 검사 시작 버튼 표시
class HomeHeader extends StatelessWidget {
  final VoidCallback onStartAssessment;

  const HomeHeader({super.key, required this.onStartAssessment});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Column(
        children: [
          // 앱 제목
          BounceInAnimation(
            delay: const Duration(milliseconds: 600),
            child: Text(
              'MBTI Go',
              style: AppTextStyles.displayLarge.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 12),

          // 부제목
          BounceInAnimation(
            delay: const Duration(milliseconds: 800),
            child: Text(
              l10n.homeSubtitleOld,
              style: AppTextStyles.headlineSmall.copyWith(
                color: AppColors.grey600,
              ),
            ),
          ),
          const SizedBox(height: 32),

          // 검사 시작 버튼
          BounceInAnimation(
            delay: const Duration(milliseconds: 1000),
            child: TapBounceAnimation(
              child: Container(
                width: double.infinity,
                height: 56,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.primary, AppColors.primaryLight],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(28),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.3),
                      blurRadius: 16,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: onStartAssessment,
                    borderRadius: BorderRadius.circular(28),
                    child: Center(
                      child: Text(
                        l10n.startAssessment,
                        style: AppTextStyles.headlineSmall.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // 설명 텍스트
          BounceInAnimation(
            delay: const Duration(milliseconds: 1200),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                l10n.exploreTypesDescription.replaceAll('\\n', '\n'),
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyLarge.copyWith(
                  color: AppColors.grey500,
                  height: 1.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
