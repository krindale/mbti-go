import 'package:flutter/material.dart';

/// 애니메이션 시스템의 통합 접근점을 제공하는 파사드 클래스
/// Single Responsibility: 분리된 애니메이션 컴포넌트들에 대한 단일 진입점 제공
///
/// 이 클래스는 하위 호환성을 위해 기존 API를 유지하면서
/// 내부적으로는 분리된 모듈들로 위임합니다.

// 분리된 애니메이션 컴포넌트들을 노출
export 'animation_constants.dart';
export 'bounce_animation.dart';
export 'slide_animation.dart';
export 'pulse_animation.dart';
export 'tap_bounce_animation.dart';
export 'shimmer_animation.dart';
export 'staggered_animation.dart';

import 'animation_constants.dart';

/// 하위 호환성을 위한 AppAnimations 클래스
/// 기존 코드가 AnimationConstants로 마이그레이션하는 동안 사용
@Deprecated('Use AnimationConstants instead')
class AppAnimations {
  // Animation Durations - AnimationConstants로 위임
  static const Duration fast = AnimationConstants.fast;
  static const Duration normal = AnimationConstants.normal;
  static const Duration slow = AnimationConstants.slow;
  static const Duration verySlow = AnimationConstants.verySlow;

  // Animation Curves - AnimationConstants로 위임
  static const Curve bounceIn = AnimationConstants.bounceIn;
  static const Curve bounceOut = AnimationConstants.bounceOut;
  static const Curve elastic = AnimationConstants.elastic;
  static const Curve spring = AnimationConstants.spring;
  static const Curve pop = AnimationConstants.pop;
  static const Curve cardEntrance = AnimationConstants.cardEntrance;
  static const Curve buttonPress = AnimationConstants.buttonPress;
  static const Curve fadeIn = AnimationConstants.fadeIn;
  static const Curve slideIn = AnimationConstants.slideIn;
  static const Curve slideUp = AnimationConstants.slideUp;

  // Utility Methods - AnimationConstants로 위임
  static Duration staggerDelay(int index) =>
      AnimationConstants.staggerDelay(index);
  static String heroTag(String type, int index) =>
      AnimationConstants.heroTag(type, index);
}
