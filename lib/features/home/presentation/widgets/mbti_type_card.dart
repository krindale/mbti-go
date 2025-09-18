import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/animations/app_animations.dart';
import '../../../assessment/domain/entities/mbti_type.dart';

/// 개별 MBTI 타입을 표시하는 카드 위젯
/// Single Responsibility: 단일 MBTI 타입의 시각적 표현
class MBTITypeCard extends StatelessWidget {
  final MBTIType mbtiType;
  final int index;
  final VoidCallback onTap;

  const MBTITypeCard({
    super.key,
    required this.mbtiType,
    required this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final typeColor = AppColors.getMBTITypeColor(mbtiType.code);

    return TapBounceAnimation(
      onTap: onTap,
      child: Hero(
        tag: AppAnimations.heroTag(mbtiType.code, index),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: AppColors.grey20, width: 1),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withOpacity(0.1),
                blurRadius: 2,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Carbon-style header with type indicator
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                decoration: const BoxDecoration(
                  color: AppColors.grey10,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4),
                    topRight: Radius.circular(4),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 3,
                      height: 20,
                      decoration: BoxDecoration(
                        color: typeColor,
                        borderRadius: BorderRadius.circular(1.5),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        mbtiType.code,
                        style: AppTextStyles.titleMedium.copyWith(
                          color: AppColors.grey100,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.grey20,
                        borderRadius: BorderRadius.circular(2),
                        border: Border.all(color: AppColors.grey40, width: 1),
                      ),
                      child: Text(
                        mbtiType.category,
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.grey70,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Content area
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Type name
                      Text(
                        mbtiType.name,
                        style: AppTextStyles.titleSmall.copyWith(
                          color: AppColors.grey100,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 6),

                      // Description
                      Expanded(
                        child: Text(
                          mbtiType.description,
                          style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.grey60,
                            height: 1.4,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),

                      const SizedBox(height: 8),

                      // Color indicator bar
                      Container(
                        height: 3,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: typeColor,
                          borderRadius: BorderRadius.circular(1.5),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
