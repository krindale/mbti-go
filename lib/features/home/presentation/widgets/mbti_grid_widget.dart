import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/animations/app_animations.dart';
import '../../data/models/mbti_type_model.dart';
import '../../data/datasources/mbti_home_data.dart';
import 'mbti_card_widget.dart';

/// MBTI 타입 그리드 위젯
/// Single Responsibility: MBTI 타입들을 그리드 형태로 표시
class MBTIGridWidget extends StatelessWidget {
  final Function(MBTITypeModel) onTypeSelected;

  const MBTIGridWidget({super.key, required this.onTypeSelected});

  @override
  Widget build(BuildContext context) {
    final mbtiTypes = MBTIHomeData.getAllTypes();

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
              child: MBTICardWidget(
                mbtiType: mbtiType,
                index: index,
                onTap: () => onTypeSelected(mbtiType),
              ),
            );
          },
        ),
      ),
    );
  }
}
