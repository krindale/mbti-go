import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mbti_go/core/animations/page_transitions.dart';

void main() {
  group('PageTransitions 테스트', () {
    const testPage = Scaffold(
      body: Center(
        child: Text('Test Page'),
      ),
    );

    testWidgets('slideRight 전환이 올바르게 작동하는지 확인', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(tester.element(find.byType(ElevatedButton)))
                      .push(PageTransitions.slideRight(testPage));
                },
                child: const Text('Navigate'),
              ),
            ),
          ),
        ),
      );

      // 초기 상태
      expect(find.text('Navigate'), findsOneWidget);
      expect(find.text('Test Page'), findsNothing);

      // 네비게이션 실행
      await tester.tap(find.text('Navigate'));
      await tester.pumpAndSettle();

      // 전환 완료 후
      expect(find.text('Test Page'), findsOneWidget);
    });

    testWidgets('slideLeft 전환이 올바르게 작동하는지 확인', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(tester.element(find.byType(ElevatedButton)))
                      .push(PageTransitions.slideLeft(testPage));
                },
                child: const Text('Navigate'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Navigate'));
      await tester.pumpAndSettle();

      expect(find.text('Test Page'), findsOneWidget);
    });

    testWidgets('slideUp 전환이 올바르게 작동하는지 확인', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(tester.element(find.byType(ElevatedButton)))
                      .push(PageTransitions.slideUp(testPage));
                },
                child: const Text('Navigate'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Navigate'));
      await tester.pumpAndSettle();

      expect(find.text('Test Page'), findsOneWidget);
    });

    testWidgets('slideDown 전환이 올바르게 작동하는지 확인', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(tester.element(find.byType(ElevatedButton)))
                      .push(PageTransitions.slideDown(testPage));
                },
                child: const Text('Navigate'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Navigate'));
      await tester.pumpAndSettle();

      expect(find.text('Test Page'), findsOneWidget);
    });

    testWidgets('fade 전환이 올바르게 작동하는지 확인', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(tester.element(find.byType(ElevatedButton)))
                      .push(PageTransitions.fade(testPage));
                },
                child: const Text('Navigate'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Navigate'));
      await tester.pumpAndSettle();

      expect(find.text('Test Page'), findsOneWidget);
    });

    testWidgets('slideRightWithBackground 전환이 올바르게 작동하는지 확인', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(tester.element(find.byType(ElevatedButton)))
                      .push(PageTransitions.slideRightWithBackground(testPage));
                },
                child: const Text('Navigate'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Navigate'));
      await tester.pumpAndSettle();

      expect(find.text('Test Page'), findsOneWidget);
    });

    testWidgets('뒤로 가기가 올바르게 작동하는지 확인', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(tester.element(find.byType(ElevatedButton)))
                      .push(PageTransitions.slideRight(testPage));
                },
                child: const Text('Navigate'),
              ),
            ),
          ),
        ),
      );

      // 앞으로 이동
      await tester.tap(find.text('Navigate'));
      await tester.pumpAndSettle();
      expect(find.text('Test Page'), findsOneWidget);

      // 뒤로 이동
      Navigator.of(tester.element(find.text('Test Page'))).pop();
      await tester.pumpAndSettle();
      expect(find.text('Navigate'), findsOneWidget);
    });

    testWidgets('전환 중 애니메이션이 진행되는지 확인', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(tester.element(find.byType(ElevatedButton)))
                      .push(PageTransitions.slideRight(testPage));
                },
                child: const Text('Navigate'),
              ),
            ),
          ),
        ),
      );

      // 네비게이션 시작
      await tester.tap(find.text('Navigate'));
      await tester.pump(); // 첫 프레임

      // 애니메이션 중간 상태 확인
      await tester.pump(const Duration(milliseconds: 150));

      // 여전히 전환 중이어야 함
      expect(find.byType(SlideTransition), findsWidgets);

      // 애니메이션 완료
      await tester.pumpAndSettle();
      expect(find.text('Test Page'), findsOneWidget);
    });

    testWidgets('다양한 페이지 타입과 호환되는지 확인', (WidgetTester tester) async {
      const textPage = Text('Text Page');
      const containerPage = Material(child: Center(child: Text('Container Page')));
      final customPage = Builder(
        builder: (context) => const Scaffold(
          body: Center(child: Text('Custom Page')),
        ),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(tester.element(find.byType(ElevatedButton).first))
                        .push(PageTransitions.slideRight(textPage));
                  },
                  child: const Text('Text'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(tester.element(find.byType(ElevatedButton).at(1)))
                        .push(PageTransitions.slideLeft(containerPage));
                  },
                  child: const Text('Container'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(tester.element(find.byType(ElevatedButton).at(2)))
                        .push(PageTransitions.fade(customPage));
                  },
                  child: const Text('Custom'),
                ),
              ],
            ),
          ),
        ),
      );

      // 각 전환 테스트
      await tester.tap(find.text('Text'));
      await tester.pumpAndSettle();
      expect(find.text('Text Page'), findsOneWidget);

      Navigator.pop(tester.element(find.text('Text Page')));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Container'));
      await tester.pumpAndSettle();
      expect(find.text('Container Page'), findsOneWidget);

      Navigator.pop(tester.element(find.text('Container Page')));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Custom'));
      await tester.pumpAndSettle();
      expect(find.text('Custom Page'), findsOneWidget);
    });

    testWidgets('전환 duration이 기본값으로 설정되어 있는지 확인', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(tester.element(find.byType(ElevatedButton)))
                      .push(PageTransitions.slideRight(testPage));
                },
                child: const Text('Navigate'),
              ),
            ),
          ),
        ),
      );

      final startTime = DateTime.now();

      await tester.tap(find.text('Navigate'));
      await tester.pumpAndSettle();

      final endTime = DateTime.now();
      final duration = endTime.difference(startTime);

      // 애니메이션이 적절한 시간 내에 완료되었는지 확인 (300ms + 여유시간)
      expect(duration.inMilliseconds, lessThan(1000));
    });

    test('SlidePageRoute의 기본 설정이 올바른지 확인', () {
      const child = Text('Test');
      final route = SlidePageRoute(child: child);

      expect(route.transitionDuration, const Duration(milliseconds: 300));
      expect(route.reverseTransitionDuration, const Duration(milliseconds: 300));
    });

    test('SlidePageRoute의 커스텀 설정이 적용되는지 확인', () {
      const child = Text('Test');
      const customDuration = Duration(milliseconds: 500);
      const customOffset = Offset(-1.0, 0.0);

      final route = SlidePageRoute(
        child: child,
        duration: customDuration,
        beginOffset: customOffset,
        includeFade: false,
      );

      expect(route.transitionDuration, customDuration);
      expect(route.reverseTransitionDuration, customDuration);
    });

    test('SlidePageRouteWithBackground의 기본 설정이 올바른지 확인', () {
      const child = Text('Test');
      final route = SlidePageRouteWithBackground(child: child);

      expect(route.transitionDuration, const Duration(milliseconds: 300));
      expect(route.reverseTransitionDuration, const Duration(milliseconds: 300));
    });

    testWidgets('여러 페이지를 연속으로 네비게이션할 수 있는지 확인', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: ElevatedButton(
                onPressed: () {
                  final nav = Navigator.of(tester.element(find.byType(ElevatedButton)));
                  nav.push(PageTransitions.slideRight(
                    Scaffold(
                      body: Center(
                        child: ElevatedButton(
                          onPressed: () {
                            nav.push(PageTransitions.slideUp(
                              const Scaffold(
                                body: Center(child: Text('Second Page')),
                              ),
                            ));
                          },
                          child: const Text('Go to Second'),
                        ),
                      ),
                    ),
                  ));
                },
                child: const Text('Start'),
              ),
            ),
          ),
        ),
      );

      // 첫 번째 페이지로 이동
      await tester.tap(find.text('Start'));
      await tester.pumpAndSettle();
      expect(find.text('Go to Second'), findsOneWidget);

      // 두 번째 페이지로 이동
      await tester.tap(find.text('Go to Second'));
      await tester.pumpAndSettle();
      expect(find.text('Second Page'), findsOneWidget);

      // 두 번 뒤로 가기
      Navigator.pop(tester.element(find.text('Second Page')));
      await tester.pumpAndSettle();
      expect(find.text('Go to Second'), findsOneWidget);

      Navigator.pop(tester.element(find.text('Go to Second')));
      await tester.pumpAndSettle();
      expect(find.text('Start'), findsOneWidget);
    });
  });
}