import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/animations/app_animations.dart';
import '../../domain/entities/mbti_type.dart';

/// MBTI 타입 상세 페이지 성격 특성 카드 위젯
/// Single Responsibility: 성격 특성 설명 표시
class TypeDetailDescriptionCardWidget extends StatelessWidget {
  final MBTIType type;

  const TypeDetailDescriptionCardWidget({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return BounceInAnimation(
      delay: AppAnimations.staggerDelay(1),
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
                      '성격 특성',
                      style: AppTextStyles.headlineSmall.copyWith(
                        color: AppColors.grey900,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _buildTraitItem('외향성 vs 내향성', type.code[0]),
                _buildTraitItem('감각 vs 직관', type.code[1]),
                _buildTraitItem('사고 vs 감정', type.code[2]),
                _buildTraitItem('판단 vs 인식', type.code[3]),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTraitItem(String trait, String preference) {
    final Map<String, String> traitDescriptions = {
      'E': '외향적 - 에너지를 외부에서 얻으며 사교적',
      'I': '내향적 - 에너지를 내부에서 얻으며 신중함',
      'S': '감각적 - 현실적이고 구체적인 정보 선호',
      'N': '직관적 - 가능성과 미래 지향적 사고',
      'T': '사고형 - 논리와 객관성을 중시',
      'F': '감정형 - 감정과 가치를 중시',
      'J': '판단형 - 계획적이고 체계적',
      'P': '인식형 - 유연하고 적응적',
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
