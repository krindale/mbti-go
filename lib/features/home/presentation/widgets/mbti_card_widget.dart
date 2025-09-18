import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/animations/app_animations.dart';
import '../../data/models/mbti_type_model.dart';

/// MBTI 타입 카드 위젯
/// Single Responsibility: 개별 MBTI 타입 카드 표시
class MBTICardWidget extends StatelessWidget {
  final MBTITypeModel mbtiType;
  final int index;
  final VoidCallback onTap;

  const MBTICardWidget({
    super.key,
    required this.mbtiType,
    required this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final typeColor = AppColors.getMBTITypeColor(mbtiType.type);

    return TapBounceAnimation(
      onTap: onTap,
      child: Hero(
        tag: AppAnimations.heroTag(mbtiType.type, index),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: AppColors.grey20, width: 1),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withValues(alpha: 0.1),
                blurRadius: 2,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(typeColor),
              _buildImageSection(),
              _buildFooter(),
            ],
          ),
        ),
      ),
    );
  }

  /// Carbon-style 헤더 위젯
  Widget _buildHeader(Color typeColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.grey10,
        borderRadius: const BorderRadius.only(
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
              mbtiType.type,
              style: AppTextStyles.titleMedium.copyWith(
                color: AppColors.grey100,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
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
    );
  }

  /// 이미지 섹션 위젯
  Widget _buildImageSection() {
    return Expanded(
      flex: 3,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        color: AppColors.white,
        child: Center(
          child: Image.asset(
            mbtiType.image,
            fit: BoxFit.contain,
            width: double.infinity,
            height: double.infinity,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: AppColors.grey10,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Icon(
                  Icons.person_outline,
                  size: 60,
                  color: AppColors.grey50,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  /// Carbon-style 푸터 위젯
  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(top: BorderSide(color: AppColors.grey20, width: 1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            mbtiType.name,
            style: AppTextStyles.titleSmall.copyWith(
              color: AppColors.grey100,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            mbtiType.description,
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.grey60,
              fontSize: 11,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
