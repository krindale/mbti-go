import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:mbti_go/features/assessment/data/datasources/mbti_types_repository.dart';
import 'package:mbti_go/features/assessment/data/services/mbti_localization_service.dart';
import 'package:mbti_go/l10n/app_localizations.dart';

void main() {
  group('MBTITypesRepository 테스트', () {
    late MBTITypesRepository repository;

    setUpAll(() async {
      TestWidgetsFlutterBinding.ensureInitialized();
    });

    setUp(() async {
      // 테스트용 간단한 localization 설정을 위해 AppLocalizations 직접 사용
      final localizationService = MBTILocalizationService(
        await AppLocalizations.delegate.load(const Locale('ko'))
      );
      repository = MBTITypesRepository(localizationService);
    });

    test('getAllTypes가 16개의 MBTI 타입을 모두 반환하는지 확인', () {
      final types = repository.getAllTypes();

      expect(types.length, 16);
      expect(types.every((type) => type.code.length == 4), true);
    });

    test('16가지 MBTI 타입 코드가 모두 포함되어 있는지 확인', () {
      final types = repository.getAllTypes();
      final codes = types.map((type) => type.code).toSet();

      // Analysts (NT)
      expect(codes.contains('INTJ'), true);
      expect(codes.contains('INTP'), true);
      expect(codes.contains('ENTJ'), true);
      expect(codes.contains('ENTP'), true);

      // Diplomats (NF)
      expect(codes.contains('INFJ'), true);
      expect(codes.contains('INFP'), true);
      expect(codes.contains('ENFJ'), true);
      expect(codes.contains('ENFP'), true);

      // Sentinels (SJ)
      expect(codes.contains('ISTJ'), true);
      expect(codes.contains('ISFJ'), true);
      expect(codes.contains('ESTJ'), true);
      expect(codes.contains('ESFJ'), true);

      // Explorers (SP)
      expect(codes.contains('ISTP'), true);
      expect(codes.contains('ISFP'), true);
      expect(codes.contains('ESTP'), true);
      expect(codes.contains('ESFP'), true);

      // 정확히 16개인지 재확인
      expect(codes.length, 16);
    });

    test('getAnalysts가 4개의 Analysts 타입을 반환하는지 확인', () {
      final analysts = repository.getAnalysts();

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
      final diplomats = repository.getDiplomats();

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
      final sentinels = repository.getSentinels();

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
      final explorers = repository.getExplorers();

      expect(explorers.length, 4);
      expect(explorers.map((type) => type.code).toSet(), {
        'ISTP',
        'ISFP',
        'ESTP',
        'ESFP',
      });
      expect(explorers.every((type) => type.category == 'SP'), true);
    });

    test('각 MBTI 타입이 올바른 구조를 가지고 있는지 확인', () {
      final types = repository.getAllTypes();

      for (final type in types) {
        // 기본 정보 확인
        expect(type.code.isNotEmpty, true);
        expect(type.name.isNotEmpty, true);
        expect(type.category.isNotEmpty, true);
        expect(type.description.isNotEmpty, true);
        expect(type.imagePath.isNotEmpty, true);

        // 이미지 경로 형식 확인
        expect(type.imagePath.startsWith('assets/'), true);
        expect(type.imagePath.endsWith('.jpg'), true);
      }
    });

    test('MBTI 타입별 인지 기능이 올바르게 설정되어 있는지 확인', () {
      final types = repository.getAllTypes();

      for (final type in types) {
        // 모든 타입은 4개의 인지 기능을 가져야 함
        expect(
          type.cognitiveFunctions.length,
          4,
          reason: '${type.code}는 4개의 인지 기능을 가져야 합니다.',
        );

        // 인지 기능들이 비어있지 않은지 확인
        for (final function in type.cognitiveFunctions) {
          expect(function.isNotEmpty, true);
        }
      }
    });

    test('동일한 타입을 여러 번 호출해도 같은 결과를 반환하는지 확인', () {
      final types1 = repository.getAllTypes();
      final types2 = repository.getAllTypes();

      expect(types1.length, types2.length);

      for (int i = 0; i < types1.length; i++) {
        expect(types1[i].code, types2[i].code);
        expect(types1[i].name, types2[i].name);
        expect(types1[i].category, types2[i].category);
      }
    });

    test('각 카테고리별 타입들의 합집합이 전체 타입과 일치하는지 확인', () {
      final allTypes = repository.getAllTypes()
          .map((t) => t.code)
          .toSet();
      final analysts = repository.getAnalysts()
          .map((t) => t.code)
          .toSet();
      final diplomats = repository.getDiplomats()
          .map((t) => t.code)
          .toSet();
      final sentinels = repository.getSentinels()
          .map((t) => t.code)
          .toSet();
      final explorers = repository.getExplorers()
          .map((t) => t.code)
          .toSet();

      final union = <String>{}
        ..addAll(analysts)
        ..addAll(diplomats)
        ..addAll(sentinels)
        ..addAll(explorers);

      expect(union, equals(allTypes));

      // 각 카테고리가 겹치지 않는지 확인
      expect(analysts.intersection(diplomats).isEmpty, true);
      expect(analysts.intersection(sentinels).isEmpty, true);
      expect(analysts.intersection(explorers).isEmpty, true);
      expect(diplomats.intersection(sentinels).isEmpty, true);
      expect(diplomats.intersection(explorers).isEmpty, true);
      expect(sentinels.intersection(explorers).isEmpty, true);
    });

    test('특정 MBTI 타입 상세 정보 확인 (INTJ)', () {
      final types = repository.getAllTypes();
      final intj = types.firstWhere((type) => type.code == 'INTJ');

      expect(intj.name, '전략가');
      expect(intj.category, 'NT');
      expect(intj.description.contains('전략적'), true);
      expect(intj.imagePath, 'assets/INTJ_Architect.jpg');
    });

    test('특정 MBTI 타입 상세 정보 확인 (ENFP)', () {
      final types = repository.getAllTypes();
      final enfp = types.firstWhere((type) => type.code == 'ENFP');

      expect(enfp.name, '활동가');
      expect(enfp.category, 'NF');
      expect(enfp.description.contains('열정적'), true);
      expect(enfp.imagePath, 'assets/ENFP_Campaigner.jpg');
    });

    test('모든 MBTI 타입의 이미지 경로가 일관된 형식인지 확인', () {
      final types = repository.getAllTypes();

      for (final type in types) {
        expect(type.imagePath, startsWith('assets/'));
        expect(type.imagePath, contains(type.code));
        expect(type.imagePath, endsWith('.jpg'));

        // 파일명이 "MBTI코드_영어이름.jpg" 형식인지 확인
        final expectedPattern = RegExp(r'^assets/[A-Z]{4}_[A-Za-z]+\.jpg$');
        expect(
          expectedPattern.hasMatch(type.imagePath),
          true,
          reason: '${type.code}의 이미지 경로 형식이 올바르지 않습니다: ${type.imagePath}',
        );
      }
    });
  });
}