import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/animations/app_animations.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../assessment/domain/entities/mbti_type.dart';
import '../../../assessment/data/datasources/mbti_types_repository.dart';
import '../../../assessment/data/services/mbti_localization_service.dart';
import 'mbti_card_widget.dart';

/// MBTI 타입 그리드 위젯
/// Single Responsibility: MBTI 타입들을 그리드 형태로 표시
class MBTIGridWidget extends StatelessWidget {
  final Function(MBTIType) onTypeSelected;

  const MBTIGridWidget({super.key, required this.onTypeSelected});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final localizationService = MBTILocalizationService(l10n);
    final repository = MBTITypesRepository(localizationService);
    final mbtiTypes = repository.getAllTypes();

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
              delay: AnimationConstants.staggerDelay(index),
              curve: AnimationConstants.elastic,
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
