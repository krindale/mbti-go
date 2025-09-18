import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mbti_go/features/assessment/domain/entities/mbti_type.dart';

void main() {
  group('MBTIType 엔티티 테스트', () {
    test('MBTIType 객체가 올바르게 생성되는지 확인', () {
      const mbtiType = MBTIType(
        code: 'INTJ',
        name: '건축가',
        category: 'Analysts',
        description: '상상력이 풍부하고 전략적인 사고를 하는 완벽주의자',
        detailedDescription: '자세한 설명',
        strengths: ['전략적 사고', '독립성', '결단력'],
        weaknesses: ['감정 표현 부족', '완벽주의', '타인 의견 무시'],
        careers: ['과학자', '엔지니어', '건축가'],
        imagePath: 'assets/INTJ_Architect.jpg',
        primaryColor: Color(0xFF6366F1),
      );

      expect(mbtiType.code, 'INTJ');
      expect(mbtiType.name, '건축가');
      expect(mbtiType.category, 'Analysts');
      expect(mbtiType.description, '상상력이 풍부하고 전략적인 사고를 하는 완벽주의자');
      expect(mbtiType.strengths.length, 3);
      expect(mbtiType.weaknesses.length, 3);
      expect(mbtiType.careers.length, 3);
      expect(mbtiType.imagePath, 'assets/INTJ_Architect.jpg');
      expect(mbtiType.primaryColor, const Color(0xFF6366F1));
    });

    test('MBTIType의 List 속성들이 올바르게 작동하는지 확인', () {
      const mbtiType = MBTIType(
        code: 'ENFP',
        name: '활동가',
        category: 'Diplomats',
        description: '열정적이고 창의적인 사교적인 자유로운 영혼',
        detailedDescription: '열정적이고 창의적인 사교적인 자유로운 영혼의 자세한 설명',
        strengths: ['창의성', '공감능력', '열정'],
        weaknesses: ['집중력 부족', '스트레스 취약', '비현실적'],
        careers: ['상담사', '교사', '예술가'],
        imagePath: 'assets/ENFP_Campaigner.jpg',
        primaryColor: Color(0xFFE91E63),
      );

      // Strengths 테스트
      expect(mbtiType.strengths.contains('창의성'), true);
      expect(mbtiType.strengths.contains('공감능력'), true);
      expect(mbtiType.strengths.contains('열정'), true);

      // Weaknesses 테스트
      expect(mbtiType.weaknesses.contains('집중력 부족'), true);
      expect(mbtiType.weaknesses.contains('스트레스 취약'), true);
      expect(mbtiType.weaknesses.contains('비현실적'), true);

      // Cognitive Functions 테스트
      expect(mbtiType.cognitiveFunctions.isNotEmpty, true);
      expect(mbtiType.cognitiveFunctions.length, 4);

      // Careers 테스트
      expect(mbtiType.careers.contains('상담사'), true);
      expect(mbtiType.careers.contains('교사'), true);
      expect(mbtiType.careers.contains('예술가'), true);
    });

    test('빈 리스트로 MBTIType 생성 시 처리', () {
      const mbtiType = MBTIType(
        code: 'TEST',
        name: 'Test Type',
        category: 'Test Category',
        description: 'Test Description',
        detailedDescription: 'Test detailed description',
        strengths: [],
        weaknesses: [],
        careers: [],
        imagePath: 'test_image.jpg',
        primaryColor: Color(0xFF000000),
      );

      expect(mbtiType.strengths.isEmpty, true);
      expect(mbtiType.weaknesses.isEmpty, true);
      expect(mbtiType.careers.isEmpty, true);
      expect(mbtiType.detailedDescription.isNotEmpty, true);
    });

    test('MBTIType 동등성 비교', () {
      const mbtiType1 = MBTIType(
        code: 'INTJ',
        name: '건축가',
        category: 'Analysts',
        description: '상상력이 풍부하고 전략적인 사고를 하는 완벽주의자',
        detailedDescription: '자세한 설명',
        strengths: ['전략적 사고', '독립성', '결단력'],
        weaknesses: ['감정 표현 부족', '완벽주의', '타인 의견 무시'],
        careers: ['과학자', '엔지니어', '건축가'],
        imagePath: 'assets/INTJ_Architect.jpg',
        primaryColor: Color(0xFF6366F1),
      );

      final mbtiType2 = MBTIType(
        code: 'INTJ',
        name: '건축가',
        category: 'Analysts',
        description: '상상력이 풍부하고 전략적인 사고를 하는 완벽주의자',
        detailedDescription: '자세한 설명',
        strengths: ['전략적 사고', '독립성', '결단력'],
        weaknesses: ['감정 표현 부족', '완벽주의', '타인 의견 무시'],
        careers: ['과학자', '엔지니어', '건축가'],
        imagePath: 'assets/INTJ_Architect.jpg',
        primaryColor: const Color(0xFF6366F1),
      );

      const mbtiType3 = MBTIType(
        code: 'ENFP',
        name: '활동가',
        category: 'Diplomats',
        description: '열정적이고 창의적인 사교적인 자유로운 영혼',
        detailedDescription: '활동가 유형의 자세한 설명',
        strengths: ['창의성', '공감능력', '열정'],
        weaknesses: ['집중력 부족', '스트레스 취약', '비현실적'],
        careers: ['상담사', '교사', '예술가'],
        imagePath: 'assets/ENFP_Campaigner.jpg',
        primaryColor: Color(0xFFE91E63),
      );

      // Equatable을 사용하여 속성 기반 동등성 비교
      expect(mbtiType1 == mbtiType2, true);
      expect(mbtiType1 == mbtiType3, false);

      // 동일한 참조인지 확인
      expect(identical(mbtiType1, mbtiType1), true);
      expect(identical(mbtiType1, mbtiType2), false);
    });

    test('MBTIType 속성 변경 불가능성 확인 (immutable)', () {
      const mbtiType = MBTIType(
        code: 'INTJ',
        name: '건축가',
        category: 'Analysts',
        description: '상상력이 풍부하고 전략적인 사고를 하는 완벽주의자',
        detailedDescription: '자세한 설명',
        strengths: ['전략적 사고', '독립성', '결단력'],
        weaknesses: ['감정 표현 부족', '완벽주의', '타인 의견 무시'],
        careers: ['과학자', '엔지니어', '건축가'],
        imagePath: 'assets/INTJ_Architect.jpg',
        primaryColor: Color(0xFF6366F1),
      );

      // final 필드이므로 컴파일 타임에 변경 불가능
      // mbtiType.code = 'ENFP'; // 이 코드는 컴파일 에러 발생

      // 리스트의 불변성 확인
      expect(() => mbtiType.strengths.add('새로운 강점'), throwsUnsupportedError);
      expect(() => mbtiType.weaknesses.clear(), throwsUnsupportedError);
      expect(() => mbtiType.careers[0] = '새로운 직업', throwsUnsupportedError);
    });

    test('MBTIType toString 메서드 테스트', () {
      const mbtiType = MBTIType(
        code: 'INTJ',
        name: '건축가',
        category: 'Analysts',
        description: '상상력이 풍부하고 전략적인 사고를 하는 완벽주의자',
        detailedDescription: '자세한 설명',
        strengths: ['전략적 사고'],
        weaknesses: ['완벽주의'],
        careers: ['과학자'],
        imagePath: 'assets/INTJ_Architect.jpg',
        primaryColor: Color(0xFF6366F1),
      );

      final stringRepresentation = mbtiType.toString();
      expect(stringRepresentation, contains('INTJ'));
      expect(stringRepresentation, contains('건축가'));
    });

    test('MBTIType helper methods 테스트', () {
      const intjType = MBTIType(
        code: 'INTJ',
        name: '건축가',
        category: 'Analysts',
        description: '상상력이 풍부하고 전략적인 사고를 하는 완벽주의자',
        detailedDescription: '자세한 설명',
        strengths: ['전략적 사고'],
        weaknesses: ['완벽주의'],
        careers: ['과학자'],
        imagePath: 'assets/INTJ_Architect.jpg',
        primaryColor: Color(0xFF6366F1),
      );

      const enfpType = MBTIType(
        code: 'ENFP',
        name: '활동가',
        category: 'Diplomats',
        description: '열정적이고 창의적인 사교적인 자유로운 영혼',
        detailedDescription: '자세한 설명',
        strengths: ['창의성'],
        weaknesses: ['집중력 부족'],
        careers: ['상담사'],
        imagePath: 'assets/ENFP_Campaigner.jpg',
        primaryColor: Color(0xFFE91E63),
      );

      // Introversion/Extraversion 테스트
      expect(intjType.isIntroverted, true);
      expect(intjType.isExtraverted, false);
      expect(enfpType.isIntroverted, false);
      expect(enfpType.isExtraverted, true);

      // Cognitive Functions 테스트
      expect(intjType.cognitiveFunctions.length, 4);
      expect(intjType.cognitiveFunctions, contains('Ni'));
      expect(intjType.cognitiveFunctions, contains('Te'));

      expect(enfpType.cognitiveFunctions.length, 4);
      expect(enfpType.cognitiveFunctions, contains('Ne'));
      expect(enfpType.cognitiveFunctions, contains('Fi'));
    });

    test('모든 16개 MBTI 타입의 cognitiveFunctions 테스트', () {
      final allTypes = [
        'INTJ', 'INTP', 'ENTJ', 'ENTP',
        'INFJ', 'INFP', 'ENFJ', 'ENFP',
        'ISTJ', 'ISFJ', 'ESTJ', 'ESFJ',
        'ISTP', 'ISFP', 'ESTP', 'ESFP'
      ];

      for (final typeCode in allTypes) {
        final mbtiType = MBTIType(
          code: typeCode,
          name: '테스트',
          category: 'Test',
          description: '테스트 설명',
          detailedDescription: '자세한 설명',
          strengths: ['테스트'],
          weaknesses: ['테스트'],
          careers: ['테스트'],
          imagePath: 'assets/test.jpg',
          primaryColor: const Color(0xFF000000),
        );

        expect(mbtiType.cognitiveFunctions.length, 4,
               reason: '$typeCode should have 4 cognitive functions');
        expect(mbtiType.cognitiveFunctions.every((f) => f.isNotEmpty), true,
               reason: '$typeCode cognitive functions should not be empty');
      }
    });
  });
}