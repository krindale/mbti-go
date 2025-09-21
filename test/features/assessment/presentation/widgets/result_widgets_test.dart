import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mbti_go/features/assessment/presentation/widgets/result_animated_header_widget.dart';
import 'package:mbti_go/features/assessment/presentation/widgets/result_card_widget.dart';
import 'package:mbti_go/features/assessment/presentation/widgets/result_score_breakdown_widget.dart';
import 'package:mbti_go/features/assessment/presentation/widgets/result_strengths_weaknesses_widget.dart';
import 'package:mbti_go/features/assessment/presentation/widgets/result_career_suggestions_widget.dart';
import 'package:mbti_go/features/assessment/presentation/widgets/result_detailed_description_widget.dart';
import 'package:mbti_go/features/assessment/presentation/widgets/result_action_buttons_widget.dart';
import 'package:mbti_go/features/assessment/domain/entities/assessment_result.dart';
import 'package:mbti_go/features/assessment/domain/entities/mbti_type.dart';
import 'package:mbti_go/core/theme/app_theme.dart';

void main() {
  group('Result 위젯들 테스트', () {
    late AssessmentResult testResult;

    setUp(() {
      final testType = MBTIType(
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

      testResult = AssessmentResult(
        id: 'test_result_1',
        type: testType,
        scores: {
          'E': 0.3,
          'I': 0.7,
          'S': 0.2,
          'N': 0.8,
          'T': 0.9,
          'F': 0.1,
          'J': 0.8,
          'P': 0.2,
        },
        completedAt: DateTime.now(),
        testType: AssessmentType.quick,
        reliability: 0.85,
      );
    });

    Widget createTestWidget(Widget child) {
      return MaterialApp(
        theme: AppTheme.lightTheme,
        home: Scaffold(body: child),
      );
    }

    testWidgets('ResultAnimatedHeaderWidget이 올바르게 렌더링되는지 확인', (
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
          ResultAnimatedHeaderWidget(
            fadeAnimation: fadeAnimation,
            slideAnimation: slideAnimation,
          ),
        ),
      );

      expect(find.text('검사 결과'), findsOneWidget);
      expect(find.text('당신의 성격 유형을 확인해보세요'), findsOneWidget);
      expect(find.byIcon(Icons.arrow_back), findsOneWidget);

      animationController.dispose();
    });

    testWidgets('ResultCardWidget이 올바르게 렌더링되는지 확인', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(ResultCardWidget(result: testResult)),
      );

      await tester.pumpAndSettle();

      expect(find.text('INTJ'), findsOneWidget);
      expect(find.text('The Architect'), findsOneWidget);
      expect(find.text('합리주의자'), findsOneWidget);
      expect(find.text('상상력이 풍부한 전략가'), findsOneWidget);
      expect(find.text('신뢰도: 85%'), findsOneWidget);
      expect(find.byIcon(Icons.verified), findsOneWidget);
    });

    testWidgets('ResultScoreBreakdownWidget이 올바르게 렌더링되는지 확인', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(ResultScoreBreakdownWidget(result: testResult)),
      );

      await tester.pumpAndSettle();

      expect(find.text('세부 점수'), findsOneWidget);
      expect(find.text('외향성 vs 내향성'), findsOneWidget);
      expect(find.text('감각 vs 직관'), findsOneWidget);
      expect(find.text('사고 vs 감정'), findsOneWidget);
      expect(find.text('판단 vs 인식'), findsOneWidget);

      // 우세한 성향들 확인
      expect(find.textContaining('I ('), findsOneWidget); // I가 우세
      expect(find.textContaining('N ('), findsOneWidget); // N이 우세
      expect(find.textContaining('T ('), findsOneWidget); // T가 우세
      expect(find.textContaining('J ('), findsOneWidget); // J가 우세
    });

    testWidgets('ResultStrengthsWeaknessesWidget이 올바르게 렌더링되는지 확인', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(ResultStrengthsWeaknessesWidget(result: testResult)),
      );

      await tester.pumpAndSettle();

      expect(find.text('강점'), findsOneWidget);
      expect(find.text('개선점'), findsOneWidget);
      expect(find.text('논리적 사고'), findsOneWidget);
      expect(find.text('완벽주의'), findsOneWidget);
      expect(find.byIcon(Icons.star), findsOneWidget);
      expect(find.byIcon(Icons.trending_up), findsOneWidget);
    });

    testWidgets('ResultCareerSuggestionsWidget이 올바르게 렌더링되는지 확인', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(ResultCareerSuggestionsWidget(result: testResult)),
      );

      await tester.pumpAndSettle();

      expect(find.text('추천 직업'), findsOneWidget);
      expect(find.text('소프트웨어 개발자'), findsOneWidget);
      expect(find.text('전략가'), findsOneWidget);
      expect(find.text('과학자'), findsOneWidget);
      expect(find.byIcon(Icons.work), findsOneWidget);
    });

    testWidgets('ResultDetailedDescriptionWidget이 올바르게 렌더링되는지 확인', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(ResultDetailedDescriptionWidget(result: testResult)),
      );

      await tester.pumpAndSettle();

      expect(find.text('당신의 이야기'), findsOneWidget);
      expect(find.text('상세한 설명입니다.'), findsOneWidget);
      expect(find.byIcon(Icons.auto_stories), findsOneWidget);
    });

    testWidgets('ResultActionButtonsWidget이 올바르게 렌더링되는지 확인', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(const ResultActionButtonsWidget()),
      );

      await tester.pumpAndSettle();

      expect(find.text('홈으로 돌아가기'), findsOneWidget);
      expect(find.text('다시 검사하기'), findsOneWidget);
      expect(find.byIcon(Icons.home), findsOneWidget);
      expect(find.byIcon(Icons.refresh), findsOneWidget);
    });

    testWidgets('ResultActionButtonsWidget - 다시 검사하기 버튼 동작 확인', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: Scaffold(body: const ResultActionButtonsWidget()),
        ),
      );

      await tester.pumpAndSettle();

      // 다시 검사하기 버튼 탭
      await tester.tap(find.text('다시 검사하기'), warnIfMissed: false);
      await tester.pumpAndSettle();

      // 에러가 발생하지 않았는지 확인 (navigation이 정상적으로 수행됨)
      expect(tester.takeException(), isNull);
    });

    testWidgets('ResultActionButtonsWidget - 홈으로 돌아가기 버튼 동작 확인', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(const ResultActionButtonsWidget()),
      );

      await tester.pumpAndSettle();

      // 홈으로 돌아가기 버튼 탭
      await tester.tap(find.text('홈으로 돌아가기'), warnIfMissed: false);
      await tester.pumpAndSettle();

      // 에러가 발생하지 않았는지 확인
      expect(tester.takeException(), isNull);
    });

    testWidgets('신뢰도가 낮을 때 올바르게 표시되는지 확인', (WidgetTester tester) async {
      final lowReliabilityResult = AssessmentResult(
        id: 'test_result_low',
        type: testResult.type,
        scores: testResult.scores,
        completedAt: DateTime.now(),
        testType: AssessmentType.quick,
        reliability: 0.65, // 낮은 신뢰도
      );

      await tester.pumpWidget(
        createTestWidget(ResultCardWidget(result: lowReliabilityResult)),
      );

      await tester.pumpAndSettle();

      expect(find.text('신뢰도: 65%'), findsOneWidget);
      expect(find.byIcon(Icons.verified), findsOneWidget);
    });

    testWidgets('모든 Result 위젯들이 함께 올바르게 작동하는지 확인', (WidgetTester tester) async {
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
          SingleChildScrollView(
            child: Column(
              children: [
                ResultAnimatedHeaderWidget(
                  fadeAnimation: fadeAnimation,
                  slideAnimation: slideAnimation,
                ),
                ResultCardWidget(result: testResult),
                ResultScoreBreakdownWidget(result: testResult),
                ResultStrengthsWeaknessesWidget(result: testResult),
                ResultCareerSuggestionsWidget(result: testResult),
                ResultDetailedDescriptionWidget(result: testResult),
                const ResultActionButtonsWidget(),
              ],
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('검사 결과'), findsOneWidget);
      expect(find.text('INTJ'), findsOneWidget);
      expect(find.text('세부 점수'), findsOneWidget);
      expect(find.text('강점'), findsOneWidget);
      expect(find.text('추천 직업'), findsOneWidget);
      expect(find.text('당신의 이야기'), findsOneWidget);
      expect(find.text('다시 검사하기'), findsOneWidget);
      expect(tester.takeException(), isNull);

      animationController.dispose();
    });

    testWidgets('애니메이션이 순차적으로 올바르게 실행되는지 확인', (WidgetTester tester) async {
      await tester.pumpWidget(
        createTestWidget(
          SingleChildScrollView(
            child: Column(
              children: [
                ResultCardWidget(result: testResult),
                ResultScoreBreakdownWidget(result: testResult),
                ResultStrengthsWeaknessesWidget(result: testResult),
              ],
            ),
          ),
        ),
      );

      // 애니메이션 시작
      await tester.pump();

      // 첫 번째 애니메이션 단계
      await tester.pump(const Duration(milliseconds: 100));

      // 두 번째 애니메이션 단계
      await tester.pump(const Duration(milliseconds: 200));

      // 모든 애니메이션 완료
      await tester.pumpAndSettle();

      expect(find.text('INTJ'), findsOneWidget);
      expect(find.text('세부 점수'), findsOneWidget);
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
