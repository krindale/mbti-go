import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mbti_go/core/theme/app_colors.dart';

void main() {
  group('AppColors 테스트', () {
    test('기본 색상이 올바르게 정의되어 있는지 확인', () {
      // Primary colors
      expect(AppColors.primary, const Color(0xFF6366F1));
      expect(AppColors.primaryLight, const Color(0xFF818CF8));
      expect(AppColors.primaryDark, const Color(0xFF4F46E5));

      // Basic colors
      expect(AppColors.white, const Color(0xFFFFFFFF));
      expect(AppColors.black, const Color(0xFF000000));

      // Grey scale
      expect(AppColors.grey10, const Color(0xFFF9FAFB));
      expect(AppColors.grey20, const Color(0xFFF3F4F6));
      expect(AppColors.grey30, const Color(0xFFE5E7EB));
      expect(AppColors.grey40, const Color(0xFFD1D5DB));
      expect(AppColors.grey50, const Color(0xFF9CA3AF));
      expect(AppColors.grey60, const Color(0xFF6B7280));
      expect(AppColors.grey70, const Color(0xFF4B5563));
      expect(AppColors.grey80, const Color(0xFF374151));
      expect(AppColors.grey90, const Color(0xFF1F2937));
      expect(AppColors.grey100, const Color(0xFF111827));
    });

    test('MBTI 타입별 색상이 모든 16개 타입에 대해 정의되어 있는지 확인', () {
      // Analysts (NT)
      expect(AppColors.getMBTITypeColor('INTJ'), AppColors.analysts);
      expect(AppColors.getMBTITypeColor('INTP'), AppColors.analysts);
      expect(AppColors.getMBTITypeColor('ENTJ'), AppColors.analysts);
      expect(AppColors.getMBTITypeColor('ENTP'), AppColors.analysts);

      // Diplomats (NF)
      expect(AppColors.getMBTITypeColor('INFJ'), AppColors.diplomats);
      expect(AppColors.getMBTITypeColor('INFP'), AppColors.diplomats);
      expect(AppColors.getMBTITypeColor('ENFJ'), AppColors.diplomats);
      expect(AppColors.getMBTITypeColor('ENFP'), AppColors.diplomats);

      // Sentinels (SJ)
      expect(AppColors.getMBTITypeColor('ISTJ'), AppColors.sentinels);
      expect(AppColors.getMBTITypeColor('ISFJ'), AppColors.sentinels);
      expect(AppColors.getMBTITypeColor('ESTJ'), AppColors.sentinels);
      expect(AppColors.getMBTITypeColor('ESFJ'), AppColors.sentinels);

      // Explorers (SP)
      expect(AppColors.getMBTITypeColor('ISTP'), AppColors.explorers);
      expect(AppColors.getMBTITypeColor('ISFP'), AppColors.explorers);
      expect(AppColors.getMBTITypeColor('ESTP'), AppColors.explorers);
      expect(AppColors.getMBTITypeColor('ESFP'), AppColors.explorers);
    });

    test('존재하지 않는 MBTI 타입에 대해 기본 색상을 반환하는지 확인', () {
      expect(AppColors.getMBTITypeColor('INVALID'), AppColors.grey50);
      expect(AppColors.getMBTITypeColor(''), AppColors.grey50);
      expect(AppColors.getMBTITypeColor('XXXX'), AppColors.grey50);
    });

    test('MBTI 그룹별 색상이 고유한지 확인', () {
      expect(AppColors.analysts != AppColors.diplomats, true);
      expect(AppColors.analysts != AppColors.sentinels, true);
      expect(AppColors.analysts != AppColors.explorers, true);
      expect(AppColors.diplomats != AppColors.sentinels, true);
      expect(AppColors.diplomats != AppColors.explorers, true);
      expect(AppColors.sentinels != AppColors.explorers, true);
    });

    test('색상 값이 유효한 Color 객체인지 확인', () {
      expect(AppColors.primary, isA<Color>());
      expect(AppColors.getMBTITypeColor('INTJ'), isA<Color>());
      expect(AppColors.analysts, isA<Color>());
      expect(AppColors.diplomats, isA<Color>());
      expect(AppColors.sentinels, isA<Color>());
      expect(AppColors.explorers, isA<Color>());
    });
  });
}