import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

/// MBTI 검사 페이지 헤더 위젯
/// Single Responsibility: 헤더 영역과 뒤로가기 버튼 표시
class AssessmentHeaderWidget extends StatelessWidget {
  final int currentQuestionIndex;
  final int totalQuestions;
  final VoidCallback onBackPressed;

  const AssessmentHeaderWidget({
    super.key,
    required this.currentQuestionIndex,
    required this.totalQuestions,
    required this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        children: [
          GestureDetector(
            onTap: onBackPressed,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(color: AppColors.grey30, width: 1),
              ),
              child: Icon(Icons.arrow_back, color: AppColors.grey80, size: 20),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'MBTI 간편 검사',
                  style: AppTextStyles.headlineSmall.copyWith(
                    color: AppColors.grey900,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${currentQuestionIndex + 1} / $totalQuestions',
                  style: AppTextStyles.bodyMedium.copyWith(
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
