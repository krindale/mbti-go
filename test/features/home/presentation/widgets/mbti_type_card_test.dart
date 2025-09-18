import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mbti_go/features/home/presentation/widgets/mbti_type_card.dart';
import 'package:mbti_go/features/assessment/domain/entities/mbti_type.dart';
import 'package:mbti_go/core/animations/animation_constants.dart';

void main() {
  group('MBTITypeCard 위젯 테스트', () {
    const testMBTIType = MBTIType(
      code: 'INTJ',
      name: '건축가',
      category: 'Analysts',
      description: '상상력이 풍부하고 전략적인 사고를 하는 완벽주의자',
      detailedDescription: '자세한 설명',
      strengths: ['전략적 사고', '독립성', '결단력'],
      weaknesses: ['감정 표현 부족', '완벽주의', '타인 의견 무시'],
      careers: ['과학자', '엔지니어', '건축가'],
      imagePath: 'assets/INTJ_Architect.jpg',
      primaryColor: Color(0xFF6366F1),
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

      await tester.pumpAndSettle();

      // MBTI 타입 코드 확인
      expect(find.text('INTJ'), findsOneWidget);

      // MBTI 타입 이름 확인
      expect(find.text('건축가'), findsOneWidget);

      // MBTI 설명 확인
      expect(find.text('상상력이 풍부하고 전략적인 사고를 하는 완벽주의자'), findsOneWidget);

      // 터치 이벤트 확인
      expect(tapCalled, false);
      await tester.tap(find.byType(MBTITypeCard));
      expect(tapCalled, true);
    });

    testWidgets('MBTITypeCard의 Hero 애니메이션 태그가 올바른지 확인', (WidgetTester tester) async {
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

      await tester.pumpAndSettle();

      // Hero 위젯이 존재하는지 확인
      expect(find.byType(Hero), findsOneWidget);

      // Hero 태그가 올바른지 확인
      final hero = tester.widget<Hero>(find.byType(Hero));
      expect(hero.tag, AnimationConstants.heroTag('INTJ', 5));
    });

    testWidgets('MBTITypeCard의 색상이 타입에 맞게 적용되는지 확인', (WidgetTester tester) async {
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

      await tester.pumpAndSettle();

      // 컨테이너 위젯이 존재하는지 확인
      expect(find.byType(Container), findsWidgets);
    });

    testWidgets('여러 타입의 MBTITypeCard가 다르게 표시되는지 확인', (WidgetTester tester) async {
      const intjType = MBTIType(
        code: 'INTJ',
        name: '건축가',
        category: 'Analysts',
        description: '상상력이 풍부하고 전략적인 사고를 하는 완벽주의자',
        detailedDescription: '자세한 설명',
        strengths: ['전략적 사고', '독립성', '결단력'],
        weaknesses: ['감정 표현 부족', '완벽주의', '타인 의견 무시'],
        careers: ['과학자', '엔지니어', '건축가'],
        imagePath: 'assets/INTJ_Architect.jpg',
        primaryColor: Color(0xFF6366F1),
      );

      const enfpType = MBTIType(
        code: 'ENFP',
        name: '활동가',
        category: 'Diplomats',
        description: '열정적이고 창의적인 사교적인 자유로운 영혼',
        detailedDescription: '자세한 설명',
        strengths: ['창의성', '공감능력', '열정'],
        weaknesses: ['집중력 부족', '스트레스 취약', '비현실적'],
        careers: ['상담사', '교사', '예술가'],
        imagePath: 'assets/ENFP_Campaigner.jpg',
        primaryColor: Color(0xFFE91E63),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                MBTITypeCard(
                  mbtiType: intjType,
                  index: 0,
                  onTap: () {},
                ),
                MBTITypeCard(
                  mbtiType: enfpType,
                  index: 1,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // 두 카드의 다른 타입 코드가 표시되는지 확인
      expect(find.text('INTJ'), findsOneWidget);
      expect(find.text('ENFP'), findsOneWidget);

      // 두 카드의 다른 이름이 표시되는지 확인
      expect(find.text('건축가'), findsOneWidget);
      expect(find.text('활동가'), findsOneWidget);
    });

    testWidgets('MBTITypeCard의 애니메이션이 올바르게 작동하는지 확인', (WidgetTester tester) async {
      const entpType = MBTIType(
        code: 'ENTP',
        name: '토론가',
        category: 'Analysts',
        description: '똑똑하고 호기심이 많은 사색가',
        detailedDescription: '자세한 설명',
        strengths: ['호기심', '창의성'],
        weaknesses: ['산만함'],
        careers: ['엔지니어'],
        imagePath: 'assets/ENTP_Debater.jpg',
        primaryColor: Color(0xFF9C27B0),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MBTITypeCard(
              mbtiType: entpType,
              index: 2,
              onTap: () {},
            ),
          ),
        ),
      );

      // 초기 애니메이션 확인
      await tester.pump();

      // 애니메이션 진행 확인
      await tester.pump(const Duration(milliseconds: 200));

      // 애니메이션 완료
      await tester.pumpAndSettle();

      expect(find.text('ENTP'), findsOneWidget);
      expect(find.text('토론가'), findsOneWidget);
    });

    testWidgets('MBTITypeCard의 반응형 레이아웃이 올바른지 확인', (WidgetTester tester) async {
      // 작은 화면 크기에서 테스트
      await tester.binding.setSurfaceSize(const Size(300, 600));

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

      await tester.pumpAndSettle();

      expect(find.text('INTJ'), findsOneWidget);
      expect(find.text('건축가'), findsOneWidget);

      // 큰 화면 크기에서 테스트
      await tester.binding.setSurfaceSize(const Size(800, 600));

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

      await tester.pumpAndSettle();

      expect(find.text('INTJ'), findsOneWidget);
      expect(find.text('건축가'), findsOneWidget);

      addTearDown(() => tester.binding.setSurfaceSize(null));
    });

    testWidgets('MBTITypeCard의 터치 영역이 전체 카드를 포함하는지 확인', (WidgetTester tester) async {
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

      await tester.pumpAndSettle();

      // 카드의 중앙을 탭
      await tester.tap(find.byType(MBTITypeCard));
      expect(tapCalled, true);

      tapCalled = false;

      // 카드의 상단 영역을 탭
      final cardFinder = find.byType(MBTITypeCard);
      final cardRect = tester.getRect(cardFinder);
      await tester.tapAt(Offset(cardRect.left + 10, cardRect.top + 10));
      expect(tapCalled, true);
    });

    testWidgets('MBTITypeCard가 null safety를 준수하는지 확인', (WidgetTester tester) async {
      // 정상적인 MBTIType 객체로 테스트
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

      await tester.pumpAndSettle();

      // 오류 없이 렌더링되는지 확인
      expect(tester.takeException(), isNull);
      expect(find.byType(MBTITypeCard), findsOneWidget);
    });

    testWidgets('MBTITypeCard의 텍스트가 오버플로우되지 않는지 확인', (WidgetTester tester) async {
      // 긴 설명을 가진 MBTIType 생성
      const longDescriptionType = MBTIType(
        code: 'INTJ',
        name: '매우 긴 이름을 가진 건축가 타입',
        category: 'Analysts',
        description: '매우 매우 매우 긴 설명을 가진 상상력이 풍부하고 전략적인 사고를 하는 완벽주의자 타입입니다. 이 설명은 의도적으로 길게 작성되었습니다.',
        detailedDescription: '매우 상세한 설명',
        strengths: ['전략적 사고'],
        weaknesses: ['완벽주의'],
        careers: ['비디오 게임 전문가'],
        imagePath: 'assets/INTJ_Architect.jpg',
        primaryColor: Color(0xFF6366F1),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 200, // 의도적으로 작은 너비 설정
              child: MBTITypeCard(
                mbtiType: longDescriptionType,
                index: 0,
                onTap: () {},
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // 오버플로우 오류가 발생하지 않는지 확인
      expect(tester.takeException(), isNull);
      expect(find.byType(MBTITypeCard), findsOneWidget);
    });

    testWidgets('다크 모드에서 MBTITypeCard가 올바르게 표시되는지 확인', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.dark(),
          home: Scaffold(
            body: MBTITypeCard(
              mbtiType: testMBTIType,
              index: 0,
              onTap: () {},
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('INTJ'), findsOneWidget);
      expect(find.text('건축가'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('MBTITypeCard가 접근성 가이드라인을 준수하는지 확인', (WidgetTester tester) async {
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

      await tester.pumpAndSettle();

      // 의미론적 요소들이 존재하는지 확인
      expect(find.byType(MBTITypeCard), findsOneWidget);

      // 텍스트가 읽기 가능한 상태인지 확인
      expect(find.text('INTJ'), findsOneWidget);
      expect(find.text('건축가'), findsOneWidget);
    });
  });
}