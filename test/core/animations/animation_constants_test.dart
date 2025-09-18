import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mbti_go/core/animations/animation_constants.dart';

void main() {
  group('AnimationConstants 테스트', () {
    test('애니메이션 지속시간이 올바르게 정의되어 있는지 확인', () {
      expect(AnimationConstants.fast, const Duration(milliseconds: 200));
      expect(AnimationConstants.normal, const Duration(milliseconds: 300));
      expect(AnimationConstants.slow, const Duration(milliseconds: 500));
      expect(AnimationConstants.verySlow, const Duration(milliseconds: 800));
    });

    test('지속시간이 논리적 순서를 따르는지 확인', () {
      expect(AnimationConstants.fast < AnimationConstants.normal, true);
      expect(AnimationConstants.normal < AnimationConstants.slow, true);
      expect(AnimationConstants.slow < AnimationConstants.verySlow, true);
    });

    test('애니메이션 커브가 올바르게 정의되어 있는지 확인', () {
      expect(AnimationConstants.bounceIn, Curves.bounceIn);
      expect(AnimationConstants.bounceOut, Curves.bounceOut);
      expect(AnimationConstants.elastic, Curves.elasticOut);
      expect(AnimationConstants.spring, Curves.fastLinearToSlowEaseIn);
      expect(AnimationConstants.pop, Curves.elasticInOut);
      expect(AnimationConstants.cardEntrance, Curves.easeOutBack);
      expect(AnimationConstants.buttonPress, Curves.easeInOut);
      expect(AnimationConstants.fadeIn, Curves.easeIn);
      expect(AnimationConstants.slideIn, Curves.easeOutCubic);
      expect(AnimationConstants.slideUp, Curves.easeOutCubic);
    });

    test('모든 커브가 유효한 Curve 객체인지 확인', () {
      expect(AnimationConstants.bounceIn, isA<Curve>());
      expect(AnimationConstants.bounceOut, isA<Curve>());
      expect(AnimationConstants.elastic, isA<Curve>());
      expect(AnimationConstants.spring, isA<Curve>());
      expect(AnimationConstants.pop, isA<Curve>());
      expect(AnimationConstants.cardEntrance, isA<Curve>());
      expect(AnimationConstants.buttonPress, isA<Curve>());
      expect(AnimationConstants.fadeIn, isA<Curve>());
      expect(AnimationConstants.slideIn, isA<Curve>());
      expect(AnimationConstants.slideUp, isA<Curve>());
    });

    group('staggerDelay 함수 테스트', () {
      test('기본 공식이 올바르게 적용되는지 확인', () {
        expect(AnimationConstants.staggerDelay(0),
            const Duration(milliseconds: 50));
        expect(AnimationConstants.staggerDelay(1),
            const Duration(milliseconds: 70));
        expect(AnimationConstants.staggerDelay(2),
            const Duration(milliseconds: 90));
        expect(AnimationConstants.staggerDelay(5),
            const Duration(milliseconds: 150));
        expect(AnimationConstants.staggerDelay(10),
            const Duration(milliseconds: 250));
      });

      test('음수 인덱스에 대한 처리', () {
        expect(AnimationConstants.staggerDelay(-1),
            const Duration(milliseconds: 30));
        expect(AnimationConstants.staggerDelay(-5),
            const Duration(milliseconds: -50));
      });

      test('큰 인덱스에 대한 처리', () {
        expect(AnimationConstants.staggerDelay(100),
            const Duration(milliseconds: 2050));
        expect(AnimationConstants.staggerDelay(1000),
            const Duration(milliseconds: 20050));
      });

      test('순차적 증가를 확인', () {
        for (int i = 0; i < 10; i++) {
          final current = AnimationConstants.staggerDelay(i);
          final next = AnimationConstants.staggerDelay(i + 1);
          expect(next.inMilliseconds - current.inMilliseconds, 20);
        }
      });
    });

    group('heroTag 함수 테스트', () {
      test('기본 패턴이 올바르게 생성되는지 확인', () {
        expect(AnimationConstants.heroTag('INTJ', 0), 'mbti_card_INTJ_0');
        expect(AnimationConstants.heroTag('ENFP', 5), 'mbti_card_ENFP_5');
        expect(AnimationConstants.heroTag('ISTP', 15), 'mbti_card_ISTP_15');
      });

      test('빈 문자열과 특수 문자 처리', () {
        expect(AnimationConstants.heroTag('', 0), 'mbti_card__0');
        expect(AnimationConstants.heroTag('INTJ', -1), 'mbti_card_INTJ_-1');
        expect(AnimationConstants.heroTag('TEST-TYPE', 1), 'mbti_card_TEST-TYPE_1');
      });

      test('고유성 보장', () {
        final tag1 = AnimationConstants.heroTag('INTJ', 0);
        final tag2 = AnimationConstants.heroTag('INTJ', 1);
        final tag3 = AnimationConstants.heroTag('ENFP', 0);

        expect(tag1 != tag2, true);
        expect(tag1 != tag3, true);
        expect(tag2 != tag3, true);
      });

      test('반환값이 String 타입인지 확인', () {
        expect(AnimationConstants.heroTag('INTJ', 0), isA<String>());
        expect(AnimationConstants.heroTag('ENFP', 5), isA<String>());
      });
    });
  });
}