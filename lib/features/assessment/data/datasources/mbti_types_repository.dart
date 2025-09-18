import '../../domain/entities/mbti_type.dart';
import '../../../../core/theme/app_colors.dart';

/// MBTI 타입 데이터를 관리하는 저장소
/// Single Responsibility: 16가지 MBTI 타입의 정보만 관리
class MBTITypesRepository {
  static List<MBTIType> getAllTypes() {
    return [
      // Analysts (NT)
      MBTIType(
        code: 'INTJ',
        name: '건축가',
        category: 'NT',
        description: '상상력이 풍부하고 전략적인 사상가로, 모든 일에 계획을 세웁니다.',
        strengths: ['전략적 사고', '독립성', '결단력', '집중력', '창의성'],
        weaknesses: ['지나친 비판', '사회성 부족', '감정 표현 어려움', '완벽주의'],
        careers: ['과학자', '엔지니어', '건축가', '연구원', '전략 기획자'],
        imagePath: 'assets/INTJ_Architect.jpg',
        primaryColor: AppColors.getMBTITypeColor('INTJ'),
        detailedDescription:
            '''당신은 진정한 '건축가'입니다. 마치 거대한 도서관의 사서처럼, 당신의 마음속에는 수많은 지식과 아이디어들이 체계적으로 정리되어 있습니다. 당신의 전략적 사고와 장기적 비전은 복잡한 문제들을 혁신적인 해결책으로 바꿔내는 마법과 같습니다. 때로는 외로운 길을 걸어도, 당신만의 완벽한 설계도를 그리며 미래를 건설해나가는 진정한 마스터플랜의 창조자입니다.''',
      ),
      MBTIType(
        code: 'INTP',
        name: '논리술사',
        category: 'NT',
        description: '혁신적인 발명가로, 지식에 대한 끝없는 갈증을 가지고 있습니다.',
        strengths: ['논리적 사고', '창의성', '객관성', '적응력', '분석력'],
        weaknesses: ['우유부단', '집중력 부족', '감정 무시', '현실성 부족'],
        careers: ['연구원', '프로그래머', '철학자', '분석가', '발명가'],
        imagePath: 'assets/INTP_Thinker.jpg',
        primaryColor: AppColors.getMBTITypeColor('INTP'),
        detailedDescription:
            '''당신은 진정한 '논리술사'입니다. 마치 중세의 연금술사처럼, 복잡한 정보들을 순수한 논리와 통찰로 변환시키는 마법 같은 능력을 가지고 있습니다. 끝없는 호기심과 "만약에..."라는 가능성 사고로 새로운 세상을 탐험하는 지식의 개척자입니다. 당신의 실험실에서는 아이디어들이 서로 충돌하고 융합하며, 세상이 미처 발견하지 못한 새로운 진리를 탄생시킵니다.''',
      ),
      MBTIType(
        code: 'ENTJ',
        name: '통솔자',
        category: 'NT',
        description: '대담하고 상상력이 풍부한 강력한 의지의 리더입니다.',
        strengths: ['리더십', '결단력', '효율성', '전략적 계획', '자신감'],
        weaknesses: ['지나친 비판', '인내심 부족', '감정 무시', '고집'],
        careers: ['CEO', '관리자', '기업가', '변호사', '정치인'],
        imagePath: 'assets/ENTJ_Commander.jpg',
        primaryColor: AppColors.getMBTITypeColor('ENTJ'),
        detailedDescription:
            '''당신은 타고난 '통솔자'입니다. 마치 체스의 퀸처럼, 전략적이면서도 공격적으로 목표를 향해 나아가는 당신의 모습은 주변 사람들에게 강한 인상을 남깁니다. 당신의 눈에는 항상 더 큰 그림이 보이고, 그 비전을 현실로 만들어내는 실행력이 당신을 진정한 리더로 만듭니다. 어떤 장애물이 와도 굴복하지 않는 강인한 의지와 카리스마로, 불가능해 보이는 일들을 가능하게 만드는 기적의 지휘관입니다.''',
      ),
      MBTIType(
        code: 'ENTP',
        name: '변론가',
        category: 'NT',
        description: '영리하고 호기심이 많은 사상가로, 지적 도전을 거부할 수 없습니다.',
        strengths: ['창의성', '열정', '카리스마', '에너지', '지적 호기심'],
        weaknesses: ['집중력 부족', '조직력 부족', '스트레스에 민감', '루틴 싫어함'],
        careers: ['발명가', '기자', '심리학자', '사진가', '컨설턴트'],
        imagePath: 'assets/ENTP_Debater.jpg',
        primaryColor: AppColors.getMBTITypeColor('ENTP'),
        detailedDescription:
            '''당신은 창의적인 '변론가'입니다. 마치 지적 호기심으로 가득 찬 탐험가처럼, 새로운 아이디어의 세계를 끊임없이 탐험합니다. 당신의 머릿속에서는 언제나 혁신적인 연결고리들이 만들어지고, 그 독창적 사고가 세상에 새로운 가능성을 제시합니다. 논쟁을 두려워하지 않고 진실을 추구하는 당신은, 기존의 틀을 깨뜨리고 새로운 패러다임을 제시하는 혁신의 선구자입니다.''',
      ),

      // Diplomats (NF)
      MBTIType(
        code: 'INFJ',
        name: '옹호자',
        category: 'NF',
        description: '선의의 옹호자로, 조용하지만 매우 영감을 주는 이상주의자입니다.',
        strengths: ['직관력', '결단력', '이타심', '창의성', '통찰력'],
        weaknesses: ['완벽주의', '지나친 사생활 보호', '민감함', '번아웃'],
        careers: ['상담사', '작가', '사회복지사', '심리학자', '교육자'],
        imagePath: 'assets/INFJ_Advocate.jpg',
        primaryColor: AppColors.getMBTITypeColor('INFJ'),
        detailedDescription:
            '''당신은 신비로운 '옹호자'입니다. 마치 고요한 호수처럼 평온해 보이지만, 그 속에는 깊은 감정과 강한 신념이 흘러갑니다. 당신의 직관력은 다른 사람들이 보지 못하는 진실을 꿰뚫어 보며, 조용하지만 확고한 의지로 세상에 긍정적 변화를 만들어냅니다. 완벽주의적 성향으로 높은 기준을 추구하지만, 그 열정은 오직 더 나은 세상을 향한 순수한 마음에서 나옵니다.''',
      ),
      MBTIType(
        code: 'INFP',
        name: '중재자',
        category: 'NF',
        description: '시적이고 친절하며 이타적인 사람으로, 언제나 선의와 화합을 추구합니다.',
        strengths: ['이상주의', '충성심', '적응력', '호기심', '가능성 탐구'],
        weaknesses: ['지나친 이상주의', '자기 비판적', '실용성 부족', '스트레스 취약'],
        careers: ['작가', '예술가', '상담사', '심리학자', '사회복지사'],
        imagePath: 'assets/INFP_Mediator.jpg',
        primaryColor: AppColors.getMBTITypeColor('INFP'),
        detailedDescription:
            '''당신은 따뜻한 '중재자'입니다. 마치 아름다운 정원을 가꾸는 원예가처럼, 당신은 자신만의 가치관이라는 씨앗을 정성스럽게 키워갑니다. 다른 사람들이 보지 못하는 아름다움을 발견하고, 그 순수한 마음으로 세상에 따뜻함과 진정성을 전파하는 당신은 진정한 예술가입니다. 갈등 상황에서도 모든 사람의 마음을 이해하려 노력하며, 조화와 평화를 만들어가는 진정한 중재의 달인입니다.''',
      ),
      MBTIType(
        code: 'ENFJ',
        name: '선도자',
        category: 'NF',
        description: '카리스마 있고 영감을 주는 리더로, 청중을 매혹시키는 능력이 있습니다.',
        strengths: ['리더십', '이타심', '카리스마', '신뢰성', '관용'],
        weaknesses: ['지나친 이상주의', '자기 비판적', '결정 어려움', '타인 의존'],
        careers: ['교육자', '상담사', '외교관', '정치인', '종교인'],
        imagePath: 'assets/ENFJ_Protagonist.jpg',
        primaryColor: AppColors.getMBTITypeColor('ENFJ'),
        detailedDescription:
            '''당신은 카리스마 넘치는 '선도자'입니다. 마치 따뜻한 햇살처럼 주변 사람들을 비추며, 그들 안에 숨어있는 잠재력을 깨우는 마법 같은 능력을 가지고 있습니다. 당신의 진심 어린 관심과 격려는 다른 사람들로 하여금 자신도 몰랐던 가능성을 발견하게 만드는 선물입니다. 때로는 다른 사람을 위해 자신을 희생하기도 하지만, 그 이타적 마음이야말로 진정한 리더십의 본질입니다.''',
      ),
      MBTIType(
        code: 'ENFP',
        name: '활동가',
        category: 'NF',
        description: '열정적이고 창의적인 사교적인 자유로운 영혼으로, 언제나 웃을 이유를 찾을 수 있습니다.',
        strengths: ['열정', '창의성', '사회성', '자유로운 사고', '긍정적'],
        weaknesses: ['집중력 부족', '조직력 부족', '스트레스 관리 어려움', '실무 약함'],
        careers: ['기자', '상담사', '배우', '음악가', '마케터'],
        imagePath: 'assets/ENFP_Campaigner.jpg',
        primaryColor: AppColors.getMBTITypeColor('ENFP'),
        detailedDescription:
            '''당신은 진정한 '활동가'입니다. 마치 춤추는 불꽃처럼, 당신의 존재 자체가 주변을 밝히고 따뜻하게 만듭니다. 무한한 창의성과 열정으로 세상을 가능성의 놀이터로 바라보며, 다른 사람들에게 "인생은 아름답고 희망으로 가득하다"는 메시지를 전하는 살아있는 증거입니다. 때로는 너무 많은 관심사로 집중하기 어려워도, 그 다양성이야말로 당신만의 독특한 매력이자 강점입니다.''',
      ),

      // Sentinels (SJ)
      MBTIType(
        code: 'ISTJ',
        name: '현실주의자',
        category: 'SJ',
        description: '실용적이고 사실에 기반한 신뢰할 수 있는 사람입니다.',
        strengths: ['책임감', '신뢰성', '실용성', '근면성', '집중력'],
        weaknesses: ['융통성 부족', '감정 표현 어려움', '변화 거부', '지나친 신중'],
        careers: ['회계사', '의사', '치과의사', '법무관', '관리자'],
        imagePath: 'assets/ISTJ_Logistician.jpg',
        primaryColor: AppColors.getMBTITypeColor('ISTJ'),
        detailedDescription:
            '''당신은 신뢰할 수 있는 '현실주의자'입니다. 마치 든든한 등대처럼, 어떤 폭풍이 와도 흔들리지 않는 당신의 모습은 주변 사람들에게 안정감을 줍니다. 당신의 꾸준함과 책임감은 단순한 의무감이 아닌, 사랑하는 사람들을 지키고 싶은 마음에서 우러나오는 진정한 헌신입니다. 전통과 질서를 중시하는 당신은 사회의 기반이 되는 소중한 존재이며, 믿음직한 약속의 수호자입니다.''',
      ),
      MBTIType(
        code: 'ISFJ',
        name: '수호자',
        category: 'SJ',
        description: '매우 헌신적이고 따뜻한 수호자로, 언제나 사랑하는 사람들을 방어할 준비가 되어 있습니다.',
        strengths: ['지지적', '신뢰성', '인내심', '실용성', '열심'],
        weaknesses: ['자기주장 부족', '변화 거부', '지나친 겸손', '과로'],
        careers: ['간호사', '교사', '상담사', '사회복지사', '의료진'],
        imagePath: 'assets/ISFJ_Protector.jpg',
        primaryColor: AppColors.getMBTITypeColor('ISFJ'),
        detailedDescription:
            '''당신은 헌신적인 '수호자'입니다. 마치 포근한 담요처럼 주변 사람들을 감싸 안으며, 보이지 않는 곳에서 묵묵히 사랑을 실천합니다. 당신의 세심한 배려와 따뜻한 마음은 다른 사람들의 상처를 치유하고, 희망을 되찾게 하는 마법 같은 힘을 가지고 있습니다. 때로는 자신보다 타인을 우선시하여 지치기도 하지만, 그 순수한 마음이야말로 세상을 더 아름답게 만드는 원동력입니다.''',
      ),
      MBTIType(
        code: 'ESTJ',
        name: '경영자',
        category: 'SJ',
        description: '뛰어난 관리자로, 사물이나 사람을 관리하는 데 타의 추종을 불허합니다.',
        strengths: ['리더십', '효율성', '신뢰성', '헌신적', '강한 의지'],
        weaknesses: ['융통성 부족', '비판적', '감정 무시', '독단적'],
        careers: ['관리자', '임원', '판사', '교사', '은행원'],
        imagePath: 'assets/ESTJ_Executive.jpg',
        primaryColor: AppColors.getMBTITypeColor('ESTJ'),
        detailedDescription:
            '''당신은 진정한 '경영자'입니다. 마치 거대한 교향악단을 지휘하는 마에스트로처럼, 복잡하고 혼란스러운 상황 속에서도 완벽한 하모니를 만들어내는 타고난 리더입니다. 당신의 확신에 찬 모습과 책임감 있는 태도가 주변 사람들에게 안정감과 신뢰를 선사합니다. 효율성과 성과를 추구하면서도 공정함을 잃지 않는 당신은, 조직과 사회의 기둥이 되는 진정한 관리자입니다.''',
      ),
      MBTIType(
        code: 'ESFJ',
        name: '집정관',
        category: 'SJ',
        description: '매우 배려심이 많고 사교적이며 인기가 많은 사람으로, 언제나 도움을 주려 합니다.',
        strengths: ['지지적', '신뢰성', '사회성', '실용성', '온화함'],
        weaknesses: ['자기주장 부족', '비판에 민감', '변화 거부', '타인 의존'],
        careers: ['간호사', '교사', '상담사', '사회복지사', '행정가'],
        imagePath: 'assets/ESFJ_Consul.jpg',
        primaryColor: AppColors.getMBTITypeColor('ESFJ'),
        detailedDescription:
            '''당신은 사교적인 '집정관'입니다. 마치 따뜻한 카페의 바리스타처럼, 사람들이 모이는 곳에는 항상 당신이 있습니다. 당신의 진심 어린 관심과 배려는 서로 다른 사람들을 하나로 연결하며, 모든 이가 소속감을 느낄 수 있는 공동체를 만드는 특별한 재능입니다. 전통과 조화를 중시하는 당신은 갈등을 해결하고 평화를 만들어가는 천성적인 중재자이자 사회의 접착제 역할을 합니다.''',
      ),

      // Explorers (SP)
      MBTIType(
        code: 'ISTP',
        name: '만능재주꾼',
        category: 'SP',
        description: '대담하고 실용적인 실험정신이 풍부한 장인으로, 모든 종류의 도구를 자유자재로 다룹니다.',
        strengths: ['실용성', '융통성', '효율성', '우선순위 파악', '위기 관리'],
        weaknesses: ['예측 불가능', '사생활 중시', '고집', '쉽게 지루함'],
        careers: ['엔지니어', '정비사', '파일럿', '법의학자', '운동선수'],
        imagePath: 'assets/ISTP_Virtuoso.jpg',
        primaryColor: AppColors.getMBTITypeColor('ISTP'),
        detailedDescription:
            '''당신은 실용적인 '만능재주꾼'입니다. 마치 숙련된 장인처럼, 당신의 손에 닿는 모든 것들이 완벽하게 동작하게 됩니다. 복잡한 문제 앞에서도 침착함을 잃지 않고, 직관적이면서도 효율적인 해결책을 찾아내는 당신은 진정한 문제 해결의 달인입니다. 말보다는 행동으로, 이론보다는 실습으로 세상과 소통하는 당신은 실무의 철학자이자 현실의 마술사입니다.''',
      ),
      MBTIType(
        code: 'ISFP',
        name: '모험가',
        category: 'SP',
        description: '유연하고 매력적인 예술가로, 언제나 새로운 가능성을 탐험할 준비가 되어 있습니다.',
        strengths: ['호기심', '예술성', '자연스러움', '실용성', '개방적'],
        weaknesses: ['스트레스에 취약', '독립적', '예측 불가능', '자기 비판적'],
        careers: ['예술가', '음악가', '디자이너', '간호사', '심리학자'],
        imagePath: 'assets/ISFP_Adventurer.jpg',
        primaryColor: AppColors.getMBTITypeColor('ISFP'),
        detailedDescription:
            '''당신은 예술적인 '모험가'입니다. 마치 들꽃처럼 자유롭고 아름다운 당신은, 다른 사람들이 지나치는 순간들 속에서도 특별한 의미와 아름다움을 발견합니다. 당신의 섬세한 감성과 순수한 마음은 세상에 따뜻한 색채를 입히며, 진정성 있는 삶의 가치를 보여줍니다. 자유로운 영혼으로 새로운 경험을 추구하면서도, 내면의 깊은 가치관을 잃지 않는 당신은 진정한 개성의 예술가입니다.''',
      ),
      MBTIType(
        code: 'ESTP',
        name: '사업가',
        category: 'SP',
        description: '영리하고 에너지 넘치며 인식력이 뛰어난 사람으로, 진정으로 위험을 즐깁니다.',
        strengths: ['용감함', '실용성', '기지', '사교성', '에너지'],
        weaknesses: ['성급함', '위험 감수', '갈등 회피', '집중력 부족'],
        careers: ['영업사원', 'MC', '배우', '경찰관', '구급요원'],
        imagePath: 'assets/ESTP_Entrepreneur.jpg',
        primaryColor: AppColors.getMBTITypeColor('ESTP'),
        detailedDescription:
            '''당신은 역동적인 '사업가'입니다. 마치 스포츠카처럼 빠르고 민첩한 당신은, 기회의 순간을 놓치지 않고 즉시 행동으로 옮기는 타고난 실행력을 가지고 있습니다. 당신의 생동감 넘치는 에너지와 현실적 감각은 주변 사람들을 활기차게 만들며, 모든 순간을 흥미진진하게 바꿉니다. 위험을 두려워하지 않고 도전하는 용기로, 정적인 일상에 활력과 변화를 불어넣는 진정한 액션의 주인공입니다.''',
      ),
      MBTIType(
        code: 'ESFP',
        name: '연예인',
        category: 'SP',
        description: '자발적이고 에너지 넘치며 열정적인 연예인으로, 주변 사람들을 지루하게 하는 일은 절대 없습니다.',
        strengths: ['사교성', '예술성', '실용성', '수용적', '관대함'],
        weaknesses: ['갈등 회피', '쉽게 지루함', '집중력 부족', '미래 계획 부족'],
        careers: ['연예인', '음악가', '패션디자이너', '상담사', '아동복지사'],
        imagePath: 'assets/ESFP_Entertainer.jpg',
        primaryColor: AppColors.getMBTITypeColor('ESFP'),
        detailedDescription:
            '''당신은 매력적인 '연예인'입니다. 마치 무대 위의 스포트라이트를 받는 배우처럼, 당신이 있는 곳은 어디든 즐거움과 웃음이 가득해집니다. 당신의 자연스러운 매력과 긍정적 에너지는 사람들의 마음을 사로잡으며, 평범한 일상도 특별한 추억으로 만드는 마법 같은 능력을 가지고 있습니다. 사람들과의 만남에서 진정한 기쁨을 찾는 당신은, 세상을 더 밝고 따뜻하게 만드는 천성적인 엔터테이너입니다.''',
      ),
    ];
  }

  static MBTIType? getTypeByCode(String code) {
    try {
      return getAllTypes().firstWhere((type) => type.code == code);
    } catch (e) {
      return null;
    }
  }

  static List<MBTIType> getTypesByCategory(String category) {
    return getAllTypes().where((type) => type.category == category).toList();
  }

  /// 분석가 그룹 (NT) 타입들 반환
  static List<MBTIType> getAnalysts() {
    return getTypesByCategory('NT');
  }

  /// 외교관 그룹 (NF) 타입들 반환
  static List<MBTIType> getDiplomats() {
    return getTypesByCategory('NF');
  }

  /// 관리자 그룹 (SJ) 타입들 반환
  static List<MBTIType> getSentinels() {
    return getTypesByCategory('SJ');
  }

  /// 탐험가 그룹 (SP) 타입들 반환
  static List<MBTIType> getExplorers() {
    return getTypesByCategory('SP');
  }
}
