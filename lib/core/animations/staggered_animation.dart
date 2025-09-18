import 'package:flutter/material.dart';
import 'animation_constants.dart';
import 'bounce_animation.dart';

/// 스태거드 애니메이션을 위한 헬퍼 위젯
/// Single Responsibility: 순차적 애니메이션 배치만 관리
class StaggeredAnimationBuilder extends StatelessWidget {
  final List<Widget> children;
  final Duration staggerDelay;
  final Duration animationDuration;
  final Curve curve;

  const StaggeredAnimationBuilder({
    super.key,
    required this.children,
    this.staggerDelay = const Duration(milliseconds: 100),
    this.animationDuration = AnimationConstants.normal,
    this.curve = AnimationConstants.cardEntrance,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: children.asMap().entries.map((entry) {
        final index = entry.key;
        final child = entry.value;

        return BounceInAnimation(
          delay: Duration(milliseconds: index * staggerDelay.inMilliseconds),
          duration: animationDuration,
          curve: curve,
          child: child,
        );
      }).toList(),
    );
  }
}
