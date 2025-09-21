import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mbti_go/features/assessment/presentation/widgets/assessment_header_widget.dart';
import 'package:mbti_go/features/assessment/presentation/widgets/assessment_progress_widget.dart';
import 'package:mbti_go/features/assessment/presentation/widgets/assessment_question_content_widget.dart';
import 'package:mbti_go/features/assessment/presentation/widgets/assessment_navigation_widget.dart';
import 'package:mbti_go/features/assessment/domain/entities/question.dart';
import 'package:mbti_go/core/theme/app_theme.dart';

void main() {
  group('Assessment 위젯들 테스트', () {
    late List<Question> testQuestions;
    late Map<int, Answer> testAnswers;

    setUp(() {
      testQuestions = [
        Question(
          id: 1,
          text: '테스트 질문 1',
          dimension: QuestionDimension.ei,
          options: [
            QuestionOption(value: 1, text: '전혀 아니다', score: -2.0),
            QuestionOption(value: 2, text: '아니다', score: -1.0),
            QuestionOption(value: 3, text: '보통이다', score: 0.0),
            QuestionOption(value: 4, text: '그렇다', score: 1.0),
            QuestionOption(value: 5, text: '매우 그렇다', score: 2.0),
          ],
        ),
        Question(
          id: 2,
          text: '테스트 질문 2',
          dimension: QuestionDimension.sn,
          options: [
            QuestionOption(value: 1, text: '전혀 아니다', score: -2.0),
            QuestionOption(value: 2, text: '아니다', score: -1.0),
            QuestionOption(value: 3, text: '보통이다', score: 0.0),
            QuestionOption(value: 4, text: '그렇다', score: 1.0),
            QuestionOption(value: 5, text: '매우 그렇다', score: 2.0),
          ],
        ),
      ];

      testAnswers = {
        1: Answer(
          questionId: 1,
          selectedOption: testQuestions[0].options[2], // 보통이다
          answeredAt: DateTime.now(),
        ),
      };
    });

    Widget createTestWidget(Widget child) {
      return MaterialApp(
        theme: AppTheme.lightTheme,
        home: Scaffold(
          body: child,
        ),
      );
    }

    testWidgets('AssessmentHeaderWidget이 올바르게 렌더링되는지 확인', (WidgetTester tester) async {
      bool backPressed = false;

      await tester.pumpWidget(
        createTestWidget(
          AssessmentHeaderWidget(
            currentQuestionIndex: 0,
            totalQuestions: testQuestions.length,
            onBackPressed: () => backPressed = true,
          ),
        ),
      );

      expect(find.text('MBTI 간편 검사'), findsOneWidget);
      expect(find.text('1 / ${testQuestions.length}'), findsOneWidget);
      expect(find.byIcon(Icons.arrow_back), findsOneWidget);

      // 뒤로가기 버튼 탭 테스트
      await tester.tap(find.byIcon(Icons.arrow_back), warnIfMissed: false);
      await tester.pump();

      expect(backPressed, isTrue);
    });

    testWidgets('AssessmentProgressWidget이 올바르게 렌더링되는지 확인', (WidgetTester tester) async {
      final animationController = AnimationController(
        duration: const Duration(milliseconds: 500),
        vsync: const TestVSync(),
      );
      final progressAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(animationController);

      await tester.pumpWidget(
        createTestWidget(
          AssessmentProgressWidget(
            currentQuestionIndex: 0,
            totalQuestions: testQuestions.length,
            progressAnimation: progressAnimation,
          ),
        ),
      );

      expect(find.text('진행률'), findsOneWidget);
      expect(find.text('0%'), findsOneWidget);

      animationController.dispose();
    });

    testWidgets('AssessmentQuestionContentWidget이 올바르게 렌더링되는지 확인', (WidgetTester tester) async {
      final pageController = PageController();
      bool answerSelected = false;

      await tester.pumpWidget(
        createTestWidget(
          SizedBox(
            height: 600,
            child: AssessmentQuestionContentWidget(
              pageController: pageController,
              questions: testQuestions,
              answers: testAnswers,
              onAnswerSelected: (option) => answerSelected = true,
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('테스트 질문 1'), findsOneWidget);
      expect(find.text('전혀\n아니다'), findsOneWidget);
      expect(find.text('보통\n이다'), findsOneWidget);
      expect(find.text('매우\n그렇다'), findsOneWidget);
      expect(find.byIcon(Icons.psychology), findsOneWidget);

      // 리커트 척도 버튼이 5개 있는지 확인
      expect(find.text('1'), findsOneWidget);
      expect(find.text('2'), findsOneWidget);
      expect(find.text('3'), findsOneWidget);
      expect(find.text('4'), findsOneWidget);
      expect(find.text('5'), findsOneWidget);

      // 답변 선택 테스트
      await tester.tap(find.text('3'));
      await tester.pump();

      expect(answerSelected, isTrue);

      pageController.dispose();
    });

    testWidgets('AssessmentNavigationWidget이 올바르게 렌더링되는지 확인', (WidgetTester tester) async {
      // ignore: unused_local_variable
      bool previousPressed = false;
      // ignore: unused_local_variable
      bool nextPressed = false;
      // ignore: unused_local_variable
      bool completePressed = false;

      await tester.pumpWidget(
        createTestWidget(
          AssessmentNavigationWidget(
            currentQuestionIndex: 0, // First question where we have an answer
            questions: testQuestions,
            answers: testAnswers,
            onPrevious: () => previousPressed = true,
            onNext: () => nextPressed = true,
            onComplete: () => completePressed = true,
          ),
        ),
      );

      // First question (index 0) should not show previous button
      expect(find.text('이전'), findsNothing);
      expect(find.text('다음'), findsOneWidget);
      expect(find.byIcon(Icons.arrow_forward), findsOneWidget);

      // 다음 버튼 탭 테스트 (이전 버튼은 첫 번째 질문에서는 없음)
      await tester.tap(find.text('다음'), warnIfMissed: false);
      await tester.pump();
      expect(nextPressed, isTrue);
    });

    testWidgets('AssessmentNavigationWidget - 마지막 질문에서 완료 버튼이 표시되는지 확인', (WidgetTester tester) async {
      bool completePressed = false;

      // 마지막 질문에서 답변이 있는 상태
      final lastQuestionAnswers = {
        2: Answer(
          questionId: 2,
          selectedOption: testQuestions[1].options[3],
          answeredAt: DateTime.now(),
        ),
      };

      await tester.pumpWidget(
        createTestWidget(
          AssessmentNavigationWidget(
            currentQuestionIndex: 1, // 마지막 질문 (인덱스 1, 총 2개 질문)
            questions: testQuestions,
            answers: lastQuestionAnswers,
            onPrevious: () {},
            onNext: () {},
            onComplete: () => completePressed = true,
          ),
        ),
      );

      expect(find.text('완료'), findsOneWidget);
      expect(find.byIcon(Icons.check), findsOneWidget);

      // 완료 버튼 탭 테스트
      await tester.tap(find.text('완료'), warnIfMissed: false);
      await tester.pump();
      expect(completePressed, isTrue);
    });

    testWidgets('AssessmentNavigationWidget - 답변이 없을 때 비활성화 상태인지 확인', (WidgetTester tester) async {
      await tester.pumpWidget(
        createTestWidget(
          AssessmentNavigationWidget(
            currentQuestionIndex: 1, // 두 번째 질문 (답변 없음)
            questions: testQuestions,
            answers: {}, // 빈 답변
            onPrevious: () {},
            onNext: () {},
            onComplete: () {},
          ),
        ),
      );

      expect(find.text('답변을 선택해주세요'), findsOneWidget);
    });

    testWidgets('모든 Assessment 위젯들이 함께 올바르게 작동하는지 확인', (WidgetTester tester) async {
      final animationController = AnimationController(
        duration: const Duration(milliseconds: 500),
        vsync: const TestVSync(),
      );
      final progressAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(animationController);
      final pageController = PageController();

      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: Scaffold(
            body: Column(
              children: [
                AssessmentHeaderWidget(
                  currentQuestionIndex: 0,
                  totalQuestions: testQuestions.length,
                  onBackPressed: () {},
                ),
                AssessmentProgressWidget(
                  currentQuestionIndex: 0,
                  totalQuestions: testQuestions.length,
                  progressAnimation: progressAnimation,
                ),
                Expanded(
                  child: AssessmentQuestionContentWidget(
                    pageController: pageController,
                    questions: testQuestions,
                    answers: testAnswers,
                    onAnswerSelected: (option) {},
                  ),
                ),
                AssessmentNavigationWidget(
                  currentQuestionIndex: 0,
                  questions: testQuestions,
                  answers: testAnswers,
                  onPrevious: () {},
                  onNext: () {},
                  onComplete: () {},
                ),
              ],
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('MBTI 간편 검사'), findsOneWidget);
      expect(find.text('진행률'), findsOneWidget);
      expect(find.text('테스트 질문 1'), findsOneWidget);
      expect(find.text('다음'), findsOneWidget);
      // Note: May have overflow due to widget height constraints in test environment

      animationController.dispose();
      pageController.dispose();
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