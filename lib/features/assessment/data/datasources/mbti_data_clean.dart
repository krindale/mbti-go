import '../../domain/entities/mbti_type.dart';
import '../../../../core/theme/app_colors.dart';

class MBTIData {
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
            '''당신은 끝없는 호기심을 가진 '논리술사'입니다. 마치 매드 사이언티스트처럼, 당신의 마음은 항상 새로운 아이디어와 가능성들로 가득 차 있습니다. 복잡한 문제를 단순하고 우아한 해결책으로 바꿔내는 당신의 능력은 정말 마술과 같습니다. 때로는 구름 위를 걷는 것 같지만, 그 자유로운 사고가 세상을 바꿀 혁신적인 발견으로 이어지는 진정한 지식의 탐험가입니다.''',
      ),
      MBTIType(
        code: 'ENTJ',
        name: '통솔자',
        category: 'NT',
        description: '대담하고 상상력이 풍부하며 강한 의지를 가진 지도자입니다.',
        strengths: ['리더십', '전략적 사고', '결단력', '효율성', '목표 지향'],
        weaknesses: ['성급함', '비판적', '감정 무시', '독단적'],
        careers: ['CEO', '경영진', '정치가', '변호사', '컨설턴트'],
        imagePath: 'assets/ENTJ_Commander.jpg',
        primaryColor: AppColors.getMBTITypeColor('ENTJ'),
        detailedDescription:
            '''당신은 천생 리더인 '통솔자'입니다. 마치 전장의 장군처럼, 복잡한 상황 속에서도 명확한 전략과 비전을 제시하며 팀을 이끌어갑니다. 당신의 카리스마와 추진력은 불가능해 보이는 목표도 현실로 만들어내는 힘을 가지고 있습니다. 때로는 너무 강한 드라이브로 인해 오해받기도 하지만, 그 열정이 조직과 사회를 발전시키는 진정한 변화의 촉매제입니다.''',
      ),
      MBTIType(
        code: 'ENTP',
        name: '변론가',
        category: 'NT',
        description: '똑똑하고 호기심이 많은 사상가로, 지적 도전을 거부할 수 없습니다.',
        strengths: ['창의성', '열정', '카리스마', '에너지', '멘탈이 강함'],
        weaknesses: ['집중력 부족', '스트레스에 민감', '감정 무시', '조직적이지 못함'],
        careers: ['기업가', '변호사', '과학자', '발명가', '컨설턴트'],
        imagePath: 'assets/ENTP_Debater.jpg',
        primaryColor: AppColors.getMBTITypeColor('ENTP'),
        detailedDescription:
            '''당신은 아이디어의 연금술사인 '변론가'입니다. 마치 스파크가 튀는 브레인스토밍 세션처럼, 당신의 주위에는 항상 창의적인 에너지가 넘쳐흐릅니다. 기존의 틀을 깨뜨리고 새로운 관점을 제시하는 당신의 능력은 주변 사람들에게 영감을 줍니다. 때로는 너무 많은 아이디어로 인해 산만해 보일 수 있지만, 그 다채로운 사고가 세상에 혁신을 가져다주는 진정한 아이디어 제너레이터입니다.''',
      ),

      // Diplomats (NF)
      MBTIType(
        code: 'INFJ',
        name: '옹호자',
        category: 'NF',
        description: '선의의 옹호자로, 조용하지만 매우 영감을 주는 이상주의자입니다.',
        strengths: ['통찰력', '원칙', '결단력', '열정', '이타주의'],
        weaknesses: ['민감함', '극도로 사적임', '완벽주의', '항상 이유가 필요함'],
        careers: ['상담사', '작가', '교사', '예술가', '심리학자'],
        imagePath: 'assets/INFJ_Advocate.jpg',
        primaryColor: AppColors.getMBTITypeColor('INFJ'),
        detailedDescription:
            '''당신은 깊은 통찰력을 가진 '옹호자'입니다. 마치 마음을 읽는 듯한 능력으로, 다른 사람들의 숨겨진 감정과 동기를 이해합니다. 당신의 따뜻한 마음과 굳은 신념은 세상을 더 나은 곳으로 만들고자 하는 순수한 열망으로 가득합니다. 때로는 너무 깊이 느끼고 생각해서 지칠 수 있지만, 그 섬세한 감성이 다른 이들에게 희망과 위로를 전하는 진정한 마음의 치유사입니다.''',
      ),
      MBTIType(
        code: 'INFP',
        name: '중재자',
        category: 'NF',
        description: '시적이고 친절하며 이타적인 사람으로, 항상 돕고자 합니다.',
        strengths: ['공감 능력', '관대함', '개방성', '창의성', '열정'],
        weaknesses: ['너무 이상주의적', '너무 개인적으로 받아들임', '효율성이 떨어짐'],
        careers: ['작가', '예술가', '상담사', '심리학자', '사회복지사'],
        imagePath: 'assets/INFP_Mediator.jpg',
        primaryColor: AppColors.getMBTITypeColor('INFP'),
        detailedDescription:
            '''당신은 순수한 마음을 가진 '중재자'입니다. 마치 시인의 감성으로 세상을 바라보며, 모든 것에서 아름다움과 의미를 찾아냅니다. 당신의 깊은 공감 능력과 따뜻한 마음은 상처받은 이들에게 안식처가 되어줍니다. 때로는 현실과 이상 사이에서 고민하기도 하지만, 그 순수한 열정이 세상에 평화와 조화를 가져다주는 진정한 마음의 예술가입니다.''',
      ),
      MBTIType(
        code: 'ENFJ',
        name: '선도자',
        category: 'NF',
        description: '카리스마 있고 영감을 주는 지도자로, 듣는 이들을 매혹시킵니다.',
        strengths: ['관대함', '신뢰성', '카리스마', '이타주의', '자연스러운 지도자'],
        weaknesses: ['지나친 관대함', '너무 민감함', '압박감', '어려운 결정 회피'],
        careers: ['교사', '상담사', '코치', '정치가', '종교인'],
        imagePath: 'assets/ENFJ_Protagonist.jpg',
        primaryColor: AppColors.getMBTITypeColor('ENFJ'),
        detailedDescription:
            '''당신은 따뜻한 카리스마를 가진 '선도자'입니다. 마치 태양처럼, 당신의 존재만으로도 주변 사람들이 밝아지고 용기를 얻습니다. 다른 이들의 잠재력을 알아보고 그들이 성장할 수 있도록 돕는 당신의 능력은 정말 특별합니다. 때로는 남을 위해 자신을 희생하기도 하지만, 그 무조건적인 사랑과 지지가 많은 이들의 인생을 바꿔놓는 진정한 인간관계의 마에스트로입니다.''',
      ),
      MBTIType(
        code: 'ENFP',
        name: '활동가',
        category: 'NF',
        description: '열정적이고 창의적인 사교적인 자유로운 영혼입니다.',
        strengths: ['열정', '창의성', '사교성', '에너지', '긍정적'],
        weaknesses: ['스트레스에 민감', '집중력 부족', '지나친 감정 이입', '독립성 과대 평가'],
        careers: ['저널리스트', '배우', '상담사', '사회복지사', '기업가'],
        imagePath: 'assets/ENFP_Campaigner.jpg',
        primaryColor: AppColors.getMBTITypeColor('ENFP'),
        detailedDescription:
            '''당신은 삶의 축제를 만드는 '활동가'입니다. 마치 다채로운 불꽃놀이처럼, 당신의 열정과 에너지는 어둠 속에서도 밝게 빛납니다. 새로운 사람들과의 만남과 경험을 통해 끊임없이 성장하는 당신의 모습은 보는 이들에게 용기를 줍니다. 때로는 너무 많은 것을 한번에 하려고 해서 지칠 수 있지만, 그 무한한 가능성에 대한 믿음이 세상을 더 흥미진진한 곳으로 만드는 진정한 라이프 크리에이터입니다.''',
      ),

      // Sentinels (SJ)
      MBTIType(
        code: 'ISTJ',
        name: '현실주의자',
        category: 'SJ',
        description: '실용적이고 사실에 기반한 신뢰할 수 있는 사람입니다.',
        strengths: ['정직함', '직설적', '강한 의지', '의무감', '차분함'],
        weaknesses: ['고집스러움', '둔감함', '판단하기를 좋아함', '자기비하'],
        careers: ['회계사', '변호사', '의사', '경영자', '군인'],
        imagePath: 'assets/ISTJ_Logistician.jpg',
        primaryColor: AppColors.getMBTITypeColor('ISTJ'),
        detailedDescription:
            '''당신은 든든한 기둥 같은 '현실주의자'입니다. 마치 세월이 지나도 변하지 않는 등대처럼, 당신의 일관성과 신뢰성은 주변 사람들에게 안정감을 줍니다. 체계적이고 책임감 있는 당신의 모습은 혼란스러운 상황에서도 질서를 만들어냅니다. 때로는 너무 신중해서 보수적으로 보일 수 있지만, 그 견고한 기반이 가정과 조직의 든든한 뿌리가 되어주는 진정한 생활의 마스터입니다.''',
      ),
      MBTIType(
        code: 'ISFJ',
        name: '수호자',
        category: 'SJ',
        description: '따뜻하고 헌신적인 사람으로, 항상 사랑하는 사람들을 지킬 준비가 되어 있습니다.',
        strengths: ['지지해줌', '신뢰성', '열심히 일함', '겸손', '따뜻함'],
        weaknesses: ['겸손함', '신념을 억압함', '과부하 받기 쉬움', '완벽주의자'],
        careers: ['의사', '간호사', '교사', '상담사', '사회복지사'],
        imagePath: 'assets/ISFJ_Protector.jpg',
        primaryColor: AppColors.getMBTITypeColor('ISFJ'),
        detailedDescription:
            '''당신은 따뜻한 품을 가진 '수호자'입니다. 마치 어머니의 사랑처럼, 당신의 배려와 헌신은 주변 사람들을 감싸안고 보호합니다. 남들의 필요를 먼저 생각하고 조용히 뒷바라지하는 당신의 모습은 정말 소중합니다. 때로는 자신을 뒷전으로 미루며 지칠 수 있지만, 그 무조건적인 사랑과 관심이 많은 이들의 삶에 따뜻함을 전하는 진정한 마음의 안식처입니다.''',
      ),
      MBTIType(
        code: 'ESTJ',
        name: '경영자',
        category: 'SJ',
        description: '뛰어난 관리자로, 사물이나 사람들을 관리하는 데 타고난 재능이 있습니다.',
        strengths: ['헌신적', '강한 의지', '직설적이고 정직함', '충성심', '끈기 있음'],
        weaknesses: ['고집스러움', '어려운 감정 표현', '판단하기를 좋아함', '지나친 집중'],
        careers: ['관리자', '행정관', '판사', '교사', '군인'],
        imagePath: 'assets/ESTJ_Executive.jpg',
        primaryColor: AppColors.getMBTITypeColor('ESTJ'),
        detailedDescription:
            '''당신은 타고난 조직가인 '경영자'입니다. 마치 오케스트라의 지휘자처럼, 복잡한 상황도 체계적으로 정리하고 효율적으로 관리해냅니다. 당신의 리더십과 실행력은 팀의 목표 달성을 가능하게 만드는 원동력입니다. 때로는 너무 완벽을 추구해서 경직되어 보일 수 있지만, 그 확고한 신념과 추진력이 조직과 사회의 발전을 이끄는 진정한 실행의 달인입니다.''',
      ),
      MBTIType(
        code: 'ESFJ',
        name: '집정관',
        category: 'SJ',
        description: '인기가 많고 사교적인 사람으로, 항상 다른 사람들을 도울 준비가 되어 있습니다.',
        strengths: ['강한 실용적인 기술', '강한 의무감', '매우 충성적', '민감하고 따뜻함'],
        weaknesses: ['걱정이 많음', '비판에 민감함', '지나친 이타심', '사람에게 집중'],
        careers: ['간호사', '교사', '상담사', '사회복지사', '이벤트 플래너'],
        imagePath: 'assets/ESFJ_Consul.jpg',
        primaryColor: AppColors.getMBTITypeColor('ESFJ'),
        detailedDescription:
            '''당신은 사람들을 하나로 묶는 '집정관'입니다. 마치 따뜻한 커뮤니티 센터처럼, 당신 주위에는 항상 사람들이 모이고 웃음꽃이 핍니다. 다른 이들의 감정을 세심하게 배려하고 조화로운 분위기를 만드는 당신의 능력은 정말 특별합니다. 때로는 남들의 평가에 너무 신경써서 힘들 수 있지만, 그 따뜻한 마음과 배려가 많은 이들에게 소속감과 행복을 선사하는 진정한 관계의 아키텍트입니다.''',
      ),

      // Explorers (SP)
      MBTIType(
        code: 'ISTP',
        name: '만능재주꾼',
        category: 'SP',
        description: '대담하고 실용적인 실험정신의 소유자입니다.',
        strengths: ['현실적', '에너지가 넘침', '창조적이고 실용적', '자발적', '여유로움'],
        weaknesses: ['고집스러움', '둔감함', '사적임', '위기 상황 발생'],
        careers: ['기계공', '엔지니어', '법의학자', '파일럿', '사진작가'],
        imagePath: 'assets/ISTP_Virtuoso.jpg',
        primaryColor: AppColors.getMBTITypeColor('ISTP'),
        detailedDescription:
            '''당신은 손재주가 뛰어난 '만능재주꾼'입니다. 마치 마법사의 손처럼, 복잡한 기계나 도구들이 당신의 손을 거치면 완벽하게 작동합니다. 차분하고 과묵해 보이지만, 실제로는 끊임없이 세상의 원리를 탐구하고 실험하는 호기심 많은 탐험가입니다. 때로는 말보다 행동으로 표현하는 성향 때문에 오해받기도 하지만, 그 실용적인 지혜와 문제해결 능력이 위기의 순간에 빛을 발하는 진정한 솔루션 크리에이터입니다.''',
      ),
      MBTIType(
        code: 'ISFP',
        name: '모험가',
        category: 'SP',
        description: '유연하고 매력적인 예술가로, 항상 새로운 가능성을 찾고 있습니다.',
        strengths: ['매력적', '민감함', '친근함', '열정적', '호기심 많음'],
        weaknesses: ['변덕스러움', '스트레스에 민감', '경쟁적이지 않음', '쉽게 산만해짐'],
        careers: ['예술가', '음악가', '사진작가', '디자이너', '요리사'],
        imagePath: 'assets/ISFP_Adventurer.jpg',
        primaryColor: AppColors.getMBTITypeColor('ISFP'),
        detailedDescription:
            '''당신은 자유로운 영혼의 '모험가'입니다. 마치 바람에 흩날리는 꽃잎처럼, 당신의 감성과 직관은 세상의 아름다움을 독특한 방식으로 표현해냅니다. 평화로워 보이지만 내면에는 깊은 열정과 창의성이 꿈틀거리고 있습니다. 때로는 현실의 벽 앞에서 주저하기도 하지만, 그 순수한 감성과 예술적 재능이 세상에 새로운 아름다움을 선사하는 진정한 감성의 아티스트입니다.''',
      ),
      MBTIType(
        code: 'ESTP',
        name: '사업가',
        category: 'SP',
        description: '똑똑하고 에너지 넘치며 매우 인식력이 좋은 사람입니다.',
        strengths: ['담대함', '현실적', '원래 사교성', '우수한 사람 기술', '실용적'],
        weaknesses: ['민감함', '갈등 회피', '쉽게 지루해함', '장기계획의 어려움'],
        careers: ['영업사원', '마케터', '기업가', '연예인', '스포츠 선수'],
        imagePath: 'assets/ESTP_Entrepreneur.jpg',
        primaryColor: AppColors.getMBTITypeColor('ESTP'),
        detailedDescription:
            '''당신은 현장의 스타인 '사업가'입니다. 마치 무대 위의 연기자처럼, 어떤 상황에서도 자신감 넘치는 모습으로 사람들을 매료시킵니다. 순간의 기회를 놓치지 않고 과감하게 도전하는 당신의 모습은 정말 역동적입니다. 때로는 너무 즉흥적이어서 계획성이 부족해 보일 수 있지만, 그 뛰어난 순발력과 적응력이 예상치 못한 성공을 만들어내는 진정한 기회의 사냥꾼입니다.''',
      ),
      MBTIType(
        code: 'ESFP',
        name: '연예인',
        category: 'SP',
        description: '자발적이고 열정적이며 친근한 연예인으로, 삶과 사람에게서 즐거움을 찾습니다.',
        strengths: ['담대함', '원래 사교성', '우수한 사람 기술', '실용적', '관찰력이 뛰어남'],
        weaknesses: ['민감함', '갈등 회피', '쉽게 지루해함', '장기계획의 어려움'],
        careers: ['연예인', '음악가', '사회복지사', '코치', '이벤트 플래너'],
        imagePath: 'assets/ESFP_Entertainer.jpg',
        primaryColor: AppColors.getMBTITypeColor('ESFP'),
        detailedDescription:
            '''당신은 삶의 무대를 빛내는 '연예인'입니다. 마치 햇살처럼 밝고 따뜻한 에너지로, 어디를 가든 분위기를 활기차게 만들어냅니다. 사람들과 함께하는 것을 좋아하고 그들의 기쁨이 곧 당신의 기쁨이 되는 순수한 마음을 가지고 있습니다. 때로는 계획보다는 느낌에 의존해서 실수하기도 하지만, 그 자연스러운 매력과 긍정적인 에너지가 많은 이들의 일상에 즐거움을 선사하는 진정한 행복의 전도사입니다.''',
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
}
