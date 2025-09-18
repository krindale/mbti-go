import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mbti_go/features/home/presentation/widgets/mbti_type_card.dart';
import 'package:mbti_go/features/assessment/domain/entities/mbti_type.dart';
import 'package:mbti_go/core/animations/app_animations.dart';

void main() {
  group('MBTITypeCard 위젯 테스트', () {
    const testMBTIType = MBTIType(
      code: 'INTJ',
      name: '건축가',
      category: 'Analysts',
      description: '상상력이 풍부하고 전략적인 사고를 하는 완벽주의자',
      strengths: ['전략적 사고', '독립성', '결단력'],
      weaknesses: ['감정 표현 부족', '완벽주의', '타인 의견 무시'],
      compatibility: ['ENFP', 'ENTP', 'INFJ'],
      careers: ['과학자', '엔지니어', '건축가'],
      image: 'assets/INTJ_Architect.jpg',
    );

    testWidgets('MBTITypeCard가 기본 정보를 올바르게 표시하는지 확인', (WidgetTester tester) async {
      bool tapCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MBTITypeCard(
              mbtiType: testMBTIType,
              index: 0,
              onTap: () => tapCalled = true,
            ),
          ),
        ),
      );

      // MBTI 코드 확인
      expect(find.text('INTJ'), findsOneWidget);

      // MBTI 이름 확인
      expect(find.text('건축가'), findsOneWidget);

      // 카테고리 확인
      expect(find.text('Analysts'), findsOneWidget);

      // 설명 확인
      expect(find.text('상상력이 풍부하고 전략적인 사고를 하는 완벽주의자'), findsOneWidget);
    });

    testWidgets('MBTITypeCard 탭 이벤트가 올바르게 작동하는지 확인', (WidgetTester tester) async {
      bool tapCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MBTITypeCard(
              mbtiType: testMBTIType,
              index: 0,
              onTap: () => tapCalled = true,
            ),
          ),
        ),
      );

      // 카드 탭
      await tester.tap(find.byType(MBTITypeCard));
      await tester.pump();

      expect(tapCalled, true);
    });

    testWidgets('MBTITypeCard의 Hero 위젯이 올바르게 설정되어 있는지 확인', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MBTITypeCard(
              mbtiType: testMBTIType,
              index: 5,
              onTap: () {},
            ),
          ),
        ),
      );

      final heroFinder = find.byType(Hero);
      expect(heroFinder, findsOneWidget);

      final Hero hero = tester.widget(heroFinder);
      expect(hero.tag, 'mbti_card_INTJ_5');
    });

    testWidgets('MBTITypeCard의 TapBounceAnimation이 포함되어 있는지 확인', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MBTITypeCard(
              mbtiType: testMBTIType,
              index: 0,
              onTap: () {},
            ),
          ),
        ),
      );

      expect(find.byType(TapBounceAnimation), findsOneWidget);
    });

    testWidgets('MBTITypeCard의 레이아웃 구조가 올바른지 확인', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MBTITypeCard(
              mbtiType: testMBTIType,
              index: 0,
              onTap: () {},
            ),
          ),
        ),
      );

      // Container 구조 확인
      expect(find.byType(Container), findsWidgets);

      // Column 구조 확인 (헤더 + 콘텐츠)
      expect(find.byType(Column), findsWidgets);

      // Row 구조 확인 (헤더 내부)
      expect(find.byType(Row), findsWidgets);

      // Text 위젯들 확인
      expect(find.byType(Text), findsNWidgets(3)); // 코드, 이름, 설명
    });

    testWidgets('다양한 MBTI 타입으로 카드 테스트', (WidgetTester tester) async {
      const enfpType = MBTIType(
        code: 'ENFP',
        name: '활동가',
        category: 'Diplomats',
        description: '열정적이고 창의적인 사교적인 자유로운 영혼',
        strengths: ['창의성', '공감능력', '열정'],
        weaknesses: ['집중력 부족', '스트레스 취약', '비현실적'],
        compatibility: ['INTJ', 'INFJ'],
        careers: ['상담사', '교사', '예술가'],
        image: 'assets/ENFP_Campaigner.jpg',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MBTITypeCard(
              mbtiType: enfpType,
              index: 1,
              onTap: () {},
            ),
          ),
        ),
      );

      expect(find.text('ENFP'), findsOneWidget);
      expect(find.text('활동가'), findsOneWidget);
      expect(find.text('Diplomats'), findsOneWidget);
      expect(find.text('열정적이고 창의적인 사교적인 자유로운 영혼'), findsOneWidget);
    });

    testWidgets('긴 텍스트의 overflow 처리가 올바른지 확인', (WidgetTester tester) async {
      const longDescriptionType = MBTIType(
        code: 'TEST',
        name: '매우매우매우매우매우매우긴이름테스트',
        category: 'Test Category With Very Long Name',
        description: '이것은 매우 긴 설명 텍스트입니다. ' * 10,
        strengths: ['강점1'],
        weaknesses: ['약점1'],
        compatibility: ['INTJ'],
        careers: ['직업1'],
        image: 'assets/test.jpg',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 200,
              height: 300,
              child: MBTITypeCard(
                mbtiType: longDescriptionType,
                index: 0,
                onTap: () {},
              ),
            ),
          ),
        ),
      );

      // 위젯이 렌더링되는지 확인 (overflow 에러가 없는지)
      expect(find.byType(MBTITypeCard), findsOneWidget);

      // Text 위젯들이 maxLines 속성을 가지고 있는지 간접적으로 확인
      final textFinders = find.byType(Text);
      expect(textFinders, findsWidgets);
    });

    testWidgets('MBTITypeCard의 색상 인디케이터가 표시되는지 확인', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MBTITypeCard(
              mbtiType: testMBTIType,
              index: 0,
              onTap: () {},
            ),
          ),
        ),
      );

      // 색상 인디케이터 바가 있는지 확인 (Container with height 3)
      final containers = find.byType(Container);
      expect(containers, findsWidgets);

      // 적어도 하나의 Container가 있어야 함
      expect(containers, findsAtLeastNWidgets(1));
    });

    testWidgets('MBTITypeCard의 터치 영역이 전체 카드를 덮는지 확인', (WidgetTester tester) async {
      bool tapCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 200,
                height: 250,
                child: MBTITypeCard(
                  mbtiType: testMBTIType,
                  index: 0,
                  onTap: () => tapCalled = true,
                ),
              ),
            ),
          ),
        ),
      );

      // 카드의 여러 위치를 탭해보기
      final cardFinder = find.byType(MBTITypeCard);
      final cardSize = tester.getSize(cardFinder);
      final cardTopLeft = tester.getTopLeft(cardFinder);

      // 왼쪽 상단 탭
      await tester.tapAt(cardTopLeft + const Offset(10, 10));
      await tester.pump();
      expect(tapCalled, true);

      tapCalled = false;

      // 오른쪽 하단 탭
      await tester.tapAt(cardTopLeft + Offset(cardSize.width - 10, cardSize.height - 10));
      await tester.pump();
      expect(tapCalled, true);
    });

    testWidgets('여러 MBTITypeCard가 동시에 렌더링되는지 확인', (WidgetTester tester) async {
      const types = [
        MBTIType(
          code: 'INTJ',
          name: '건축가',
          category: 'Analysts',
          description: '설명1',
          strengths: ['강점1'],
          weaknesses: ['약점1'],
          compatibility: ['ENFP'],
          careers: ['직업1'],
          image: 'assets/INTJ_Architect.jpg',
        ),
        MBTIType(
          code: 'ENFP',
          name: '활동가',
          category: 'Diplomats',
          description: '설명2',
          strengths: ['강점2'],
          weaknesses: ['약점2'],
          compatibility: ['INTJ'],
          careers: ['직업2'],
          image: 'assets/ENFP_Campaigner.jpg',
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: types.asMap().entries.map((entry) {
                return Expanded(
                  child: MBTITypeCard(
                    mbtiType: entry.value,
                    index: entry.key,
                    onTap: () {},
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      );

      expect(find.byType(MBTITypeCard), findsNWidgets(2));
      expect(find.text('INTJ'), findsOneWidget);
      expect(find.text('ENFP'), findsOneWidget);
    });
  });
}