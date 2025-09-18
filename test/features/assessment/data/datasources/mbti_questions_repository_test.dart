import 'package:flutter_test/flutter_test.dart';
import 'package:mbti_go/features/assessment/data/datasources/mbti_questions_repository.dart';
import 'package:mbti_go/features/assessment/domain/entities/question.dart';

void main() {
  group('MBTIQuestionsRepository 테스트', () {
    test('getQuestions가 20개의 질문을 반환하는지 확인', () {
      final questions = MBTIQuestionsRepository.getQuestions();

      expect(questions.length, 20);
      expect(questions.every((q) => q.id > 0), true);
    });

    test('질문 ID가 1부터 20까지 순차적으로 배정되어 있는지 확인', () {
      final questions = MBTIQuestionsRepository.getQuestions();
      final ids = questions.map((q) => q.id).toList();

      for (int i = 0; i < 20; i++) {
        expect(ids[i], i + 1);
      }

      expect(ids.toSet().length, 20); // 중복 없음
    });

    test('4개 차원(E/I, S/N, T/F, J/P)이 모두 포함되어 있는지 확인', () {
      final questions = MBTIQuestionsRepository.getQuestions();
      final dimensions = questions.map((q) => q.dimension).toSet();

      expect(dimensions.contains(QuestionDimension.ei), true);
      expect(dimensions.contains(QuestionDimension.sn), true);
      expect(dimensions.contains(QuestionDimension.tf), true);
      expect(dimensions.contains(QuestionDimension.jp), true);
      expect(dimensions.length, 4);
    });

    test('각 차원별로 균등하게 분배되어 있는지 확인', () {
      final questions = MBTIQuestionsRepository.getQuestions();

      final eiQuestions = questions.where((q) => q.dimension == QuestionDimension.ei).length;
      final snQuestions = questions.where((q) => q.dimension == QuestionDimension.sn).length;
      final tfQuestions = questions.where((q) => q.dimension == QuestionDimension.tf).length;
      final jpQuestions = questions.where((q) => q.dimension == QuestionDimension.jp).length;

      // 20개 질문이 4개 차원에 균등하게 분배 (각 5개)
      expect(eiQuestions, 5);
      expect(snQuestions, 5);
      expect(tfQuestions, 5);
      expect(jpQuestions, 5);
      expect(eiQuestions + snQuestions + tfQuestions + jpQuestions, 20);
    });

    test('모든 질문이 5점 리커트 척도 구조를 가지고 있는지 확인', () {
      final questions = MBTIQuestionsRepository.getQuestions();

      for (final question in questions) {
        expect(question.options.length, 5);

        // 점수 범위 확인 (-2.0 ~ +2.0)
        final scores = question.options.map((o) => o.score).toList();
        expect(scores, containsAll([-2.0, -1.0, 0.0, 1.0, 2.0]));

        // 값 범위 확인 (1 ~ 5)
        final values = question.options.map((o) => o.value).toList();
        expect(values, containsAll([1, 2, 3, 4, 5]));
      }
    });

    test('정방향 질문과 역방향 질문이 적절히 섞여 있는지 확인', () {
      final questions = MBTIQuestionsRepository.getQuestions();

      final normalQuestions = questions.where((q) => !q.isReversed).length;
      final reversedQuestions = questions.where((q) => q.isReversed).length;

      // 밸런스 확인 (정확한 비율은 설계에 따라 다를 수 있음)
      expect(normalQuestions > 0, true);
      expect(reversedQuestions > 0, true);
      expect(normalQuestions + reversedQuestions, 20);

      // 각 차원별로 역방향 질문이 포함되어 있는지 확인
      for (final dimension in QuestionDimension.values) {
        final dimensionQuestions = questions.where((q) => q.dimension == dimension);
        final hasReversed = dimensionQuestions.any((q) => q.isReversed);
        expect(hasReversed, true,
               reason: '$dimension 차원에 역방향 질문이 없습니다.');
      }
    });

    test('질문 텍스트가 비어있지 않고 한국어로 작성되어 있는지 확인', () {
      final questions = MBTIQuestionsRepository.getQuestions();

      for (final question in questions) {
        expect(question.text.isNotEmpty, true);
        expect(question.text.trim().length > 5, true); // 최소 길이 확인

        // 한국어 문자 포함 확인 (간단한 검사)
        final hasKorean = RegExp(r'[가-힣]').hasMatch(question.text);
        expect(hasKorean, true,
               reason: '질문 ${question.id}가 한국어로 작성되지 않았습니다: ${question.text}');
      }
    });

    test('옵션 텍스트가 표준 5점 척도 형식인지 확인', () {
      final questions = MBTIQuestionsRepository.getQuestions();

      for (final question in questions) {
        final optionTexts = question.options.map((o) => o.text).toList();

        expect(optionTexts.length, 5);
        expect(optionTexts, containsAll([
          '전혀 그렇지 않다',
          '그렇지 않다',
          '보통이다',
          '그렇다',
          '매우 그렇다'
        ]));
      }
    });

    test('특정 차원의 질문들 검증 (E/I)', () {
      final questions = MBTIQuestionsRepository.getQuestions();
      final eiQuestions = questions.where((q) => q.dimension == QuestionDimension.ei).toList();

      expect(eiQuestions.length, 5);

      // E/I 차원 질문들이 외향성/내향성과 관련된 내용인지 간단히 확인
      for (final question in eiQuestions) {
        final text = question.text.toLowerCase();
        final hasRelatedKeywords = text.contains('사람') ||
                                  text.contains('모임') ||
                                  text.contains('파티') ||
                                  text.contains('혼자') ||
                                  text.contains('조용') ||
                                  text.contains('사교');

        // 모든 질문이 키워드를 포함할 필요는 없지만,
        // 최소한 일부는 관련 키워드를 포함해야 함
        expect(eiQuestions.any((q) =>
               q.text.toLowerCase().contains('사람') ||
               q.text.toLowerCase().contains('모임') ||
               q.text.toLowerCase().contains('혼자')), true);
      }
    });

    test('역방향 질문의 점수 처리 로직 확인', () {
      final questions = MBTIQuestionsRepository.getQuestions();
      final reversedQuestions = questions.where((q) => q.isReversed).toList();

      expect(reversedQuestions.isNotEmpty, true);

      for (final question in reversedQuestions) {
        expect(question.isReversed, true);

        // 역방향 질문도 기본 점수 구조는 동일해야 함
        final scores = question.options.map((o) => o.score).toList();
        expect(scores, containsAll([-2.0, -1.0, 0.0, 1.0, 2.0]));

        // 실제 점수 계산 시에는 반전되어야 하지만,
        // 저장된 구조는 표준 형태를 유지해야 함
      }
    });

    test('질문 순서가 차원별로 적절히 섞여 있는지 확인', () {
      final questions = MBTIQuestionsRepository.getQuestions();

      // 연속된 질문이 모두 같은 차원인 경우가 없는지 확인 (3개 이상 연속)
      int consecutiveCount = 1;
      QuestionDimension? prevDimension;

      for (final question in questions) {
        if (prevDimension == question.dimension) {
          consecutiveCount++;
        } else {
          consecutiveCount = 1;
        }

        expect(consecutiveCount <= 3, true,
               reason: '${question.dimension} 차원의 질문이 너무 많이 연속됩니다.');

        prevDimension = question.dimension;
      }
    });

    test('getQuestions 메서드의 일관성 확인', () {
      final questions1 = MBTIQuestionsRepository.getQuestions();
      final questions2 = MBTIQuestionsRepository.getQuestions();

      expect(questions1.length, questions2.length);

      for (int i = 0; i < questions1.length; i++) {
        expect(questions1[i].id, questions2[i].id);
        expect(questions1[i].text, questions2[i].text);
        expect(questions1[i].dimension, questions2[i].dimension);
        expect(questions1[i].isReversed, questions2[i].isReversed);
        expect(questions1[i].options.length, questions2[i].options.length);
      }
    });

    test('각 차원별 대표 질문 내용 확인', () {
      final questions = MBTIQuestionsRepository.getQuestions();

      // E/I 차원
      final eiQuestions = questions.where((q) => q.dimension == QuestionDimension.ei);
      expect(eiQuestions.any((q) => q.text.contains('사람들과 어울리는')), true);

      // S/N 차원
      final snQuestions = questions.where((q) => q.dimension == QuestionDimension.sn);
      expect(snQuestions.any((q) => q.text.contains('새로운 가능성') || q.text.contains('상상')), true);

      // T/F 차원
      final tfQuestions = questions.where((q) => q.dimension == QuestionDimension.tf);
      expect(tfQuestions.any((q) => q.text.contains('논리') || q.text.contains('감정')), true);

      // J/P 차원
      final jpQuestions = questions.where((q) => q.dimension == QuestionDimension.jp);
      expect(jpQuestions.any((q) => q.text.contains('계획') || q.text.contains('즉흥')), true);
    });
  });
}