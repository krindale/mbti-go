import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/animations/app_animations.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../assessment/domain/entities/mbti_type.dart';

/// MBTI 상세 정보 다이얼로그
/// Single Responsibility: MBTI 타입 상세 정보 표시 다이얼로그
class MBTIDetailDialog extends StatelessWidget {
  final MBTIType mbtiType;
  final VoidCallback onDetailPressed;

  const MBTIDetailDialog({
    super.key,
    required this.mbtiType,
    required this.onDetailPressed,
  });

  /// 다이얼로그 표시 메서드
  static void show({
    required BuildContext context,
    required MBTIType mbtiType,
    required VoidCallback onDetailPressed,
  }) {
    HapticFeedback.mediumImpact();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SlideInAnimation(
          beginOffset: const Offset(0, 0.3),
          child: MBTIDetailDialog(
            mbtiType: mbtiType,
            onDetailPressed: onDetailPressed,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.2),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [_buildImageHeader(context), _buildContent(context)],
        ),
      ),
    );
  }

  /// 이미지 헤더 섹션
  Widget _buildImageHeader(BuildContext context) {
    return Container(
      height: 280,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        color: Colors.white,
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            child: Image.asset(
              mbtiType.imagePath,
              height: 280,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Center(
                    child: Icon(
                      Icons.person,
                      size: 80,
                      color: AppColors.grey400,
                    ),
                  ),
                );
              },
            ),
          ),
          _buildCloseButton(context),
        ],
      ),
    );
  }

  /// 닫기 버튼 위젯
  Widget _buildCloseButton(BuildContext context) {
    return Positioned(
      top: 16,
      right: 16,
      child: TapBounceAnimation(
        onTap: () => Navigator.of(context).pop(),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.white.withValues(alpha: 0.9),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.close, color: AppColors.grey700, size: 20),
        ),
      ),
    );
  }

  /// 콘텐츠 섹션
  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Text(
            '${mbtiType.code} - ${mbtiType.name}',
            style: AppTextStyles.headlineSmall.copyWith(
              color: AppColors.grey90,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            _getBriefDescription(context, mbtiType.code),
            style: AppTextStyles.mbtiDescription,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          _buildDetailButton(context),
        ],
      ),
    );
  }

  /// 간략한 설명 가져오기
  String _getBriefDescription(BuildContext context, String code) {
    final l10n = AppLocalizations.of(context)!;
    final lowerCode = code.toLowerCase();
    switch (lowerCode) {
      case 'enfj': return l10n.enfj_brief;
      case 'enfp': return l10n.enfp_brief;
      case 'entj': return l10n.entj_brief;
      case 'entp': return l10n.entp_brief;
      case 'esfj': return l10n.esfj_brief;
      case 'esfp': return l10n.esfp_brief;
      case 'estj': return l10n.estj_brief;
      case 'estp': return l10n.estp_brief;
      case 'infj': return l10n.infj_brief;
      case 'infp': return l10n.infp_brief;
      case 'intj': return l10n.intj_brief;
      case 'intp': return l10n.intp_brief;
      case 'isfj': return l10n.isfj_brief;
      case 'isfp': return l10n.isfp_brief;
      case 'istj': return l10n.istj_brief;
      case 'istp': return l10n.istp_brief;
      default: return mbtiType.description;
    }
  }

  /// 자세히 보기 버튼
  Widget _buildDetailButton(BuildContext context) {
    return TapBounceAnimation(
      onTap: () {
        Navigator.of(context).pop();
        onDetailPressed();
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: AppColors.grey90,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          AppLocalizations.of(context)!.viewDetails,
          style: AppTextStyles.buttonText,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
