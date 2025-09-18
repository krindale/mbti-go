import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/animations/app_animations.dart';
import '../../domain/entities/assessment_result.dart';

/// MBTI 결과 페이지 점수 분석 위젯
/// Single Responsibility: 세부 점수와 차트 표시
class ResultScoreBreakdownWidget extends StatelessWidget {
  final AssessmentResult result;

  const ResultScoreBreakdownWidget({super.key, required this.result});

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
                Text(
                  '세부 점수',
                  style: AppTextStyles.headlineSmall.copyWith(
                    color: AppColors.grey900,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                _buildScoreItem(
                  '외향성 vs 내향성',
                  'E',
                  'I',
                  result.extraversionScore,
                  result.introversionScore,
                ),
                _buildScoreItem(
                  '감각 vs 직관',
                  'S',
                  'N',
                  result.sensingScore,
                  result.intuitionScore,
                ),
                _buildScoreItem(
                  '사고 vs 감정',
                  'T',
                  'F',
                  result.thinkingScore,
                  result.feelingScore,
                ),
                _buildScoreItem(
                  '판단 vs 인식',
                  'J',
                  'P',
                  result.judgingScore,
                  result.perceivingScore,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildScoreItem(
    String title,
    String left,
    String right,
    double leftScore,
    double rightScore,
  ) {
    final dominant = leftScore > rightScore ? left : right;
    final strength = (leftScore - rightScore).abs();

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: AppTextStyles.bodyMedium.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '$dominant (${(strength * 100).toInt()}%)',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.grey80,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                left,
                style: AppTextStyles.bodySmall.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      height: 8,
                      decoration: const BoxDecoration(color: AppColors.grey30),
                    ),
                    FractionallySizedBox(
                      widthFactor: leftScore,
                      child: Container(
                        height: 8,
                        decoration: const BoxDecoration(
                          color: AppColors.grey80,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Text(
                right,
                style: AppTextStyles.bodySmall.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
