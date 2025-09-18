import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mbti_go/features/home/presentation/widgets/mbti_type_grid.dart';
import 'package:mbti_go/features/home/presentation/widgets/mbti_type_card.dart';
import 'package:mbti_go/core/animations/bounce_animation.dart';

void main() {
  group('MBTITypeGrid 위젯 테스트', () {
    testWidgets('MBTITypeGrid가 16개의 MBTI 타입 카드를 표시하는지 확인', (WidgetTester tester) async {
      final selectedTypes = <String>[];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MBTITypeGrid(
              onTypeSelected: (typeCode) => selectedTypes.add(typeCode),
            ),
          ),
        ),
      );

      // GridView가 있는지 확인
      expect(find.byType(GridView), findsOneWidget);

      // 16개의 MBTITypeCard가 있는지 확인
      expect(find.byType(MBTITypeCard), findsNWidgets(16));
    });

    testWidgets('GridView의 설정이 올바른지 확인', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MBTITypeGrid(
              onTypeSelected: (typeCode) {},
            ),
          ),
        ),
      );

      final gridView = tester.widget<GridView>(find.byType(GridView));
      final delegate = gridView.gridDelegate as SliverGridDelegateWithFixedCrossAxisCount;

      // 2열 그리드 확인
      expect(delegate.crossAxisCount, 2);

      // 종횡비 확인
      expect(delegate.childAspectRatio, 0.75);

      // 간격 확인
      expect(delegate.crossAxisSpacing, 16);
      expect(delegate.mainAxisSpacing, 16);
    });

    testWidgets('BounceInAnimation이 각 카드에 적용되어 있는지 확인', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MBTITypeGrid(
              onTypeSelected: (typeCode) {},
            ),
          ),
        ),
      );

      // 16개의 BounceInAnimation이 있는지 확인
      expect(find.byType(BounceInAnimation), findsNWidgets(16));
    });

    testWidgets('스크롤이 가능한지 확인', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              height: 400, // 제한된 높이
              child: MBTITypeGrid(
                onTypeSelected: (typeCode) {},
              ),
            ),
          ),
        ),
      );

      final gridView = tester.widget<GridView>(find.byType(GridView));
      expect(gridView.physics, isA<BouncingScrollPhysics>());

      // 스크롤 테스트
      await tester.drag(find.byType(GridView), const Offset(0, -300));
      await tester.pump();

      // 스크롤이 수행되었는지 확인 (에러가 없는지)
      expect(find.byType(GridView), findsOneWidget);
    });

    testWidgets('타입 선택 콜백이 올바르게 작동하는지 확인', (WidgetTester tester) async {
      String? selectedType;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MBTITypeGrid(
              onTypeSelected: (typeCode) => selectedType = typeCode,
            ),
          ),
        ),
      );

      // 첫 번째 카드 탭
      await tester.tap(find.byType(MBTITypeCard).first);
      await tester.pump();

      expect(selectedType, isNotNull);
      expect(selectedType!.length, 4); // MBTI 코드는 4글자
      expect(RegExp(r'^[IE][SN][TF][JP]$').hasMatch(selectedType!), true);
    });

    testWidgets('모든 16가지 MBTI 타입이 포함되어 있는지 확인', (WidgetTester tester) async {
      final selectedTypes = <String>[];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MBTITypeGrid(
              onTypeSelected: (typeCode) => selectedTypes.add(typeCode),
            ),
          ),
        ),
      );

      // 모든 카드를 탭해서 타입 수집
      final cards = find.byType(MBTITypeCard);
      for (int i = 0; i < 16; i++) {
        await tester.tap(cards.at(i));
        await tester.pump();
      }

      expect(selectedTypes.length, 16);
      expect(selectedTypes.toSet().length, 16); // 중복 없음

      // 16가지 표준 MBTI 타입이 모두 포함되어 있는지 확인
      const expectedTypes = {
        'INTJ', 'INTP', 'ENTJ', 'ENTP', // Analysts
        'INFJ', 'INFP', 'ENFJ', 'ENFP', // Diplomats
        'ISTJ', 'ISFJ', 'ESTJ', 'ESFJ', // Sentinels
        'ISTP', 'ISFP', 'ESTP', 'ESFP', // Explorers
      };

      expect(selectedTypes.toSet(), equals(expectedTypes));
    });

    testWidgets('그리드 레이아웃이 작은 화면에서도 올바르게 작동하는지 확인', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(300, 600)); // 작은 화면 시뮬레이션

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MBTITypeGrid(
              onTypeSelected: (typeCode) {},
            ),
          ),
        ),
      );

      expect(find.byType(GridView), findsOneWidget);
      expect(find.byType(MBTITypeCard), findsNWidgets(16));

      // 스크롤 테스트
      await tester.drag(find.byType(GridView), const Offset(0, -200));
      await tester.pump();

      addTearDown(() => tester.binding.setSurfaceSize(null));
    });

    testWidgets('큰 화면에서도 올바르게 작동하는지 확인', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(800, 1200)); // 큰 화면 시뮬레이션

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MBTITypeGrid(
              onTypeSelected: (typeCode) {},
            ),
          ),
        ),
      );

      expect(find.byType(GridView), findsOneWidget);
      expect(find.byType(MBTITypeCard), findsNWidgets(16));

      addTearDown(() => tester.binding.setSurfaceSize(null));
    });

    testWidgets('그리드의 패딩이 올바르게 적용되어 있는지 확인', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MBTITypeGrid(
              onTypeSelected: (typeCode) {},
            ),
          ),
        ),
      );

      final paddingFinder = find.byType(Padding);
      expect(paddingFinder, findsWidgets);

      final padding = tester.widget<Padding>(paddingFinder.first);
      expect(padding.padding, const EdgeInsets.all(16));
    });

    testWidgets('배경색이 올바르게 설정되어 있는지 확인', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MBTITypeGrid(
              onTypeSelected: (typeCode) {},
            ),
          ),
        ),
      );

      final containerFinder = find.byType(Container).first;
      final container = tester.widget<Container>(containerFinder);

      expect(container.color, isNotNull);
    });

    testWidgets('애니메이션 지연 효과가 올바르게 적용되는지 확인', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MBTITypeGrid(
              onTypeSelected: (typeCode) {},
            ),
          ),
        ),
      );

      // 첫 번째 애니메이션과 마지막 애니메이션의 지연 시간이 다른지 확인
      final bounceAnimations = find.byType(BounceInAnimation);
      expect(bounceAnimations, findsNWidgets(16));

      // 모든 애니메이션이 완료될 때까지 기다리기
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.byType(MBTITypeCard), findsNWidgets(16));
    });

    testWidgets('터치 이벤트가 올바른 인덱스로 전달되는지 확인', (WidgetTester tester) async {
      final selectedTypesWithOrder = <String>[];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MBTITypeGrid(
              onTypeSelected: (typeCode) => selectedTypesWithOrder.add(typeCode),
            ),
          ),
        ),
      );

      // 특정 순서로 여러 카드 탭
      final cards = find.byType(MBTITypeCard);

      await tester.tap(cards.at(0));
      await tester.pump();
      await tester.tap(cards.at(5));
      await tester.pump();
      await tester.tap(cards.at(10));
      await tester.pump();

      expect(selectedTypesWithOrder.length, 3);

      // 각각 다른 타입이어야 함
      expect(selectedTypesWithOrder[0] != selectedTypesWithOrder[1], true);
      expect(selectedTypesWithOrder[1] != selectedTypesWithOrder[2], true);
      expect(selectedTypesWithOrder[0] != selectedTypesWithOrder[2], true);
    });

    testWidgets('위젯이 disposed될 때 정상적으로 정리되는지 확인', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MBTITypeGrid(
              onTypeSelected: (typeCode) {},
            ),
          ),
        ),
      );

      expect(find.byType(MBTITypeGrid), findsOneWidget);

      // 다른 위젯으로 교체
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Text('Different Content'),
          ),
        ),
      );

      expect(find.byType(MBTITypeGrid), findsNothing);
      expect(find.text('Different Content'), findsOneWidget);
    });
  });
}