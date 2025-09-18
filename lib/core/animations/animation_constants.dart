import 'package:flutter/material.dart';

/// 애니메이션 상수 및 헬퍼 함수를 제공하는 클래스
/// Single Responsibility: 애니메이션 관련 상수값 및 유틸리티 메서드만 관리
class AnimationConstants {
  // Animation Durations
  static const Duration fast = Duration(milliseconds: 200);
  static const Duration normal = Duration(milliseconds: 300);
  static const Duration slow = Duration(milliseconds: 500);
  static const Duration verySlow = Duration(milliseconds: 800);

  // Animation Curves
  static const Curve bounceIn = Curves.bounceIn;
  static const Curve bounceOut = Curves.bounceOut;
  static const Curve elastic = Curves.elasticOut;
  static const Curve spring = Curves.fastLinearToSlowEaseIn;
  static const Curve pop = Curves.elasticInOut;

  // Preset Animations
  static const Curve cardEntrance = Curves.easeOutBack;
  static const Curve buttonPress = Curves.easeInOut;
  static const Curve fadeIn = Curves.easeIn;
  static const Curve slideIn = Curves.easeOutCubic;
  static const Curve slideUp = Curves.easeOutCubic;

  // Stagger Delays
  static Duration staggerDelay(int index) {
    return Duration(milliseconds: 50 + (index * 20));
  }

  // Hero Animation Tags
  static String heroTag(String type, int index) {
    return 'mbti_card_${type}_$index';
  }
}
