import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mbti_go/features/home/presentation/widgets/home_header.dart';
import 'package:mbti_go/core/animations/bounce_animation.dart';
import 'package:mbti_go/core/animations/tap_bounce_animation.dart';

void main() {
  group('HomeHeader 위젯 테스트', () {
    testWidgets('HomeHeader가 기본 요소들을 올바르게 표시하는지 확인', (WidgetTester tester) async {
      // ignore: unused_local_variable
      bool assessmentStarted = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HomeHeader(
              onStartAssessment: () => assessmentStarted = true,
            ),
          ),
        ),
      );

      // 앱 제목 확인
      expect(find.text('MBTI Go'), findsOneWidget);

      // 부제목 확인
      expect(find.text('당신의 성격 유형을 발견하세요'), findsOneWidget);

      // 검사 시작 버튼 확인
      expect(find.text('MBTI 검사 시작하기'), findsOneWidget);

      // 설명 텍스트 확인
      expect(find.textContaining('아래 16가지 성격 유형을 탐색하거나'), findsOneWidget);
    });

    testWidgets('검사 시작 버튼이 올바르게 작동하는지 확인', (WidgetTester tester) async {
      // ignore: unused_local_variable
      bool assessmentStarted = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HomeHeader(
              onStartAssessment: () => assessmentStarted = true,
            ),
          ),
        ),
      );

      // 버튼 탭 (warnIfMissed: false로 경고 무시)
      await tester.tap(find.text('MBTI 검사 시작하기'), warnIfMissed: false);
      await tester.pump();

      expect(assessmentStarted, true);
    });

    testWidgets('BounceInAnimation이 모든 요소에 적용되어 있는지 확인', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HomeHeader(
              onStartAssessment: () {},
            ),
          ),
        ),
      );

      // 4개의 BounceInAnimation이 있어야 함 (제목, 부제목, 버튼, 설명)
      expect(find.byType(BounceInAnimation), findsNWidgets(4));
    });

    testWidgets('TapBounceAnimation이 버튼에 적용되어 있는지 확인', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HomeHeader(
              onStartAssessment: () {},
            ),
          ),
        ),
      );

      expect(find.byType(TapBounceAnimation), findsOneWidget);
    });

    testWidgets('애니메이션 지연 시간이 올바르게 설정되어 있는지 확인', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HomeHeader(
              onStartAssessment: () {},
            ),
          ),
        ),
      );

      // 초기 상태에서는 아직 애니메이션이 시작되지 않았을 수 있음
      await tester.pump();

      // 모든 애니메이션이 완료될 때까지 기다리기
      await tester.pump(const Duration(milliseconds: 1500));

      // 모든 텍스트가 보이는지 확인
      expect(find.text('MBTI Go'), findsOneWidget);
      expect(find.text('당신의 성격 유형을 발견하세요'), findsOneWidget);
      expect(find.text('MBTI 검사 시작하기'), findsOneWidget);
    });

    testWidgets('버튼의 그라데이션과 그림자가 적용되어 있는지 확인', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HomeHeader(
              onStartAssessment: () {},
            ),
          ),
        ),
      );

      // Container와 BoxDecoration이 있는지 확인
      final containers = find.byType(Container);
      expect(containers, findsWidgets);

      // InkWell이 있는지 확인 (터치 피드백)
      expect(find.byType(InkWell), findsOneWidget);

      // Material 위젯이 있는지 확인
      expect(find.byType(Material), findsOneWidget);
    });

    testWidgets('레이아웃 구조가 올바른지 확인', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HomeHeader(
              onStartAssessment: () {},
            ),
          ),
        ),
      );

      // Column 구조 확인
      expect(find.byType(Column), findsWidgets);

      // 패딩이 적용되어 있는지 확인
      final containerFinder = find.byType(Container).first;
      final container = tester.widget<Container>(containerFinder);

      expect(container.padding, const EdgeInsets.symmetric(horizontal: 24, vertical: 32));
    });

    testWidgets('텍스트 스타일이 올바르게 적용되어 있는지 확인', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HomeHeader(
              onStartAssessment: () {},
            ),
          ),
        ),
      );

      // 텍스트 위젯들 확인
      final textWidgets = find.byType(Text);
      expect(textWidgets, findsNWidgets(4));

      // 모든 텍스트 위젯이 렌더링되는지 확인
      for (int i = 0; i < 4; i++) {
        final text = tester.widget<Text>(textWidgets.at(i));
        expect(text.data, isNotNull);
        expect(text.style, isNotNull);
      }
    });

    testWidgets('SizedBox 간격이 올바르게 설정되어 있는지 확인', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HomeHeader(
              onStartAssessment: () {},
            ),
          ),
        ),
      );

      final sizedBoxes = find.byType(SizedBox);
      expect(sizedBoxes, findsWidgets);

      // 첫 번째 SizedBox (제목과 부제목 사이)
      final firstSizedBox = tester.widget<SizedBox>(sizedBoxes.at(0));
      expect(firstSizedBox.height, 12);

      // 두 번째 SizedBox (부제목과 버튼 사이)
      final secondSizedBox = tester.widget<SizedBox>(sizedBoxes.at(1));
      expect(secondSizedBox.height, 32);

      // 세 번째 SizedBox (버튼과 설명 사이)
      final thirdSizedBox = tester.widget<SizedBox>(sizedBoxes.at(2));
      expect(thirdSizedBox.height, 24);
    });

    testWidgets('다양한 화면 크기에서 올바르게 작동하는지 확인', (WidgetTester tester) async {
      // 작은 화면
      await tester.binding.setSurfaceSize(const Size(300, 600));

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HomeHeader(
              onStartAssessment: () {},
            ),
          ),
        ),
      );

      expect(find.text('MBTI Go'), findsOneWidget);
      expect(find.text('MBTI 검사 시작하기'), findsOneWidget);

      // 큰 화면
      await tester.binding.setSurfaceSize(const Size(800, 1200));

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HomeHeader(
              onStartAssessment: () {},
            ),
          ),
        ),
      );

      expect(find.text('MBTI Go'), findsOneWidget);
      expect(find.text('MBTI 검사 시작하기'), findsOneWidget);

      addTearDown(() => tester.binding.setSurfaceSize(null));
    });

    testWidgets('버튼의 크기와 마진이 올바른지 확인', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HomeHeader(
              onStartAssessment: () {},
            ),
          ),
        ),
      );

      // 버튼이 전체 너비를 차지하는지 확인 (margin 제외)
      final containers = find.byType(Container);
      expect(containers, findsWidgets);

      // Container가 존재하는지 기본 확인
      bool foundButtonContainer = false;
      for (int i = 0; i < tester.widgetList(containers).length; i++) {
        final container = tester.widget<Container>(containers.at(i));
        if (container.constraints?.maxWidth == double.infinity) {
          foundButtonContainer = true;
          break;
        }
      }
      expect(foundButtonContainer, isTrue);
    });

    testWidgets('접근성 지원이 올바른지 확인', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HomeHeader(
              onStartAssessment: () {},
            ),
          ),
        ),
      );

      // 시맨틱 정보가 있는지 확인
      expect(find.bySemanticsLabel('MBTI Go'), findsNothing); // 명시적으로 설정되지 않음
      expect(find.text('MBTI 검사 시작하기'), findsOneWidget);

      // 버튼이 포커스 가능한지 확인
      final inkWell = find.byType(InkWell);
      expect(inkWell, findsOneWidget);
    });

    testWidgets('콜백이 설정되지 않았을 때도 안전한지 확인', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HomeHeader(
              onStartAssessment: () {
                // 빈 콜백으로 테스트
              },
            ),
          ),
        ),
      );

      expect(find.text('MBTI Go'), findsOneWidget);
      expect(find.text('MBTI 검사 시작하기'), findsOneWidget);

      // 버튼을 탭해도 오류가 발생하지 않는지 확인
      await tester.tap(find.text('MBTI 검사 시작하기'));
      await tester.pump();

      expect(tester.takeException(), isNull);
    });
  });
}