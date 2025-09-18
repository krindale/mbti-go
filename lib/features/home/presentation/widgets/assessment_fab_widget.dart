import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/animations/app_animations.dart';
import '../../../../core/animations/page_transitions.dart';
import '../../../assessment/presentation/pages/assessment_page.dart';

/// 평가 시작 플로팅 액션 버튼 위젯
/// Single Responsibility: MBTI 평가 시작 버튼 표시
class AssessmentFABWidget extends StatelessWidget {
  const AssessmentFABWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PulseAnimation(
      child: FloatingActionButton.extended(
        onPressed: () => _navigateToAssessment(context),
        icon: const Icon(Icons.quiz),
        label: const Text('검사하기'),
        backgroundColor: AppColors.grey90,
      ),
    );
  }

  /// 평가 페이지로 이동
  void _navigateToAssessment(BuildContext context) {
    HapticFeedback.lightImpact();
    Navigator.of(
      context,
    ).push(PageTransitions.slideRight(const AssessmentPage()));
  }
}
