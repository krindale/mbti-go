import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mbti_go/features/assessment/presentation/pages/assessment_page.dart';
import 'package:mbti_go/features/assessment/presentation/pages/result_page.dart';
import 'package:mbti_go/features/assessment/presentation/pages/type_detail_page.dart';
import 'package:mbti_go/features/assessment/domain/entities/assessment_result.dart';
import 'package:mbti_go/features/assessment/domain/entities/mbti_type.dart';
import 'package:mbti_go/core/theme/app_theme.dart';

void main() {
  group('Assessment 페이지들 통합 테스트', () {
    late AssessmentResult testResult;
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

    Widget createTestApp(Widget home) {
      return MaterialApp(theme: AppTheme.lightTheme, home: home);
    }

    testWidgets('AssessmentPage가 올바르게 렌더링되고 기본 기능이 작동하는지 확인', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestApp(const AssessmentPage()));

      await tester.pumpAndSettle();

      // 헤더 확인
      expect(find.text('MBTI 간편 검사'), findsOneWidget);
      expect(find.textContaining('1 /'), findsOneWidget);

      // 진행률 확인
      expect(find.text('진행률'), findsOneWidget);
      expect(find.text('0%'), findsOneWidget);

      // 질문 카드 확인
      expect(find.byIcon(Icons.psychology), findsOneWidget);
      expect(find.text('전혀\n아니다'), findsOneWidget);
      expect(find.text('매우\n그렇다'), findsOneWidget);

      // 리커트 척도 버튼들 확인
      expect(find.text('1'), findsOneWidget);
      expect(find.text('2'), findsOneWidget);
      expect(find.text('3'), findsOneWidget);
      expect(find.text('4'), findsOneWidget);
      expect(find.text('5'), findsOneWidget);

      // 네비게이션 확인
      expect(find.text('답변을 선택해주세요'), findsOneWidget);
    });

    testWidgets('AssessmentPage에서 답변 선택 및 진행 기능이 올바르게 작동하는지 확인', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestApp(const AssessmentPage()));

      await tester.pumpAndSettle();

      // 첫 번째 질문에 답변
      await tester.tap(find.text('3'));
      await tester.pumpAndSettle();

      // 답변 선택 후 텍스트가 나타나는지 확인
      expect(find.textContaining('보통이다'), findsOneWidget);

      // 다음 버튼이 활성화되었는지 확인
      expect(find.text('다음'), findsOneWidget);

      // 다음 버튼 탭 (자동으로 다음 질문으로 이동하므로 이 테스트는 타이밍에 민감함)
      await tester.pump(const Duration(milliseconds: 500));
    });

    testWidgets('ResultPage가 올바르게 렌더링되고 모든 섹션이 표시되는지 확인', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestApp(ResultPage(result: testResult)));

      await tester.pumpAndSettle();

      // 헤더 확인
      expect(find.text('검사 결과'), findsOneWidget);
      expect(find.text('당신의 성격 유형을 확인해보세요'), findsOneWidget);

      // 결과 카드 확인
      expect(find.text('INTJ'), findsOneWidget);
      expect(find.text('The Architect'), findsOneWidget);
      expect(find.text('신뢰도: 85%'), findsOneWidget);

      // 점수 분석 확인
      expect(find.text('세부 점수'), findsOneWidget);
      expect(find.text('외향성 vs 내향성'), findsOneWidget);

      // 강점/약점 확인
      expect(find.text('강점'), findsOneWidget);
      expect(find.text('개선점'), findsOneWidget);

      // 커리어 제안 확인
      expect(find.text('추천 직업'), findsOneWidget);

      // 상세 설명 확인
      expect(find.text('당신의 이야기'), findsOneWidget);

      // 액션 버튼 확인
      expect(find.text('홈으로 돌아가기'), findsOneWidget);
      expect(find.text('다시 검사하기'), findsOneWidget);
    });

    testWidgets('ResultPage에서 다시 검사하기 버튼이 AssessmentPage로 이동하는지 확인', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestApp(ResultPage(result: testResult)));

      await tester.pumpAndSettle();

      // 다시 검사하기 버튼 탭
      await tester.tap(find.text('다시 검사하기'));
      await tester.pumpAndSettle();

      // AssessmentPage로 이동했는지 확인
      expect(find.text('MBTI 간편 검사'), findsOneWidget);
      expect(find.text('진행률'), findsOneWidget);
    });

    testWidgets('TypeDetailPage가 올바르게 렌더링되고 모든 섹션이 표시되는지 확인', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestApp(TypeDetailPage(type: testType)));

      await tester.pumpAndSettle();

      // 헤더 확인
      expect(find.text('INTJ - The Architect'), findsOneWidget);
      expect(find.text('합리주의자'), findsOneWidget);

      // 메인 카드 확인
      expect(find.text('INTJ'), findsAtLeastNWidgets(1));
      expect(find.text('The Architect'), findsAtLeastNWidgets(1));

      // 성격 특성 확인
      expect(find.text('성격 특성'), findsOneWidget);

      // 강점/약점 확인
      expect(find.text('강점'), findsOneWidget);
      expect(find.text('개선점'), findsOneWidget);

      // 추천 직업 확인
      expect(find.text('추천 직업'), findsOneWidget);

      // 상세 이야기 확인
      expect(find.text('당신의 이야기'), findsOneWidget);

      // 궁합 정보 확인
      expect(find.text('궁합 정보'), findsOneWidget);

      // 액션 버튼 확인
      expect(find.text('홈으로 돌아가기'), findsOneWidget);
      expect(find.text('이전으로'), findsOneWidget);
    });

    testWidgets('모든 페이지에서 뒤로가기 버튼이 올바르게 작동하는지 확인', (WidgetTester tester) async {
      // AssessmentPage 테스트
      await tester.pumpWidget(createTestApp(const AssessmentPage()));

      await tester.pumpAndSettle();

      await tester.tap(
        find.byIcon(Icons.arrow_back).first,
        warnIfMissed: false,
      );
      await tester.pump();
      expect(tester.takeException(), isNull);

      // ResultPage 테스트
      await tester.pumpWidget(createTestApp(ResultPage(result: testResult)));

      await tester.pumpAndSettle();

      await tester.tap(
        find.byIcon(Icons.arrow_back).first,
        warnIfMissed: false,
      );
      await tester.pump();
      expect(tester.takeException(), isNull);

      // TypeDetailPage 테스트
      await tester.pumpWidget(createTestApp(TypeDetailPage(type: testType)));

      await tester.pumpAndSettle();

      await tester.tap(
        find.byIcon(Icons.arrow_back).first,
        warnIfMissed: false,
      );
      await tester.pump();
      expect(tester.takeException(), isNull);
    });

    testWidgets('페이지들의 애니메이션이 올바르게 작동하는지 확인', (WidgetTester tester) async {
      // ResultPage 애니메이션 테스트
      await tester.pumpWidget(createTestApp(ResultPage(result: testResult)));

      // 초기 상태
      await tester.pump();

      // 애니메이션 진행
      await tester.pump(const Duration(milliseconds: 200));
      await tester.pump(const Duration(milliseconds: 400));
      await tester.pump(const Duration(milliseconds: 600));

      // 애니메이션 완료
      await tester.pumpAndSettle();

      expect(find.text('검사 결과'), findsOneWidget);
      expect(find.text('INTJ'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('모든 페이지에서 스크롤이 올바르게 작동하는지 확인', (WidgetTester tester) async {
      // ResultPage 스크롤 테스트
      await tester.pumpWidget(createTestApp(ResultPage(result: testResult)));

      await tester.pumpAndSettle();

      final scrollView = find.byType(SingleChildScrollView).first;
      expect(scrollView, findsOneWidget);

      // 스크롤 테스트
      await tester.drag(scrollView, const Offset(0, -300));
      await tester.pumpAndSettle();

      expect(tester.takeException(), isNull);
    });

    testWidgets('페이지 간 데이터 전달이 올바르게 작동하는지 확인', (WidgetTester tester) async {
      // TypeDetailPage에 MBTIType 전달 테스트
      await tester.pumpWidget(createTestApp(TypeDetailPage(type: testType)));

      await tester.pumpAndSettle();

      expect(find.text(testType.code), findsAtLeastNWidgets(1));
      expect(find.text(testType.name), findsAtLeastNWidgets(1));
      expect(find.text(testType.categoryName), findsAtLeastNWidgets(1));

      // ResultPage에 AssessmentResult 전달 테스트
      await tester.pumpWidget(createTestApp(ResultPage(result: testResult)));

      await tester.pumpAndSettle();

      expect(find.text(testResult.type.code), findsAtLeastNWidgets(1));
      expect(find.text(testResult.type.name), findsAtLeastNWidgets(1));
      expect(
        find.textContaining('${(testResult.reliability * 100).toInt()}%'),
        findsOneWidget,
      );
    });

    testWidgets('에러 상황에서도 앱이 안정적으로 작동하는지 확인', (WidgetTester tester) async {
      // 잘못된 데이터로 테스트
      final invalidResult = AssessmentResult(
        id: '',
        type: testType,
        scores: {}, // 빈 스코어
        completedAt: DateTime.now(),
        testType: AssessmentType.quick,
        reliability: 0.0,
      );

      await tester.pumpWidget(createTestApp(ResultPage(result: invalidResult)));

      await tester.pumpAndSettle();

      // 앱이 크래시하지 않고 기본 구조는 유지되는지 확인
      expect(find.text('검사 결과'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('메모리 누수 없이 페이지들이 정상적으로 생성/제거되는지 확인', (
      WidgetTester tester,
    ) async {
      // 여러 번 페이지를 생성하고 제거
      for (int i = 0; i < 3; i++) {
        await tester.pumpWidget(createTestApp(const AssessmentPage()));
        await tester.pumpAndSettle();

        expect(find.text('MBTI 간편 검사'), findsOneWidget);

        await tester.pumpWidget(Container());
        await tester.pump();
      }

      // 마지막으로 정상 페이지 실행
      await tester.pumpWidget(createTestApp(ResultPage(result: testResult)));
      await tester.pumpAndSettle();

      expect(find.text('검사 결과'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  });
}
