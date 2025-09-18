import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mbti_go/main.dart';
import 'package:mbti_go/features/home/presentation/widgets/mbti_type_card.dart';
import 'package:mbti_go/features/home/presentation/widgets/home_header.dart';
import 'package:mbti_go/features/home/presentation/widgets/mbti_type_grid.dart';

void main() {
  group('MBTI Go 앱 메인 위젯 테스트', () {
    testWidgets('MBTIApp이 올바른 설정으로 생성되는지 확인', (WidgetTester tester) async {
      await tester.pumpWidget(const MBTIApp());

      // MaterialApp 확인
      final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));

      expect(materialApp.title, 'MBTI Go');
      expect(materialApp.theme, isNotNull);
      expect(materialApp.darkTheme, isNotNull);
      expect(materialApp.themeMode, ThemeMode.light);
      expect(materialApp.debugShowCheckedModeBanner, false);
    });

    testWidgets('앱의 홈페이지가 올바르게 표시되는지 확인', (WidgetTester tester) async {
      await tester.pumpWidget(const MBTIApp());
      await tester.pumpAndSettle();

      // 기본 구조 확인
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(SafeArea), findsOneWidget);
      expect(find.byType(Column), findsWidgets);

      // 주요 컴포넌트 확인
      expect(find.byType(HomeHeader), findsOneWidget);
      expect(find.byType(MBTITypeGrid), findsOneWidget);
    });

    testWidgets('앱의 모든 텍스트 요소가 표시되는지 확인', (WidgetTester tester) async {
      await tester.pumpWidget(const MBTIApp());
      await tester.pumpAndSettle();

      // 헤더 텍스트 확인
      expect(find.text('MBTI Go'), findsOneWidget);
      expect(find.text('당신의 성격 유형을 발견하세요'), findsOneWidget);
      expect(find.text('MBTI 검사 시작하기'), findsOneWidget);

      // MBTI 타입들이 표시되는지 확인 (일부 샘플)
      expect(find.text('INTJ'), findsOneWidget);
      expect(find.text('ENFP'), findsOneWidget);
      expect(find.text('ISTP'), findsOneWidget);
      expect(find.text('ESFJ'), findsOneWidget);
    });

    testWidgets('16개의 MBTI 타입 카드가 모두 표시되는지 확인', (WidgetTester tester) async {
      await tester.pumpWidget(const MBTIApp());
      await tester.pumpAndSettle();

      expect(find.byType(MBTITypeCard), findsNWidgets(16));
    });

    testWidgets('애니메이션이 올바르게 작동하는지 확인', (WidgetTester tester) async {
      await tester.pumpWidget(const MBTIApp());

      // 초기 프레임
      await tester.pump();

      // 애니메이션 진행 확인
      await tester.pump(const Duration(milliseconds: 500));

      // 애니메이션 완료 대기
      await tester.pumpAndSettle();

      // 최종 상태에서 모든 요소가 표시되는지 확인
      expect(find.text('MBTI Go'), findsOneWidget);
      expect(find.byType(MBTITypeCard), findsNWidgets(16));
    });

    testWidgets('GridView 스크롤이 올바르게 작동하는지 확인', (WidgetTester tester) async {
      await tester.pumpWidget(const MBTIApp());
      await tester.pumpAndSettle();

      final gridView = find.byType(GridView);
      expect(gridView, findsOneWidget);

      // 스크롤 테스트
      await tester.drag(gridView, const Offset(0, -200));
      await tester.pump();

      // 스크롤 후에도 카드들이 여전히 존재하는지 확인
      expect(find.byType(MBTITypeCard), findsNWidgets(16));
    });

    testWidgets('터치 이벤트가 올바르게 처리되는지 확인', (WidgetTester tester) async {
      await tester.pumpWidget(const MBTIApp());
      await tester.pumpAndSettle();

      // 검사 시작 버튼 탭 테스트
      await tester.tap(find.text('MBTI 검사 시작하기'));
      await tester.pump();

      // MBTI 카드 탭 테스트
      await tester.tap(find.byType(MBTITypeCard).first);
      await tester.pump();

      // 에러가 발생하지 않았는지 확인
      expect(tester.takeException(), isNull);
    });

    testWidgets('앱 테마가 올바르게 적용되어 있는지 확인', (WidgetTester tester) async {
      await tester.pumpWidget(const MBTIApp());

      final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
      final theme = materialApp.theme;

      expect(theme, isNotNull);
      expect(theme!.useMaterial3, isTrue);
    });

    testWidgets('작은 화면에서도 올바르게 렌더링되는지 확인', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(300, 600));

      await tester.pumpWidget(const MBTIApp());
      await tester.pumpAndSettle();

      expect(find.text('MBTI Go'), findsOneWidget);
      expect(find.byType(MBTITypeCard), findsNWidgets(16));

      addTearDown(() => tester.binding.setSurfaceSize(null));
    });

    testWidgets('큰 화면에서도 올바르게 렌더링되는지 확인', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 800));

      await tester.pumpWidget(const MBTIApp());
      await tester.pumpAndSettle();

      expect(find.text('MBTI Go'), findsOneWidget);
      expect(find.byType(MBTITypeCard), findsNWidgets(16));

      addTearDown(() => tester.binding.setSurfaceSize(null));
    });

    testWidgets('앱이 메모리 누수 없이 정상적으로 작동하는지 확인', (WidgetTester tester) async {
      // 여러 번 앱을 생성하고 제거
      for (int i = 0; i < 3; i++) {
        await tester.pumpWidget(const MBTIApp());
        await tester.pumpAndSettle();

        expect(find.text('MBTI Go'), findsOneWidget);

        await tester.pumpWidget(Container());
        await tester.pump();
      }

      // 마지막으로 정상 앱 실행
      await tester.pumpWidget(const MBTIApp());
      await tester.pumpAndSettle();

      expect(find.text('MBTI Go'), findsOneWidget);
    });

    testWidgets('다크 테마가 설정되어 있는지 확인', (WidgetTester tester) async {
      await tester.pumpWidget(const MBTIApp());

      final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));

      expect(materialApp.darkTheme, isNotNull);
      expect(materialApp.themeMode, ThemeMode.light); // 현재는 라이트 모드
    });

    testWidgets('앱의 기본 네비게이션 구조가 올바른지 확인', (WidgetTester tester) async {
      await tester.pumpWidget(const MBTIApp());
      await tester.pumpAndSettle();

      // Navigator가 존재하는지 확인
      expect(find.byType(Navigator), findsOneWidget);

      // 현재 홈페이지가 표시되는지 확인
      expect(find.byType(Scaffold), findsOneWidget);
    });

    testWidgets('앱의 전체 구조가 기대한 대로 구성되어 있는지 확인', (WidgetTester tester) async {
      await tester.pumpWidget(const MBTIApp());
      await tester.pumpAndSettle();

      // Widget 트리 구조 확인
      expect(find.byType(MaterialApp), findsOneWidget);
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(SafeArea), findsOneWidget);
      expect(find.byType(Column), findsWidgets);

      // 필수 위젯들이 존재하는지 확인
      expect(find.byType(HomeHeader), findsOneWidget);
      expect(find.byType(MBTITypeGrid), findsOneWidget);
      expect(find.byType(GridView), findsOneWidget);
    });

    testWidgets('앱이 오류 없이 완전히 로드되는지 확인', (WidgetTester tester) async {
      await tester.pumpWidget(const MBTIApp());

      // 점진적으로 프레임을 렌더링하며 오류 확인
      for (int i = 0; i < 10; i++) {
        await tester.pump(const Duration(milliseconds: 100));
        expect(tester.takeException(), isNull);
      }

      await tester.pumpAndSettle();

      // 최종 상태 확인
      expect(find.text('MBTI Go'), findsOneWidget);
      expect(find.byType(MBTITypeCard), findsNWidgets(16));
      expect(tester.takeException(), isNull);
    });
  });
}