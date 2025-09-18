import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/animations/app_animations.dart';
import '../../../assessment/data/datasources/mbti_data.dart';
import 'mbti_type_card.dart';

/// MBTI 타입들을 그리드 형태로 표시하는 위젯
/// Single Responsibility: MBTI 타입 그리드 레이아웃 관리
class MBTITypeGrid extends StatelessWidget {
  final Function(String typeCode) onTypeSelected;

  const MBTITypeGrid({super.key, required this.onTypeSelected});

  @override
  Widget build(BuildContext context) {
    final mbtiTypes = MBTIData.getAllTypes();

    return Container(
      color: AppColors.grey10,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: mbtiTypes.length,
          itemBuilder: (context, index) {
            final mbtiType = mbtiTypes[index];
            return BounceInAnimation(
              delay: AppAnimations.staggerDelay(index),
              curve: AppAnimations.elastic,
              child: MBTITypeCard(
                mbtiType: mbtiType,
                index: index,
                onTap: () => onTypeSelected(mbtiType.code),
              ),
            );
          },
        ),
      ),
    );
  }
}
