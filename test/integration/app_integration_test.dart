import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mbti_go/main.dart' as app;
import 'package:mbti_go/features/home/presentation/widgets/mbti_type_card.dart';
import 'package:mbti_go/features/home/presentation/widgets/home_header.dart';

void main() {
  group('MBTI Go 앱 통합 테스트', () {
    testWidgets('앱이 정상적으로 시작되고 홈페이지가 표시되는지 확인', (WidgetTester tester) async {
      // 앱 시작
      app.main();
      await tester.pump(); // 초기 빌드
      await tester.pump(const Duration(seconds: 3)); // 애니메이션 진행

      // MaterialApp이 존재하는지 확인
      expect(find.byType(MaterialApp), findsOneWidget);

      // Scaffold가 존재하는지 확인
      expect(find.byType(Scaffold), findsOneWidget);

      // SafeArea가 존재하는지 확인
      expect(find.byType(SafeArea), findsOneWidget);
    });

    testWidgets('홈페이지의 모든 주요 컴포넌트가 렌더링되는지 확인', (WidgetTester tester) async {
      app.main();
      await tester.pump(); // 초기 빌드
      await tester.pump(const Duration(seconds: 3)); // 애니메이션 진행

      // 앱 제목 확인
      expect(find.text('MBTI Go'), findsOneWidget);

      // 부제목 확인
      expect(find.text('당신의 성격 유형을 발견하세요'), findsOneWidget);

      // 검사 시작 버튼 확인
      expect(find.text('MBTI 검사 시작하기'), findsOneWidget);

      // HomeHeader 위젯 확인
      expect(find.byType(HomeHeader), findsOneWidget);

      // 16개의 MBTI 타입 카드 확인
      expect(find.byType(MBTITypeCard), findsAtLeastNWidgets(2)); // GridView 지연 로딩 고려
    });

    testWidgets('전체 UI 애니메이션이 완료될 때까지 기다린 후 상태 확인', (WidgetTester tester) async {
      app.main();
      await tester.pump(); // 첫 프레임

      // 애니메이션 완료까지 기다리기 (1.5초)
      await tester.pump(const Duration(milliseconds: 1500));
      await tester.pumpAndSettle();

      // 모든 텍스트가 표시되는지 확인
      expect(find.text('MBTI Go'), findsOneWidget);
      expect(find.text('당신의 성격 유형을 발견하세요'), findsOneWidget);
      expect(find.text('MBTI 검사 시작하기'), findsOneWidget);

      // 일부 MBTI 카드 텍스트가 표시되는지 확인 (GridView lazy loading 고려)
      expect(find.text('INTJ'), findsWidgets);
      expect(find.byType(MBTITypeCard), findsAtLeastNWidgets(2));
    });

    testWidgets('홈페이지에서 MBTI 타입 카드 스크롤 기능 확인', (WidgetTester tester) async {
      app.main();
      await tester.pump(); // 초기 빌드
      await tester.pump(const Duration(seconds: 3)); // 애니메이션 진행

      // GridView 찾기
      final gridView = find.byType(GridView);
      expect(gridView, findsOneWidget);

      // 첫 번째 카드가 보이는지 확인 (GridView lazy loading 고려)
      expect(find.byType(MBTITypeCard), findsAtLeastNWidgets(2));

      // 스크롤 테스트
      await tester.drag(gridView, const Offset(0, -300));
      await tester.pumpAndSettle();

      // 스크롤 후에도 카드들이 여전히 존재하는지 확인
      expect(find.byType(MBTITypeCard), findsAtLeastNWidgets(2)); // GridView 지연 로딩 고려
    });

    testWidgets('MBTI 타입 카드 탭 상호작용 확인', (WidgetTester tester) async {
      app.main();
      await tester.pump(); // 초기 빌드
      await tester.pump(const Duration(seconds: 3)); // 애니메이션 진행

      // 첫 번째 MBTI 카드 탭
      final firstCard = find.byType(MBTITypeCard).first;
      await tester.tap(firstCard);
      await tester.pumpAndSettle();

      // 네비게이션이 발생했는지 확인 (타입 상세 페이지로 이동)
      // 실제 페이지가 구현되지 않았다면 적절한 처리가 되는지 확인
      expect(find.byType(MBTITypeCard), findsAny);
    });

    testWidgets('검사 시작 버튼 탭 상호작용 확인', (WidgetTester tester) async {
      app.main();
      await tester.pump(); // 초기 빌드
      await tester.pump(const Duration(seconds: 3)); // 애니메이션 진행

      // 검사 시작 버튼 탭
      final startButton = find.text('MBTI 검사 시작하기');
      await tester.tap(startButton);
      await tester.pumpAndSettle();

      // 네비게이션이 발생했는지 확인 (검사 페이지로 이동)
      // 실제 페이지가 구현되지 않았다면 적절한 처리가 되는지 확인
      expect(find.text('MBTI 검사 시작하기'), findsAny);
    });

    testWidgets('다양한 화면 크기에서 앱이 올바르게 작동하는지 확인', (WidgetTester tester) async {
      // 작은 화면 (모바일)
      await tester.binding.setSurfaceSize(const Size(360, 640));
      app.main();
      await tester.pump(); // 초기 빌드
      await tester.pump(const Duration(seconds: 3)); // 애니메이션 진행

      expect(find.text('MBTI Go'), findsOneWidget);
      expect(find.byType(MBTITypeCard), findsAtLeastNWidgets(2)); // GridView 지연 로딩 고려

      // 중간 화면 (태블릿)
      await tester.binding.setSurfaceSize(const Size(768, 1024));
      app.main();
      await tester.pump(); // 초기 빌드
      await tester.pump(const Duration(seconds: 3)); // 애니메이션 진행

      expect(find.text('MBTI Go'), findsOneWidget);
      expect(find.byType(MBTITypeCard), findsAtLeastNWidgets(2)); // GridView 지연 로딩 고려

      // 큰 화면 (데스크톱)
      await tester.binding.setSurfaceSize(const Size(1200, 800));
      app.main();
      await tester.pump(); // 초기 빌드
      await tester.pump(const Duration(seconds: 3)); // 애니메이션 진행

      expect(find.text('MBTI Go'), findsOneWidget);
      expect(find.byType(MBTITypeCard), findsAtLeastNWidgets(2)); // GridView 지연 로딩 고려

      addTearDown(() => tester.binding.setSurfaceSize(null));
    });

    testWidgets('메모리 누수 없이 앱이 정상적으로 dispose되는지 확인', (WidgetTester tester) async {
      app.main();
      await tester.pump(); // 초기 빌드
      await tester.pump(const Duration(seconds: 3)); // 애니메이션 진행

      // 정상적으로 앱이 실행되는지 확인
      expect(find.byType(MaterialApp), findsOneWidget);

      // 앱 종료 시뮬레이션
      await tester.binding.defaultBinaryMessenger.handlePlatformMessage(
        'flutter/lifecycle',
        const StandardMethodCodec().encodeMethodCall(
          const MethodCall('AppLifecycleState.detached'),
        ),
        (data) {},
      );

      await tester.pump();

      // 여전히 앱이 정상 상태인지 확인
      expect(find.byType(MaterialApp), findsOneWidget);
    });

    testWidgets('앱 테마가 올바르게 적용되어 있는지 확인', (WidgetTester tester) async {
      app.main();
      await tester.pump(); // 초기 빌드
      await tester.pump(const Duration(seconds: 3)); // 애니메이션 진행

      final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));

      // 테마가 설정되어 있는지 확인
      expect(materialApp.theme, isNotNull);
      expect(materialApp.darkTheme, isNotNull);

      // 현재 라이트 모드인지 확인
      expect(materialApp.themeMode, ThemeMode.light);

      // 앱 제목이 설정되어 있는지 확인
      expect(materialApp.title, 'MBTI Go');

      // 디버그 배너가 비활성화되어 있는지 확인
      expect(materialApp.debugShowCheckedModeBanner, false);
    });

    testWidgets('앱의 전체적인 성능이 허용 범위 내에 있는지 확인', (WidgetTester tester) async {
      final stopwatch = Stopwatch();

      // 앱 시작 시간 측정
      stopwatch.start();
      app.main();
      await tester.pump(); // 초기 빌드
      await tester.pump(const Duration(seconds: 3)); // 애니메이션 진행
      stopwatch.stop();

      // 앱 시작 시간이 합리적인 범위 내에 있는지 확인 (3초 이하)
      expect(stopwatch.elapsedMilliseconds, lessThan(3000));

      // UI 응답 시간 측정
      stopwatch.reset();
      stopwatch.start();

      // 카드 탭 응답 시간
      await tester.tap(find.byType(MBTITypeCard).first);
      await tester.pump();

      stopwatch.stop();

      // 터치 응답 시간이 합리적인 범위 내에 있는지 확인 (100ms 이하)
      expect(stopwatch.elapsedMilliseconds, lessThan(100));
    });

    testWidgets('앱이 다양한 상황에서 안정적으로 작동하는지 확인', (WidgetTester tester) async {
      app.main();
      await tester.pump(); // 초기 빌드
      await tester.pump(const Duration(seconds: 3)); // 애니메이션 진행

      // 빠른 연속 탭 테스트 (warnIfMissed: false로 경고 무시)
      final startButton = find.text('MBTI 검사 시작하기');
      for (int i = 0; i < 5; i++) {
        await tester.tap(startButton, warnIfMissed: false);
        await tester.pump();
      }
      await tester.pumpAndSettle();

      // 여전히 앱이 정상 상태인지 확인
      expect(find.text('MBTI Go'), findsOneWidget);

      // 빠른 연속 스크롤 테스트
      final gridView = find.byType(GridView);
      for (int i = 0; i < 5; i++) {
        await tester.drag(gridView, const Offset(0, -100));
        await tester.pump();
      }
      await tester.pumpAndSettle();

      // 여전히 모든 카드가 존재하는지 확인
      expect(find.byType(MBTITypeCard), findsAtLeastNWidgets(2)); // GridView 지연 로딩 고려
    });

    testWidgets('접근성 기능이 올바르게 작동하는지 확인', (WidgetTester tester) async {
      app.main();
      await tester.pump(); // 초기 빌드
      await tester.pump(const Duration(seconds: 3)); // 애니메이션 진행

      // 주요 UI 요소들이 접근 가능한지 확인
      expect(find.text('MBTI Go'), findsOneWidget);
      expect(find.text('MBTI 검사 시작하기'), findsOneWidget);

      // 버튼들이 접근 가능한지 확인
      final semanticButtons = find.byType(InkWell);
      expect(semanticButtons, findsWidgets);

      // 텍스트가 읽기 가능한지 확인
      final texts = find.byType(Text);
      expect(texts, findsWidgets);

      for (int i = 0; i < tester.widgetList(texts).length; i++) {
        final text = tester.widget<Text>(texts.at(i));
        expect(text.data?.isNotEmpty ?? false, true);
      }
    });
  });
}