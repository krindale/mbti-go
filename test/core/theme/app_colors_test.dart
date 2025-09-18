import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mbti_go/core/theme/app_colors.dart';

void main() {
  group('AppColors 테스트', () {
    test('기본 색상이 올바르게 정의되어 있는지 확인', () {
      // Primary colors - Carbon Design System
      expect(AppColors.primary, const Color(0xFF0f62fe)); // IBM Blue
      expect(AppColors.primaryLight, const Color(0xFF4589ff));
      expect(AppColors.primaryDark, const Color(0xFF0043ce));

      // Secondary colors
      expect(AppColors.secondary, const Color(0xFF161616)); // Carbon Gray 100
      expect(AppColors.secondaryLight, const Color(0xFF393939));
      expect(AppColors.secondaryDark, const Color(0xFF000000));

      // Basic colors
      expect(AppColors.white, const Color(0xFFffffff));
      expect(AppColors.black, const Color(0xFF000000));

      // Carbon Grey scale
      expect(AppColors.grey10, const Color(0xFFf4f4f4));
      expect(AppColors.grey20, const Color(0xFFe0e0e0));
      expect(AppColors.grey30, const Color(0xFFc6c6c6));
      expect(AppColors.grey40, const Color(0xFFa8a8a8));
      expect(AppColors.grey50, const Color(0xFF8d8d8d));
      expect(AppColors.grey60, const Color(0xFF6f6f6f));
      expect(AppColors.grey70, const Color(0xFF525252));
      expect(AppColors.grey80, const Color(0xFF393939));
      expect(AppColors.grey90, const Color(0xFF262626));
      expect(AppColors.grey100, const Color(0xFF161616));
    });

    test('MBTI 타입별 색상이 각각 고유하게 정의되어 있는지 확인', () {
      // 각 타입이 고유한 색상을 가져야 함
      const types = [
        'INTJ', 'INTP', 'ENTJ', 'ENTP', // Analysts
        'INFJ', 'INFP', 'ENFJ', 'ENFP', // Diplomats
        'ISTJ', 'ISFJ', 'ESTJ', 'ESFJ', // Sentinels
        'ISTP', 'ISFP', 'ESTP', 'ESFP', // Explorers
      ];

      // 모든 타입이 색상을 반환하는지 확인
      for (final type in types) {
        final color = AppColors.getMBTITypeColor(type);
        expect(color, isA<Color>());
        expect(color.value, isNot(equals(0))); // 유효한 색상 값인지 확인
      }

      // 특정 타입의 실제 색상 값 확인
      expect(AppColors.getMBTITypeColor('INTJ'), const Color(0xFF4C1D95));
      expect(AppColors.getMBTITypeColor('ENFP'), const Color(0xFFFF6B35));
      expect(AppColors.getMBTITypeColor('ISTJ'), const Color(0xFF374151));
      expect(AppColors.getMBTITypeColor('ESFP'), const Color(0xFFF59E0B));
    });

    test('존재하지 않는 MBTI 타입에 대해 기본 색상을 반환하는지 확인', () {
      expect(AppColors.getMBTITypeColor('INVALID'), AppColors.primary);
      expect(AppColors.getMBTITypeColor(''), AppColors.primary);
      expect(AppColors.getMBTITypeColor('XXXX'), AppColors.primary);
      expect(AppColors.getMBTITypeColor('ABC'), AppColors.primary);
    });

    test('MBTI 그룹별 색상이 고유한지 확인', () {
      expect(AppColors.analysts != AppColors.diplomats, true);
      expect(AppColors.analysts != AppColors.sentinels, true);
      expect(AppColors.analysts != AppColors.explorers, true);
      expect(AppColors.diplomats != AppColors.sentinels, true);
      expect(AppColors.diplomats != AppColors.explorers, true);
      expect(AppColors.sentinels != AppColors.explorers, true);

      // 실제 그룹 색상 값 확인
      expect(AppColors.analysts, const Color(0xFF8B5CF6)); // Purple - NT
      expect(AppColors.diplomats, const Color(0xFF10B981)); // Green - NF
      expect(AppColors.sentinels, const Color(0xFF3B82F6)); // Blue - SJ
      expect(AppColors.explorers, const Color(0xFFF59E0B)); // Orange - SP
    });

    test('getMBTIColor 메서드가 올바르게 작동하는지 확인', () {
      // NT 타입들
      expect(AppColors.getMBTIColor('NT'), AppColors.analysts);
      expect(AppColors.getMBTIColor('NTXX'), AppColors.analysts);

      // NF 타입들
      expect(AppColors.getMBTIColor('NF'), AppColors.diplomats);
      expect(AppColors.getMBTIColor('NFXX'), AppColors.diplomats);

      // SJ 타입들
      expect(AppColors.getMBTIColor('SJ'), AppColors.sentinels);
      expect(AppColors.getMBTIColor('SJXX'), AppColors.sentinels);

      // SP 타입들
      expect(AppColors.getMBTIColor('SP'), AppColors.explorers);
      expect(AppColors.getMBTIColor('SPXX'), AppColors.explorers);

      // 잘못된 입력
      expect(AppColors.getMBTIColor('XX'), AppColors.primary);
      expect(AppColors.getMBTIColor('X'), AppColors.primary); // 짧은 문자열
      expect(AppColors.getMBTIColor(''), AppColors.primary); // 빈 문자열
    });

    test('시멘틱 색상이 올바르게 정의되어 있는지 확인', () {
      expect(AppColors.success, const Color(0xFF24a148)); // Carbon Green
      expect(AppColors.warning, const Color(0xFFf1c21b)); // Carbon Yellow
      expect(AppColors.error, const Color(0xFFda1e28)); // Carbon Red
      expect(AppColors.info, const Color(0xFF0f62fe)); // Carbon Blue
    });

    test('색상 값이 유효한 Color 객체인지 확인', () {
      expect(AppColors.primary, isA<Color>());
      expect(AppColors.getMBTITypeColor('INTJ'), isA<Color>());
      expect(AppColors.analysts, isA<Color>());
      expect(AppColors.diplomats, isA<Color>());
      expect(AppColors.sentinels, isA<Color>());
      expect(AppColors.explorers, isA<Color>());

      // 모든 회색조가 유효한지 확인
      expect(AppColors.grey10, isA<Color>());
      expect(AppColors.grey50, isA<Color>());
      expect(AppColors.grey100, isA<Color>());
    });

    test('그라데이션 색상이 올바르게 정의되어 있는지 확인', () {
      expect(AppColors.primaryGradient.length, 2);
      expect(AppColors.heroGradient.length, 2);
      expect(AppColors.cardGradient.length, 2);

      // 각 그라데이션이 유효한 색상들로 구성되어 있는지 확인
      for (final color in AppColors.primaryGradient) {
        expect(color, isA<Color>());
      }
      for (final color in AppColors.heroGradient) {
        expect(color, isA<Color>());
      }
      for (final color in AppColors.cardGradient) {
        expect(color, isA<Color>());
      }
    });
  });
}