import '../models/mbti_type_model.dart';

/// MBTI 홈페이지 전용 데이터 소스
/// Single Responsibility: 홈페이지에서 사용하는 MBTI 타입 데이터 제공
class MBTIHomeData {
  static final List<MBTITypeModel> _mbtiTypes = [
    const MBTITypeModel(
      type: 'ENFJ',
      name: '멘토',
      image: 'assets/ENFJ_Protagonist.jpg',
      category: 'NF',
      description: '카리스마 리더',
      detailedDescription:
          '멘토는 타인의 성장과 발전을 돕는 천성적인 지도자입니다. 따뜻한 마음과 강력한 소통 능력으로 사람들을 이끌어갑니다.',
    ),
    const MBTITypeModel(
      type: 'ENFP',
      name: '활동가',
      image: 'assets/ENFP_Campaigner.jpg',
      category: 'NF',
      description: '열정적 자유 영혼',
      detailedDescription:
          '활동가는 무한한 창의력과 열정으로 새로운 가능성을 찾아내는 사람입니다. 자유롭고 긍정적인 에너지로 사람들을 고무시킵니다.',
    ),
    const MBTITypeModel(
      type: 'ENTJ',
      name: '지휘관',
      image: 'assets/ENTJ_Commander.jpg',
      category: 'NT',
      description: '강력한 의지의 지도자',
      detailedDescription:
          '지휘관은 대담하고 전략적인 사고로 목표를 달성하는 것을 즐기는 타고난 리더입니다. 초자연적인 리더십과 설득력을 가졌습니다.',
    ),
    const MBTITypeModel(
      type: 'ENTP',
      name: '혁신가',
      image: 'assets/ENTP_Debater.jpg',
      category: 'NT',
      description: '호기심 많은 사상가',
      detailedDescription:
          '혁신가는 지적 호기심이 뛰어나고 새로운 아이디어를 탐구하는 것을 좋아합니다. 반대 의견을 두려워하지 않는 열정적인 혁신가입니다.',
    ),
    const MBTITypeModel(
      type: 'ESFJ',
      name: '협력자',
      image: 'assets/ESFJ_Consul.jpg',
      category: 'SJ',
      description: '사교적 인기쟁이',
      detailedDescription:
          '협력자은 다른 사람들의 필요를 민감하게 알아채고 도움을 주는 것을 좋아합니다. 따뜻하고 배려심 많은 성격으로 인기가 많습니다.',
    ),
    const MBTITypeModel(
      type: 'ESFP',
      name: '연예인',
      image: 'assets/ESFP_Entertainer.jpg',
      category: 'SP',
      description: '열정적 예술가',
      detailedDescription:
          '연예인은 즉흥적이고 열정적인 성격으로 주변 사람들에게 에너지를 전달합니다. 새로운 경험을 좋아하고 생동감 넘치는 사람입니다.',
    ),
    const MBTITypeModel(
      type: 'ESTJ',
      name: '경영자',
      image: 'assets/ESTJ_Executive.jpg',
      category: 'SJ',
      description: '뛰어난 관리자',
      detailedDescription:
          '경영자는 전통과 질서를 중요시하며 조직을 효율적으로 운영하는 데 능숙합니다. 체계적이고 책임감 있는 리더십을 발휘합니다.',
    ),
    const MBTITypeModel(
      type: 'ESTP',
      name: '도전가',
      image: 'assets/ESTP_Entrepreneur.jpg',
      category: 'SP',
      description: '에너지 넘치는 도전가',
      detailedDescription:
          '도전가는 현실적이고 에너지가 넘치며 위기 상황에서도 침착하게 대처하는 날카로운 문제 해결사입니다.',
    ),
    const MBTITypeModel(
      type: 'INFJ',
      name: '옹호자',
      image: 'assets/INFJ_Advocate.jpg',
      category: 'NF',
      description: '신비로운 이상주의자',
      detailedDescription:
          '옹호자는 내성적이지만 강한 단호력과 창의력으로 세상을 바꿀 수 있다고 믿는 신념의 소유자입니다.',
    ),
    const MBTITypeModel(
      type: 'INFP',
      name: '몽상가',
      image: 'assets/INFP_Mediator.jpg',
      category: 'NF',
      description: '친절한 이상주의자',
      detailedDescription:
          '몽상가는 자신의 가치관과 신념에 따라 살아가는 진정성 있는 사람입니다. 다른 사람들의 열정을 불러일으키는 영감의 원천입니다.',
    ),
    const MBTITypeModel(
      type: 'INTJ',
      name: '전략가',
      image: 'assets/INTJ_Architect.jpg',
      category: 'NT',
      description: '전략적 사고의 전략가',
      detailedDescription: '전략가는 독립적이고 전략적인 사고를 통해 자신만의 비전을 만들어가는 혁신적인 창조자입니다.',
    ),
    const MBTITypeModel(
      type: 'INTP',
      name: '탐구가',
      image: 'assets/INTP_Thinker.jpg',
      category: 'NT',
      description: '혁신적인 발명가',
      detailedDescription:
          '탐구가는 지식에 대한 갈증이 뛰어나고 발명이나 혁신을 통해 세상을 이해하려 하는 이론적 사색가입니다.',
    ),
    const MBTITypeModel(
      type: 'ISFJ',
      name: '수호자',
      image: 'assets/ISFJ_Protector.jpg',
      category: 'SJ',
      description: '따뜻한 수호자',
      detailedDescription:
          '수호자는 따뜻하고 이타적인 성격으로 다른 사람들을 돌보고 보호하는 데 천부적인 재능을 가진 사람입니다.',
    ),
    const MBTITypeModel(
      type: 'ISFP',
      name: '모험가',
      image: 'assets/ISFP_Adventurer.jpg',
      category: 'SP',
      description: '매력적인 예술가',
      detailedDescription:
          '모험가는 유연하고 매력적인 성격으로 자신의 가치관과 신념에 따라 살아가는 예술가적 기질의 소유자입니다.',
    ),
    const MBTITypeModel(
      type: 'ISTJ',
      name: '현실주의자',
      image: 'assets/ISTJ_Logistician.jpg',
      category: 'SJ',
      description: '신뢰할 수 있는 현실주의자',
      detailedDescription:
          '현실주의자는 실용적이고 사실에 근거한 신뢰할 수 있는 성격으로 체계적이고 책임감 있는 사람입니다.',
    ),
    const MBTITypeModel(
      type: 'ISTP',
      name: '해결사',
      image: 'assets/ISTP_Virtuoso.jpg',
      category: 'SP',
      description: '실용적 해결사',
      detailedDescription:
          '해결사은 대담하고 실용적인 실험정신으로 손으로 무언가를 만들고 탐구하는 것을 좋아하는 장인정신의 소유자입니다.',
    ),
  ];

  /// 모든 MBTI 타입 데이터 반환
  static List<MBTITypeModel> getAllTypes() => List.unmodifiable(_mbtiTypes);

  /// 특정 타입 코드로 MBTI 타입 검색
  static MBTITypeModel? getTypeByCode(String typeCode) {
    try {
      return _mbtiTypes.firstWhere((type) => type.type == typeCode);
    } catch (e) {
      return null;
    }
  }

  /// 카테고리별 MBTI 타입 검색
  static List<MBTITypeModel> getTypesByCategory(String category) {
    return _mbtiTypes.where((type) => type.category == category).toList();
  }
}
