import 'package:flutter_test/flutter_test.dart';
import 'package:mbti_go/features/assessment/domain/entities/mbti_type.dart';

void main() {
  group('MBTIType 엔티티 테스트', () {
    test('MBTIType 객체가 올바르게 생성되는지 확인', () {
      const mbtiType = MBTIType(
        code: 'INTJ',
        name: '건축가',
        category: 'NT',
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
      expect(mbtiType.category, 'NT');
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
        strengths: ['창의성', '공감능력', '열정'],
        weaknesses: ['집중력 부족', '스트레스 취약', '비현실적'],
        compatibility: ['INTJ', 'INFJ'],
        careers: ['상담사', '교사', '예술가'],
        image: 'assets/ENFP_Campaigner.jpg',
      );

      // Strengths 테스트
      expect(mbtiType.strengths.contains('창의성'), true);
      expect(mbtiType.strengths.contains('공감능력'), true);
      expect(mbtiType.strengths.contains('열정'), true);

      // Weaknesses 테스트
      expect(mbtiType.weaknesses.contains('집중력 부족'), true);
      expect(mbtiType.weaknesses.contains('스트레스 취약'), true);
      expect(mbtiType.weaknesses.contains('비현실적'), true);

      // Compatibility 테스트
      expect(mbtiType.compatibility.contains('INTJ'), true);
      expect(mbtiType.compatibility.contains('INFJ'), true);

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
        strengths: [],
        weaknesses: [],
        compatibility: [],
        careers: [],
        image: 'test_image.jpg',
      );

      expect(mbtiType.strengths.isEmpty, true);
      expect(mbtiType.weaknesses.isEmpty, true);
      expect(mbtiType.compatibility.isEmpty, true);
      expect(mbtiType.careers.isEmpty, true);
    });

    test('MBTIType 동등성 비교', () {
      const mbtiType1 = MBTIType(
        code: 'INTJ',
        name: '건축가',
        category: 'Analysts',
        description: '상상력이 풍부하고 전략적인 사고를 하는 완벽주의자',
        strengths: ['전략적 사고', '독립성', '결단력'],
        weaknesses: ['감정 표현 부족', '완벽주의', '타인 의견 무시'],
        compatibility: ['ENFP', 'ENTP', 'INFJ'],
        careers: ['과학자', '엔지니어', '건축가'],
        image: 'assets/INTJ_Architect.jpg',
      );

      const mbtiType2 = MBTIType(
        code: 'INTJ',
        name: '건축가',
        category: 'Analysts',
        description: '상상력이 풍부하고 전략적인 사고를 하는 완벽주의자',
        strengths: ['전략적 사고', '독립성', '결단력'],
        weaknesses: ['감정 표현 부족', '완벽주의', '타인 의견 무시'],
        compatibility: ['ENFP', 'ENTP', 'INFJ'],
        careers: ['과학자', '엔지니어', '건축가'],
        image: 'assets/INTJ_Architect.jpg',
      );

      const mbtiType3 = MBTIType(
        code: 'ENFP',
        name: '활동가',
        category: 'Diplomats',
        description: '열정적이고 창의적인 사교적인 자유로운 영혼',
        strengths: ['창의성', '공감능력', '열정'],
        weaknesses: ['집중력 부족', '스트레스 취약', '비현실적'],
        compatibility: ['INTJ', 'INFJ'],
        careers: ['상담사', '교사', '예술가'],
        image: 'assets/ENFP_Campaigner.jpg',
      );

      // Dart의 기본 동등성 비교 (== 연산자)
      expect(mbtiType1 == mbtiType2, false); // 기본적으로 다른 인스턴스는 다름
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
        strengths: ['전략적 사고', '독립성', '결단력'],
        weaknesses: ['감정 표현 부족', '완벽주의', '타인 의견 무시'],
        compatibility: ['ENFP', 'ENTP', 'INFJ'],
        careers: ['과학자', '엔지니어', '건축가'],
        image: 'assets/INTJ_Architect.jpg',
      );

      // final 필드이므로 컴파일 타임에 변경 불가능
      // mbtiType.code = 'ENFP'; // 이 코드는 컴파일 에러 발생

      // 리스트의 불변성 확인
      expect(() => mbtiType.strengths.add('새로운 강점'), throwsUnsupportedError);
      expect(() => mbtiType.weaknesses.clear(), throwsUnsupportedError);
      expect(() => mbtiType.compatibility.remove('ENFP'), throwsUnsupportedError);
      expect(() => mbtiType.careers[0] = '새로운 직업', throwsUnsupportedError);
    });

    test('MBTIType toString 메서드 테스트', () {
      const mbtiType = MBTIType(
        code: 'INTJ',
        name: '건축가',
        category: 'Analysts',
        description: '상상력이 풍부하고 전략적인 사고를 하는 완벽주의자',
        strengths: ['전략적 사고'],
        weaknesses: ['완벽주의'],
        compatibility: ['ENFP'],
        careers: ['과학자'],
        image: 'assets/INTJ_Architect.jpg',
      );

      final stringRepresentation = mbtiType.toString();
      expect(stringRepresentation, contains('INTJ'));
      expect(stringRepresentation, contains('건축가'));
    });
  });
}