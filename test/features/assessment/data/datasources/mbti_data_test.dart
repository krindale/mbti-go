import 'package:flutter_test/flutter_test.dart';
import 'package:mbti_go/features/assessment/data/datasources/mbti_data.dart';
import 'package:mbti_go/features/assessment/domain/entities/mbti_type.dart';
import 'package:mbti_go/features/assessment/domain/entities/question.dart';

void main() {
  group('MBTIData Facade 테스트', () {
    test('getAllTypes가 16개의 MBTI 타입을 반환하는지 확인', () {
      final types = MBTIData.getAllTypes();

      expect(types.length, 16);
      expect(types.every((type) => type is MBTIType), true);
      expect(types.every((type) => type.code.length == 4), true);
    });

    test('getTypeByCode가 올바른 타입을 반환하는지 확인', () {
      // 존재하는 타입
      final intj = MBTIData.getTypeByCode('INTJ');
      expect(intj, isNotNull);
      expect(intj!.code, 'INTJ');
      expect(intj.name, '전략가');

      final enfp = MBTIData.getTypeByCode('ENFP');
      expect(enfp, isNotNull);
      expect(enfp!.code, 'ENFP');
      expect(enfp.name, '활동가');
    });

    test('getTypeByCode가 존재하지 않는 타입에 대해 null을 반환하는지 확인', () {
      final invalidType = MBTIData.getTypeByCode('INVALID');
      expect(invalidType, isNull);

      final emptyType = MBTIData.getTypeByCode('');
      expect(emptyType, isNull);

      final shortType = MBTIData.getTypeByCode('INT');
      expect(shortType, isNull);

      final longType = MBTIData.getTypeByCode('INTJX');
      expect(longType, isNull);
    });

    test('getTypeByCode가 대소문자를 구분하는지 확인', () {
      final upperCase = MBTIData.getTypeByCode('INTJ');
      final lowerCase = MBTIData.getTypeByCode('intj');
      final mixedCase = MBTIData.getTypeByCode('IntJ');

      expect(upperCase, isNotNull);
      expect(lowerCase, isNull);
      expect(mixedCase, isNull);
    });

    test('getAnalysts가 4개의 Analysts 타입을 반환하는지 확인', () {
      final analysts = MBTIData.getAnalysts();

      expect(analysts.length, 4);
      expect(analysts.map((type) => type.code).toSet(), {
        'INTJ',
        'INTP',
        'ENTJ',
        'ENTP',
      });
      expect(analysts.every((type) => type.category == 'NT'), true);
    });

    test('getDiplomats가 4개의 Diplomats 타입을 반환하는지 확인', () {
      final diplomats = MBTIData.getDiplomats();

      expect(diplomats.length, 4);
      expect(diplomats.map((type) => type.code).toSet(), {
        'INFJ',
        'INFP',
        'ENFJ',
        'ENFP',
      });
      expect(diplomats.every((type) => type.category == 'NF'), true);
    });

    test('getSentinels가 4개의 Sentinels 타입을 반환하는지 확인', () {
      final sentinels = MBTIData.getSentinels();

      expect(sentinels.length, 4);
      expect(sentinels.map((type) => type.code).toSet(), {
        'ISTJ',
        'ISFJ',
        'ESTJ',
        'ESFJ',
      });
      expect(sentinels.every((type) => type.category == 'SJ'), true);
    });

    test('getExplorers가 4개의 Explorers 타입을 반환하는지 확인', () {
      final explorers = MBTIData.getExplorers();

      expect(explorers.length, 4);
      expect(explorers.map((type) => type.code).toSet(), {
        'ISTP',
        'ISFP',
        'ESTP',
        'ESFP',
      });
      expect(explorers.every((type) => type.category == 'SP'), true);
    });

    test('getQuestions가 20개의 질문을 반환하는지 확인', () {
      final questions = MBTIData.getQuestions();

      expect(questions.length, 20);
      expect(questions.every((q) => q is Question), true);
      expect(questions.every((q) => q.id > 0), true);
    });

    test('facade 패턴이 일관된 데이터를 반환하는지 확인', () {
      // getAllTypes와 개별 카테고리 메서드의 합집합이 일치하는지 확인
      final allTypes = MBTIData.getAllTypes().map((t) => t.code).toSet();
      final analysts = MBTIData.getAnalysts().map((t) => t.code).toSet();
      final diplomats = MBTIData.getDiplomats().map((t) => t.code).toSet();
      final sentinels = MBTIData.getSentinels().map((t) => t.code).toSet();
      final explorers = MBTIData.getExplorers().map((t) => t.code).toSet();

      final union = <String>{}
        ..addAll(analysts)
        ..addAll(diplomats)
        ..addAll(sentinels)
        ..addAll(explorers);

      expect(union, equals(allTypes));
    });

    test('getTypeByCode가 getAllTypes 결과와 일치하는지 확인', () {
      final allTypes = MBTIData.getAllTypes();

      for (final type in allTypes) {
        final retrievedType = MBTIData.getTypeByCode(type.code);
        expect(retrievedType, isNotNull);
        expect(retrievedType!.code, type.code);
        expect(retrievedType.name, type.name);
        expect(retrievedType.category, type.category);
        expect(retrievedType.description, type.description);
      }
    });

    test('모든 메서드가 동일한 객체 참조를 반환하는지 확인 (캐싱)', () {
      final types1 = MBTIData.getAllTypes();
      final types2 = MBTIData.getAllTypes();

      expect(types1.length, types2.length);

      for (int i = 0; i < types1.length; i++) {
        expect(types1[i].code, types2[i].code);
        expect(types1[i].name, types2[i].name);
        expect(types1[i].category, types2[i].category);
      }

      final questions1 = MBTIData.getQuestions();
      final questions2 = MBTIData.getQuestions();

      expect(questions1.length, questions2.length);

      for (int i = 0; i < questions1.length; i++) {
        expect(questions1[i].id, questions2[i].id);
        expect(questions1[i].text, questions2[i].text);
        expect(questions1[i].dimension, questions2[i].dimension);
      }
    });

    test('16가지 표준 MBTI 타입이 모두 올바르게 분류되어 있는지 확인', () {
      final allTypes = MBTIData.getAllTypes();
      final codeToCategory = <String, String>{};

      for (final type in allTypes) {
        codeToCategory[type.code] = type.category;
      }

      // Analysts (NT)
      expect(codeToCategory['INTJ'], 'NT');
      expect(codeToCategory['INTP'], 'NT');
      expect(codeToCategory['ENTJ'], 'NT');
      expect(codeToCategory['ENTP'], 'NT');

      // Diplomats (NF)
      expect(codeToCategory['INFJ'], 'NF');
      expect(codeToCategory['INFP'], 'NF');
      expect(codeToCategory['ENFJ'], 'NF');
      expect(codeToCategory['ENFP'], 'NF');

      // Sentinels (SJ)
      expect(codeToCategory['ISTJ'], 'SJ');
      expect(codeToCategory['ISFJ'], 'SJ');
      expect(codeToCategory['ESTJ'], 'SJ');
      expect(codeToCategory['ESFJ'], 'SJ');

      // Explorers (SP)
      expect(codeToCategory['ISTP'], 'SP');
      expect(codeToCategory['ISFP'], 'SP');
      expect(codeToCategory['ESTP'], 'SP');
      expect(codeToCategory['ESFP'], 'SP');
    });

    test('질문 데이터가 올바른 구조를 가지고 있는지 확인', () {
      final questions = MBTIData.getQuestions();

      // 4개 차원이 모두 포함되어 있는지 확인
      final dimensions = questions.map((q) => q.dimension).toSet();
      expect(dimensions.length, 4);
      expect(dimensions.contains(QuestionDimension.ei), true);
      expect(dimensions.contains(QuestionDimension.sn), true);
      expect(dimensions.contains(QuestionDimension.tf), true);
      expect(dimensions.contains(QuestionDimension.jp), true);

      // 모든 질문이 5점 리커트 척도를 가지고 있는지 확인
      for (final question in questions) {
        expect(question.options.length, 5);
        final scores = question.options.map((o) => o.score).toList();
        expect(scores, containsAll([-2.0, -1.0, 0.0, 1.0, 2.0]));
      }
    });

    test('에러 상황에서 안전한 처리가 되는지 확인', () {
      // null 입력
      expect(
        () => MBTIData.getTypeByCode(null as dynamic),
        throwsA(isA<TypeError>()),
      );

      // 빈 문자열
      expect(MBTIData.getTypeByCode(''), isNull);

      // 잘못된 형식
      expect(MBTIData.getTypeByCode('123'), isNull);
      expect(MBTIData.getTypeByCode('ABC'), isNull);
      expect(MBTIData.getTypeByCode('ABCDE'), isNull);
    });

    test('메서드 호출 성능이 일정한지 확인', () {
      final stopwatch = Stopwatch();

      // 첫 번째 호출
      stopwatch.start();
      MBTIData.getAllTypes();
      stopwatch.stop();
      final firstCallTime = stopwatch.elapsedMicroseconds;

      stopwatch.reset();

      // 두 번째 호출
      stopwatch.start();
      MBTIData.getAllTypes();
      stopwatch.stop();
      final secondCallTime = stopwatch.elapsedMicroseconds;

      // 두 번째 호출이 첫 번째보다 현저히 느리지 않아야 함
      expect(secondCallTime <= firstCallTime * 2, true);

      // 반복 호출 테스트
      for (int i = 0; i < 10; i++) {
        expect(() => MBTIData.getAllTypes(), returnsNormally);
        expect(() => MBTIData.getQuestions(), returnsNormally);
        expect(() => MBTIData.getTypeByCode('INTJ'), returnsNormally);
      }
    });
  });
}
