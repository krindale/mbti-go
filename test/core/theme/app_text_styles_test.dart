import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mbti_go/core/theme/app_text_styles.dart';

void main() {
  group('AppTextStyles 테스트', () {
    test('모든 텍스트 스타일이 정의되어 있는지 확인', () {
      // Display styles
      expect(AppTextStyles.displayLarge, isA<TextStyle>());
      expect(AppTextStyles.displayMedium, isA<TextStyle>());
      expect(AppTextStyles.displaySmall, isA<TextStyle>());

      // Headline styles
      expect(AppTextStyles.headlineLarge, isA<TextStyle>());
      expect(AppTextStyles.headlineMedium, isA<TextStyle>());
      expect(AppTextStyles.headlineSmall, isA<TextStyle>());

      // Title styles
      expect(AppTextStyles.titleLarge, isA<TextStyle>());
      expect(AppTextStyles.titleMedium, isA<TextStyle>());
      expect(AppTextStyles.titleSmall, isA<TextStyle>());

      // Body styles
      expect(AppTextStyles.bodyLarge, isA<TextStyle>());
      expect(AppTextStyles.bodyMedium, isA<TextStyle>());
      expect(AppTextStyles.bodySmall, isA<TextStyle>());

      // Label styles
      expect(AppTextStyles.labelLarge, isA<TextStyle>());
      expect(AppTextStyles.labelMedium, isA<TextStyle>());
      expect(AppTextStyles.labelSmall, isA<TextStyle>());
    });

    test('글꼴 크기가 올바르게 설정되어 있는지 확인', () {
      // Display styles - Carbon Design System inspired
      expect(AppTextStyles.displayLarge.fontSize, 54);
      expect(AppTextStyles.displayMedium.fontSize, 42);
      expect(AppTextStyles.displaySmall.fontSize, 32);

      // Headline styles - Carbon productive heading
      expect(AppTextStyles.headlineLarge.fontSize, 28);
      expect(AppTextStyles.headlineMedium.fontSize, 24);
      expect(AppTextStyles.headlineSmall.fontSize, 20);

      // Title styles - Carbon body text styles
      expect(AppTextStyles.titleLarge.fontSize, 18);
      expect(AppTextStyles.titleMedium.fontSize, 16);
      expect(AppTextStyles.titleSmall.fontSize, 14);

      // Body styles - Carbon body styles
      expect(AppTextStyles.bodyLarge.fontSize, 16);
      expect(AppTextStyles.bodyMedium.fontSize, 14);
      expect(AppTextStyles.bodySmall.fontSize, 12);

      // Label styles - Carbon label styles
      expect(AppTextStyles.labelLarge.fontSize, 14);
      expect(AppTextStyles.labelMedium.fontSize, 12);
      expect(AppTextStyles.labelSmall.fontSize, 11);
    });

    test('글꼴 무게가 올바르게 설정되어 있는지 확인', () {
      // Display styles - light weight (Carbon uses w300)
      expect(AppTextStyles.displayLarge.fontWeight, FontWeight.w300);
      expect(AppTextStyles.displayMedium.fontWeight, FontWeight.w300);
      expect(AppTextStyles.displaySmall.fontWeight, FontWeight.w300);

      // Headline styles - regular weight
      expect(AppTextStyles.headlineLarge.fontWeight, FontWeight.w400);
      expect(AppTextStyles.headlineMedium.fontWeight, FontWeight.w400);
      expect(AppTextStyles.headlineSmall.fontWeight, FontWeight.w400);

      // Title styles - semibold weight (Carbon uses w600)
      expect(AppTextStyles.titleLarge.fontWeight, FontWeight.w600);
      expect(AppTextStyles.titleMedium.fontWeight, FontWeight.w600);
      expect(AppTextStyles.titleSmall.fontWeight, FontWeight.w600);

      // Body styles - regular weight
      expect(AppTextStyles.bodyLarge.fontWeight, FontWeight.w400);
      expect(AppTextStyles.bodyMedium.fontWeight, FontWeight.w400);
      expect(AppTextStyles.bodySmall.fontWeight, FontWeight.w400);

      // Label styles - semibold weight (Carbon uses w600)
      expect(AppTextStyles.labelLarge.fontWeight, FontWeight.w600);
      expect(AppTextStyles.labelMedium.fontWeight, FontWeight.w600);
      expect(AppTextStyles.labelSmall.fontWeight, FontWeight.w600);
    });

    test('스타일 수정 메서드가 올바르게 작동하는지 확인', () {
      const testColor = Color(0xFF123456);
      const testFontSize = 20.0;
      const testFontWeight = FontWeight.bold;

      // copyWith 메서드 테스트
      final modifiedStyle = AppTextStyles.bodyMedium.copyWith(
        color: testColor,
        fontSize: testFontSize,
        fontWeight: testFontWeight,
      );

      expect(modifiedStyle.color, testColor);
      expect(modifiedStyle.fontSize, testFontSize);
      expect(modifiedStyle.fontWeight, testFontWeight);

      // 원본 스타일은 변경되지 않았는지 확인
      expect(AppTextStyles.bodyMedium.color, isNot(testColor));
      expect(AppTextStyles.bodyMedium.fontSize, isNot(testFontSize));
      expect(AppTextStyles.bodyMedium.fontWeight, isNot(testFontWeight));
    });

    test('텍스트 스타일 크기 순서가 올바른지 확인', () {
      // Display 그룹 내에서 크기 순서
      expect(AppTextStyles.displayLarge.fontSize! >
          AppTextStyles.displayMedium.fontSize!, true);
      expect(AppTextStyles.displayMedium.fontSize! >
          AppTextStyles.displaySmall.fontSize!, true);

      // Headline 그룹 내에서 크기 순서
      expect(AppTextStyles.headlineLarge.fontSize! >
          AppTextStyles.headlineMedium.fontSize!, true);
      expect(AppTextStyles.headlineMedium.fontSize! >
          AppTextStyles.headlineSmall.fontSize!, true);

      // Title 그룹 내에서 크기 순서
      expect(AppTextStyles.titleLarge.fontSize! >
          AppTextStyles.titleMedium.fontSize!, true);
      expect(AppTextStyles.titleMedium.fontSize! >
          AppTextStyles.titleSmall.fontSize!, true);

      // Body 그룹 내에서 크기 순서
      expect(AppTextStyles.bodyLarge.fontSize! >
          AppTextStyles.bodyMedium.fontSize!, true);
      expect(AppTextStyles.bodyMedium.fontSize! >
          AppTextStyles.bodySmall.fontSize!, true);

      // Label 그룹 내에서 크기 순서
      expect(AppTextStyles.labelLarge.fontSize! >
          AppTextStyles.labelMedium.fontSize!, true);
      expect(AppTextStyles.labelMedium.fontSize! >
          AppTextStyles.labelSmall.fontSize!, true);
    });
  });
}