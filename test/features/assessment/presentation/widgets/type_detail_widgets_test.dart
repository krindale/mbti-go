import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mbti_go/features/assessment/presentation/widgets/type_detail_animated_header_widget.dart';
import 'package:mbti_go/features/assessment/presentation/widgets/type_detail_main_card_widget.dart';
import 'package:mbti_go/features/assessment/presentation/widgets/type_detail_description_card_widget.dart';
import 'package:mbti_go/features/assessment/presentation/widgets/type_detail_strengths_weaknesses_widget.dart';
import 'package:mbti_go/features/assessment/presentation/widgets/type_detail_career_suggestions_widget.dart';
import 'package:mbti_go/features/assessment/presentation/widgets/type_detail_detailed_story_widget.dart';
import 'package:mbti_go/features/assessment/presentation/widgets/type_detail_compatibility_section_widget.dart';
import 'package:mbti_go/features/assessment/presentation/widgets/type_detail_action_buttons_widget.dart';
import 'package:mbti_go/features/assessment/domain/entities/mbti_type.dart';
import 'package:mbti_go/core/theme/app_theme.dart';

void main() {
  group('TypeDetail 위젯들 테스트', () {
    late MBTIType testType;

    setUp(() {
      testType = MBTIType(
        code: 'INTJ',
        name: 'The Architect',
        category: 'NT',
        description: '상상력이 풍부한 전략가',
        detailedDescription: '상세한 설명입니다.',
        imagePath: 'assets/INTJ_Architect.jpg',
        primaryColor: const Color(0xFF4A90E2),
        strengths: ['논리적 사고', '독립적', '창의적'],
        weaknesses: ['완벽주의', '감정 표현 어려움'],
        careers: ['소프트웨어 개발자', '전략가', '과학자'],
      );
    });

    Widget createTestWidget(Widget child) {
      return MaterialApp(
        theme: AppTheme.lightTheme,
        home: Scaffold(body: child),
      );
    }

    testWidgets('TypeDetailAnimatedHeaderWidget이 올바르게 렌더링되는지 확인', (
      WidgetTester tester,
    ) async {
      final animationController = AnimationController(
        duration: const Duration(milliseconds: 500),
        vsync: const TestVSync(),
      );

      final fadeAnimation = Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(animationController);
      final slideAnimation = Tween<Offset>(
        begin: const Offset(0, -0.3),
        end: Offset.zero,
      ).animate(animationController);

      await tester.pumpWidget(
        createTestWidget(
          TypeDetailAnimatedHeaderWidget(
            type: testType,
            fadeAnimation: fadeAnimation,
            slideAnimation: slideAnimation,
          ),
        ),
      );

      expect(find.text('INTJ - The Architect'), findsOneWidget);
      expect(find.text('합리주의자'), findsOneWidget);
      expect(find.byIcon(Icons.arrow_back), findsOneWidget);

      animationController.dispose();
    });

    testWidgets('TypeDetailMainCardWidget이 올바르게 렌더링되는지 확인', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(TypeDetailMainCardWidget(type: testType)),
      );

      await tester.pumpAndSettle();

      expect(find.text('INTJ'), findsOneWidget);
      expect(find.text('The Architect'), findsOneWidget);
      expect(find.text('합리주의자'), findsOneWidget);
      expect(find.text('상상력이 풍부한 전략가'), findsOneWidget);
      expect(find.byType(Hero), findsOneWidget);
    });

    testWidgets('TypeDetailDescriptionCardWidget이 올바르게 렌더링되는지 확인', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(TypeDetailDescriptionCardWidget(type: testType)),
      );

      await tester.pumpAndSettle();

      expect(find.text('성격 특성'), findsOneWidget);
      expect(find.text('외향성 vs 내향성'), findsOneWidget);
      expect(find.text('감각 vs 직관'), findsOneWidget);
      expect(find.text('사고 vs 감정'), findsOneWidget);
      expect(find.text('판단 vs 인식'), findsOneWidget);
      expect(find.byIcon(Icons.psychology), findsOneWidget);
    });

    testWidgets('TypeDetailStrengthsWeaknessesWidget이 올바르게 렌더링되는지 확인', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(TypeDetailStrengthsWeaknessesWidget(type: testType)),
      );

      await tester.pumpAndSettle();

      expect(find.text('강점'), findsOneWidget);
      expect(find.text('개선점'), findsOneWidget);
      expect(find.text('논리적 사고'), findsOneWidget);
      expect(find.text('완벽주의'), findsOneWidget);
      expect(find.byIcon(Icons.star), findsOneWidget);
      expect(find.byIcon(Icons.trending_up), findsOneWidget);
    });

    testWidgets('TypeDetailCareerSuggestionsWidget이 올바르게 렌더링되는지 확인', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(TypeDetailCareerSuggestionsWidget(type: testType)),
      );

      await tester.pumpAndSettle();

      expect(find.text('추천 직업'), findsOneWidget);
      expect(find.text('소프트웨어 개발자'), findsOneWidget);
      expect(find.text('전략가'), findsOneWidget);
      expect(find.text('과학자'), findsOneWidget);
      expect(find.byIcon(Icons.work), findsOneWidget);
    });

    testWidgets('TypeDetailDetailedStoryWidget이 올바르게 렌더링되는지 확인', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(TypeDetailDetailedStoryWidget(type: testType)),
      );

      await tester.pumpAndSettle();

      expect(find.text('당신의 이야기'), findsOneWidget);
      expect(find.text('상세한 설명입니다.'), findsOneWidget);
      expect(find.byIcon(Icons.auto_stories), findsOneWidget);
    });

    testWidgets('TypeDetailCompatibilitySectionWidget이 올바르게 렌더링되는지 확인', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(TypeDetailCompatibilitySectionWidget(type: testType)),
      );

      await tester.pumpAndSettle();

      expect(find.text('궁합 정보'), findsOneWidget);
      expect(find.text('곧 상세한 궁합 분석 기능이 추가됩니다'), findsOneWidget);
      expect(find.byIcon(Icons.favorite), findsOneWidget);
      expect(find.byIcon(Icons.info_outline), findsOneWidget);
    });

    testWidgets('TypeDetailActionButtonsWidget이 올바르게 렌더링되는지 확인', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(TypeDetailActionButtonsWidget(type: testType)),
      );

      await tester.pumpAndSettle();

      expect(find.text('홈으로 돌아가기'), findsOneWidget);
      expect(find.text('이전으로'), findsOneWidget);
      expect(find.byIcon(Icons.home), findsOneWidget);
      expect(find.byIcon(Icons.arrow_back), findsAtLeastNWidgets(1));
    });

    testWidgets('ActionButtons의 네비게이션 동작이 올바른지 확인', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(TypeDetailActionButtonsWidget(type: testType)),
      );

      await tester.pumpAndSettle();

      // 홈으로 돌아가기 버튼 탭
      await tester.tap(find.text('홈으로 돌아가기'), warnIfMissed: false);
      await tester.pumpAndSettle();

      // 에러가 발생하지 않았는지 확인
      expect(tester.takeException(), isNull);
    });

    testWidgets('모든 위젯들이 애니메이션과 함께 올바르게 작동하는지 확인', (WidgetTester tester) async {
      await tester.pumpWidget(
        createTestWidget(
          SingleChildScrollView(
            child: Column(
              children: [
                TypeDetailMainCardWidget(type: testType),
                TypeDetailDescriptionCardWidget(type: testType),
                TypeDetailStrengthsWeaknessesWidget(type: testType),
              ],
            ),
          ),
        ),
      );

      // 애니메이션 시작
      await tester.pump();

      // 애니메이션 진행
      await tester.pump(const Duration(milliseconds: 500));

      // 애니메이션 완료
      await tester.pumpAndSettle();

      expect(find.text('INTJ'), findsOneWidget);
      expect(find.text('성격 특성'), findsOneWidget);
      expect(find.text('강점'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  });
}

class TestVSync implements TickerProvider {
  const TestVSync();

  @override
  Ticker createTicker(TickerCallback onTick) {
    return Ticker(onTick);
  }
}
