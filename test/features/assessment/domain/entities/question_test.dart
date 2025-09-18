import 'package:flutter_test/flutter_test.dart';
import 'package:mbti_go/features/assessment/domain/entities/question.dart';

void main() {
  group('Question 엔티티 테스트', () {
    test('Question 객체가 올바르게 생성되는지 확인', () {
      final question = Question(
        id: 1,
        text: '파티나 모임에서 많은 사람들과 어울리는 것이 즐겁다',
        dimension: QuestionDimension.ei,
        options: [
          const QuestionOption(text: '전혀 그렇지 않다', score: -2.0, value: 1),
          const QuestionOption(text: '그렇지 않다', score: -1.0, value: 2),
          const QuestionOption(text: '보통이다', score: 0.0, value: 3),
          const QuestionOption(text: '그렇다', score: 1.0, value: 4),
          const QuestionOption(text: '매우 그렇다', score: 2.0, value: 5),
        ],
      );

      expect(question.id, 1);
      expect(question.text, '파티나 모임에서 많은 사람들과 어울리는 것이 즐겁다');
      expect(question.dimension, QuestionDimension.ei);
      expect(question.options.length, 5);
      expect(question.isReversed, false); // 기본값
    });

    test('Question의 isReversed 속성이 올바르게 작동하는지 확인', () {
      final normalQuestion = Question(
        id: 1,
        text: '외향적인 질문',
        dimension: QuestionDimension.ei,
        options: [],
        isReversed: false,
      );

      final reversedQuestion = Question(
        id: 2,
        text: '내향적인 질문',
        dimension: QuestionDimension.ei,
        options: [],
        isReversed: true,
      );

      expect(normalQuestion.isReversed, false);
      expect(reversedQuestion.isReversed, true);
    });

    test('QuestionDimension enum이 올바르게 정의되어 있는지 확인', () {
      expect(QuestionDimension.values.length, 4);
      expect(QuestionDimension.values.contains(QuestionDimension.ei), true);
      expect(QuestionDimension.values.contains(QuestionDimension.sn), true);
      expect(QuestionDimension.values.contains(QuestionDimension.tf), true);
      expect(QuestionDimension.values.contains(QuestionDimension.jp), true);
    });

    test('Question의 options 리스트가 올바르게 작동하는지 확인', () {
      final question = Question(
        id: 1,
        text: '테스트 질문',
        dimension: QuestionDimension.ei,
        options: [
          const QuestionOption(text: '옵션 1', score: -2.0, value: 1),
          const QuestionOption(text: '옵션 2', score: -1.0, value: 2),
          const QuestionOption(text: '옵션 3', score: 0.0, value: 3),
          const QuestionOption(text: '옵션 4', score: 1.0, value: 4),
          const QuestionOption(text: '옵션 5', score: 2.0, value: 5),
        ],
      );

      expect(question.options.length, 5);
      expect(question.options[0].text, '옵션 1');
      expect(question.options[0].score, -2.0);
      expect(question.options[0].value, 1);
      expect(question.options[4].text, '옵션 5');
      expect(question.options[4].score, 2.0);
      expect(question.options[4].value, 5);
    });

    test('빈 options 리스트로 Question 생성 시 처리', () {
      final question = Question(
        id: 1,
        text: '빈 옵션 질문',
        dimension: QuestionDimension.ei,
        options: [],
      );

      expect(question.options.isEmpty, true);
      expect(question.options.length, 0);
    });
  });

  group('QuestionOption 엔티티 테스트', () {
    test('QuestionOption 객체가 올바르게 생성되는지 확인', () {
      const option = QuestionOption(
        text: '매우 그렇다',
        score: 2.0,
        value: 5,
      );

      expect(option.text, '매우 그렇다');
      expect(option.score, 2.0);
      expect(option.value, 5);
    });

    test('QuestionOption의 score 범위 확인', () {
      const negativeOption = QuestionOption(
        text: '전혀 그렇지 않다',
        score: -2.0,
        value: 1,
      );

      const neutralOption = QuestionOption(
        text: '보통이다',
        score: 0.0,
        value: 3,
      );

      const positiveOption = QuestionOption(
        text: '매우 그렇다',
        score: 2.0,
        value: 5,
      );

      expect(negativeOption.score, -2.0);
      expect(neutralOption.score, 0.0);
      expect(positiveOption.score, 2.0);

      // 5점 리커트 척도 범위 내에 있는지 확인
      expect(negativeOption.score >= -2.0 && negativeOption.score <= 2.0, true);
      expect(neutralOption.score >= -2.0 && neutralOption.score <= 2.0, true);
      expect(positiveOption.score >= -2.0 && positiveOption.score <= 2.0, true);
    });

    test('QuestionOption의 value 순서 확인', () {
      const options = [
        QuestionOption(text: '전혀 그렇지 않다', score: -2.0, value: 1),
        QuestionOption(text: '그렇지 않다', score: -1.0, value: 2),
        QuestionOption(text: '보통이다', score: 0.0, value: 3),
        QuestionOption(text: '그렇다', score: 1.0, value: 4),
        QuestionOption(text: '매우 그렇다', score: 2.0, value: 5),
      ];

      // value가 순차적으로 증가하는지 확인
      for (int i = 0; i < options.length; i++) {
        expect(options[i].value, i + 1);
      }

      // score가 올바른 순서인지 확인
      expect(options[0].score < options[1].score, true);
      expect(options[1].score < options[2].score, true);
      expect(options[2].score < options[3].score, true);
      expect(options[3].score < options[4].score, true);
    });

    test('QuestionOption 동등성 비교', () {
      const option1 = QuestionOption(
        text: '매우 그렇다',
        score: 2.0,
        value: 5,
      );

      const option2 = QuestionOption(
        text: '매우 그렇다',
        score: 2.0,
        value: 5,
      );

      const option3 = QuestionOption(
        text: '그렇다',
        score: 1.0,
        value: 4,
      );

      // Equatable을 사용한 값 기반 동등성 비교
      expect(option1 == option2, true); // 같은 내용
      expect(option1 == option3, false); // 다른 내용
      expect(identical(option1, option1), true); // 같은 참조
    });

    test('QuestionOption 불변성 확인 (immutable)', () {
      const option = QuestionOption(
        text: '매우 그렇다',
        score: 2.0,
        value: 5,
      );

      // final 필드이므로 컴파일 타임에 변경 불가능
      // option.text = '다른 텍스트'; // 컴파일 에러
      // option.score = 1.0; // 컴파일 에러
      // option.value = 4; // 컴파일 에러

      expect(option.text, '매우 그렇다');
      expect(option.score, 2.0);
      expect(option.value, 5);
    });

    test('QuestionOption toString 메서드 테스트', () {
      const option = QuestionOption(
        text: '매우 그렇다',
        score: 2.0,
        value: 5,
      );

      final stringRepresentation = option.toString();
      expect(stringRepresentation, contains('매우 그렇다'));
      expect(stringRepresentation, contains('2.0'));
      expect(stringRepresentation, contains('5'));
    });
  });

  group('Question과 QuestionOption 통합 테스트', () {
    test('5점 리커트 척도 표준 질문 구조 확인', () {
      final question = Question(
        id: 1,
        text: '파티나 모임에서 많은 사람들과 어울리는 것이 즐겁다',
        dimension: QuestionDimension.ei,
        options: [
          const QuestionOption(text: '전혀 그렇지 않다', score: -2.0, value: 1),
          const QuestionOption(text: '그렇지 않다', score: -1.0, value: 2),
          const QuestionOption(text: '보통이다', score: 0.0, value: 3),
          const QuestionOption(text: '그렇다', score: 1.0, value: 4),
          const QuestionOption(text: '매우 그렇다', score: 2.0, value: 5),
        ],
      );

      // 5점 척도 확인
      expect(question.options.length, 5);

      // 스코어 범위 확인 (-2.0 ~ +2.0)
      expect(question.options.map((o) => o.score).reduce((a, b) => a < b ? a : b), -2.0);
      expect(question.options.map((o) => o.score).reduce((a, b) => a > b ? a : b), 2.0);

      // 값 범위 확인 (1 ~ 5)
      expect(question.options.map((o) => o.value).reduce((a, b) => a < b ? a : b), 1);
      expect(question.options.map((o) => o.value).reduce((a, b) => a > b ? a : b), 5);

      // 중성 옵션 확인
      final neutralOption = question.options.firstWhere((o) => o.score == 0.0);
      expect(neutralOption.text, '보통이다');
      expect(neutralOption.value, 3);
    });

    test('역방향 질문 처리 로직 확인', () {
      final reversedQuestion = Question(
        id: 2,
        text: '혼자 있는 시간을 더 선호한다',
        dimension: QuestionDimension.ei,
        isReversed: true,
        options: [
          const QuestionOption(text: '전혀 그렇지 않다', score: -2.0, value: 1),
          const QuestionOption(text: '그렇지 않다', score: -1.0, value: 2),
          const QuestionOption(text: '보통이다', score: 0.0, value: 3),
          const QuestionOption(text: '그렇다', score: 1.0, value: 4),
          const QuestionOption(text: '매우 그렇다', score: 2.0, value: 5),
        ],
      );

      expect(reversedQuestion.isReversed, true);
      expect(reversedQuestion.dimension, QuestionDimension.ei);

      // 역방향 질문에서도 기본 점수 구조는 동일하지만
      // 실제 계산 시에는 점수를 뒤집어서 사용해야 함
      expect(reversedQuestion.options[0].score, -2.0); // 실제로는 +2.0으로 계산
      expect(reversedQuestion.options[4].score, 2.0);  // 실제로는 -2.0으로 계산
    });
  });
}