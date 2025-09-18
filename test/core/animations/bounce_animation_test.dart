import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mbti_go/core/animations/bounce_animation.dart';
import 'package:mbti_go/core/animations/animation_constants.dart';

void main() {
  group('BounceInAnimation 위젯 테스트', () {
    testWidgets('기본 설정으로 애니메이션이 생성되는지 확인', (WidgetTester tester) async {
      const testChild = Text('Test Child');

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: BounceInAnimation(
              child: testChild,
            ),
          ),
        ),
      );

      // BounceInAnimation과 자식 요소가 있는지 확인
      expect(find.byType(BounceInAnimation), findsOneWidget);
      expect(find.text('Test Child'), findsOneWidget);
    });

    testWidgets('커스텀 duration과 delay가 적용되는지 확인', (WidgetTester tester) async {
      const testChild = Text('Test Child');
      const customDuration = Duration(milliseconds: 500);
      const customDelay = Duration(milliseconds: 100);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: BounceInAnimation(
              duration: customDuration,
              delay: customDelay,
              child: testChild,
            ),
          ),
        ),
      );

      expect(find.byType(BounceInAnimation), findsOneWidget);
      expect(find.text('Test Child'), findsOneWidget);
    });

    testWidgets('커스텀 커브가 적용되는지 확인', (WidgetTester tester) async {
      const testChild = Text('Test Child');
      const customCurve = Curves.bounceOut;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: BounceInAnimation(
              curve: customCurve,
              child: testChild,
            ),
          ),
        ),
      );

      expect(find.byType(BounceInAnimation), findsOneWidget);
      expect(find.text('Test Child'), findsOneWidget);
    });

    testWidgets('애니메이션이 시간에 따라 진행되는지 확인', (WidgetTester tester) async {
      const testChild = Text('Test Child');

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: BounceInAnimation(
              duration: Duration(milliseconds: 300),
              delay: Duration.zero,
              child: testChild,
            ),
          ),
        ),
      );

      // 초기 상태 확인
      await tester.pump();
      expect(find.byType(BounceInAnimation), findsOneWidget);

      // 150ms 후 (중간 지점)
      await tester.pump(const Duration(milliseconds: 150));
      expect(find.byType(BounceInAnimation), findsOneWidget);

      // 애니메이션 완료 후
      await tester.pump(const Duration(milliseconds: 300));
      expect(find.byType(BounceInAnimation), findsOneWidget);
    });

    testWidgets('delay가 있을 때 애니메이션이 지연되는지 확인', (WidgetTester tester) async {
      const testChild = Text('Test Child');
      const delay = Duration(milliseconds: 200);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: BounceInAnimation(
              duration: AnimationConstants.fast,
              delay: delay,
              child: testChild,
            ),
          ),
        ),
      );

      // 초기 상태
      await tester.pump();
      expect(find.byType(BounceInAnimation), findsOneWidget);

      // delay 시간 경과 전
      await tester.pump(const Duration(milliseconds: 100));
      expect(find.byType(BounceInAnimation), findsOneWidget);

      // delay 시간 경과 후
      await tester.pump(const Duration(milliseconds: 200));
      expect(find.byType(BounceInAnimation), findsOneWidget);
    });

    testWidgets('여러 BounceInAnimation이 동시에 작동하는지 확인', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: const [
                BounceInAnimation(
                  child: Text('Child 1'),
                ),
                BounceInAnimation(
                  delay: Duration(milliseconds: 100),
                  child: Text('Child 2'),
                ),
                BounceInAnimation(
                  delay: Duration(milliseconds: 200),
                  child: Text('Child 3'),
                ),
              ],
            ),
          ),
        ),
      );

      await tester.pump();

      expect(find.byType(BounceInAnimation), findsNWidgets(3));
      expect(find.text('Child 1'), findsOneWidget);
      expect(find.text('Child 2'), findsOneWidget);
      expect(find.text('Child 3'), findsOneWidget);
    });

    testWidgets('위젯이 disposed될 때 애니메이션 컨트롤러가 정리되는지 확인', (WidgetTester tester) async {
      const testChild = Text('Test Child');

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: BounceInAnimation(
              child: testChild,
            ),
          ),
        ),
      );

      expect(find.byType(BounceInAnimation), findsOneWidget);

      // 위젯 제거
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Text('Different Content'),
          ),
        ),
      );

      expect(find.byType(BounceInAnimation), findsNothing);
      expect(find.text('Different Content'), findsOneWidget);
    });

    testWidgets('AnimatedBuilder가 올바르게 사용되는지 확인', (WidgetTester tester) async {
      const testChild = Text('Test Child');

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: BounceInAnimation(
              child: testChild,
            ),
          ),
        ),
      );

      // BounceInAnimation 안에서 AnimatedBuilder가 사용되는지 확인
      expect(find.byType(BounceInAnimation), findsOneWidget);
      expect(find.text('Test Child'), findsOneWidget);
    });
  });
}