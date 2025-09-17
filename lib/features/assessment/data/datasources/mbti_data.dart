import '../../domain/entities/mbti_type.dart';
import '../../domain/entities/question.dart';
import '../../../../core/theme/app_colors.dart';

class MBTIData {
  static List<MBTIType> getAllTypes() {
    return [
      // Analysts (NT)
      MBTIType(
        code: 'INTJ',
        name: 'Architect',
        category: 'NT',
        description: '상상력이 풍부하고 전략적인 사상가로, 모든 일에 계획을 세웁니다.',
        strengths: ['전략적 사고', '독립성', '결단력', '집중력', '창의성'],
        weaknesses: ['지나친 비판', '사회성 부족', '감정 표현 어려움', '완벽주의'],
        careers: ['과학자', '엔지니어', '건축가', '연구원', '전략 기획자'],
        imagePath: 'assets/INTJ_Architect.jpg',
        primaryColor: AppColors.getMBTITypeColor('INTJ'),
      ),
      MBTIType(
        code: 'INTP',
        name: 'Thinker',
        category: 'NT',
        description: '혁신적인 발명가로, 지식에 대한 끝없는 갈증을 가지고 있습니다.',
        strengths: ['논리적 사고', '창의성', '객관성', '적응력', '분석력'],
        weaknesses: ['우유부단', '집중력 부족', '감정 무시', '현실성 부족'],
        careers: ['연구원', '프로그래머', '철학자', '분석가', '발명가'],
        imagePath: 'assets/INTP_Thinker.jpg',
        primaryColor: AppColors.getMBTITypeColor('INTP'),
      ),
      MBTIType(
        code: 'ENTJ',
        name: 'Commander',
        category: 'NT',
        description: '대담하고 상상력이 풍부한 강력한 의지의 리더입니다.',
        strengths: ['리더십', '결단력', '효율성', '전략적 계획', '자신감'],
        weaknesses: ['지나친 비판', '인내심 부족', '감정 무시', '고집'],
        careers: ['CEO', '관리자', '기업가', '변호사', '정치인'],
        imagePath: 'assets/ENTJ_Commander.jpg',
        primaryColor: AppColors.getMBTITypeColor('ENTJ'),
      ),
      MBTIType(
        code: 'ENTP',
        name: 'Debater',
        category: 'NT',
        description: '영리하고 호기심이 많은 사상가로, 지적 도전을 거부할 수 없습니다.',
        strengths: ['창의성', '열정', '카리스마', '에너지', '지적 호기심'],
        weaknesses: ['집중력 부족', '조직력 부족', '스트레스에 민감', '루틴 싫어함'],
        careers: ['발명가', '기자', '심리학자', '사진가', '컨설턴트'],
        imagePath: 'assets/ENTP_Debater.jpg',
        primaryColor: AppColors.getMBTITypeColor('ENTP'),
      ),

      // Diplomats (NF)
      MBTIType(
        code: 'INFJ',
        name: 'Advocate',
        category: 'NF',
        description: '선의의 옹호자로, 조용하지만 매우 영감을 주는 이상주의자입니다.',
        strengths: ['직관력', '결단력', '이타심', '창의성', '통찰력'],
        weaknesses: ['완벽주의', '지나친 사생활 보호', '민감함', '번아웃'],
        careers: ['상담사', '작가', '사회복지사', '심리학자', '교육자'],
        imagePath: 'assets/INFJ_Advocate.jpg',
        primaryColor: AppColors.getMBTITypeColor('INFJ'),
      ),
      MBTIType(
        code: 'INFP',
        name: 'Mediator',
        category: 'NF',
        description: '시적이고 친절하며 이타적인 사람으로, 언제나 선의와 화합을 추구합니다.',
        strengths: ['이상주의', '충성심', '적응력', '호기심', '가능성 탐구'],
        weaknesses: ['지나친 이상주의', '자기 비판적', '실용성 부족', '스트레스 취약'],
        careers: ['작가', '예술가', '상담사', '심리학자', '사회복지사'],
        imagePath: 'assets/INFP_Mediator.jpg',
        primaryColor: AppColors.getMBTITypeColor('INFP'),
      ),
      MBTIType(
        code: 'ENFJ',
        name: 'Protagonist',
        category: 'NF',
        description: '카리스마 있고 영감을 주는 리더로, 청중을 매혹시키는 능력이 있습니다.',
        strengths: ['리더십', '이타심', '카리스마', '신뢰성', '관용'],
        weaknesses: ['지나친 이상주의', '자기 비판적', '결정 어려움', '타인 의존'],
        careers: ['교육자', '상담사', '외교관', '정치인', '종교인'],
        imagePath: 'assets/ENFJ_Protagonist.jpg',
        primaryColor: AppColors.getMBTITypeColor('ENFJ'),
      ),
      MBTIType(
        code: 'ENFP',
        name: 'Campaigner',
        category: 'NF',
        description: '열정적이고 창의적인 사교적인 자유로운 영혼으로, 언제나 웃을 이유를 찾을 수 있습니다.',
        strengths: ['열정', '창의성', '사회성', '자유로운 사고', '긍정적'],
        weaknesses: ['집중력 부족', '조직력 부족', '스트레스 관리 어려움', '실무 약함'],
        careers: ['기자', '상담사', '배우', '음악가', '마케터'],
        imagePath: 'assets/ENFP_Campaigner.jpg',
        primaryColor: AppColors.getMBTITypeColor('ENFP'),
      ),

      // Sentinels (SJ)
      MBTIType(
        code: 'ISTJ',
        name: 'Logistician',
        category: 'SJ',
        description: '실용적이고 사실에 기반한 신뢰할 수 있는 사람입니다.',
        strengths: ['책임감', '신뢰성', '실용성', '근면성', '집중력'],
        weaknesses: ['융통성 부족', '감정 표현 어려움', '변화 거부', '지나친 신중'],
        careers: ['회계사', '의사', '치과의사', '법무관', '관리자'],
        imagePath: 'assets/ISTJ_Logistician.jpg',
        primaryColor: AppColors.getMBTITypeColor('ISTJ'),
      ),
      MBTIType(
        code: 'ISFJ',
        name: 'Protector',
        category: 'SJ',
        description: '매우 헌신적이고 따뜻한 수호자로, 언제나 사랑하는 사람들을 방어할 준비가 되어 있습니다.',
        strengths: ['지지적', '신뢰성', '인내심', '실용성', '열심'],
        weaknesses: ['자기주장 부족', '변화 거부', '지나친 겸손', '과로'],
        careers: ['간호사', '교사', '상담사', '사회복지사', '의료진'],
        imagePath: 'assets/ISFJ_Protector.jpg',
        primaryColor: AppColors.getMBTITypeColor('ISFJ'),
      ),
      MBTIType(
        code: 'ESTJ',
        name: 'Executive',
        category: 'SJ',
        description: '뛰어난 관리자로, 사물이나 사람을 관리하는 데 타의 추종을 불허합니다.',
        strengths: ['리더십', '효율성', '신뢰성', '헌신적', '강한 의지'],
        weaknesses: ['융통성 부족', '비판적', '감정 무시', '독단적'],
        careers: ['관리자', '임원', '판사', '교사', '은행원'],
        imagePath: 'assets/ESTJ_Executive.jpg',
        primaryColor: AppColors.getMBTITypeColor('ESTJ'),
      ),
      MBTIType(
        code: 'ESFJ',
        name: 'Consul',
        category: 'SJ',
        description: '매우 배려심이 많고 사교적이며 인기가 많은 사람으로, 언제나 도움을 주려 합니다.',
        strengths: ['지지적', '신뢰성', '사회성', '실용성', '온화함'],
        weaknesses: ['자기주장 부족', '비판에 민감', '변화 거부', '타인 의존'],
        careers: ['간호사', '교사', '상담사', '사회복지사', '행정가'],
        imagePath: 'assets/ESFJ_Consul.jpg',
        primaryColor: AppColors.getMBTITypeColor('ESFJ'),
      ),

      // Explorers (SP)
      MBTIType(
        code: 'ISTP',
        name: 'Virtuoso',
        category: 'SP',
        description: '대담하고 실용적인 실험정신이 풍부한 장인으로, 모든 종류의 도구를 자유자재로 다룹니다.',
        strengths: ['실용성', '융통성', '효율성', '우선순위 파악', '위기 관리'],
        weaknesses: ['예측 불가능', '사생활 중시', '고집', '쉽게 지루함'],
        careers: ['엔지니어', '정비사', '파일럿', '법의학자', '운동선수'],
        imagePath: 'assets/ISTP_Virtuoso.jpg',
        primaryColor: AppColors.getMBTITypeColor('ISTP'),
      ),
      MBTIType(
        code: 'ISFP',
        name: 'Adventurer',
        category: 'SP',
        description: '유연하고 매력적인 예술가로, 언제나 새로운 가능성을 탐험할 준비가 되어 있습니다.',
        strengths: ['호기심', '예술성', '자연스러움', '실용성', '개방적'],
        weaknesses: ['스트레스에 취약', '독립적', '예측 불가능', '자기 비판적'],
        careers: ['예술가', '음악가', '디자이너', '간호사', '심리학자'],
        imagePath: 'assets/ISFP_Adventurer.jpg',
        primaryColor: AppColors.getMBTITypeColor('ISFP'),
      ),
      MBTIType(
        code: 'ESTP',
        name: 'Entrepreneur',
        category: 'SP',
        description: '영리하고 에너지 넘치며 인식력이 뛰어난 사람으로, 진정으로 위험을 즐깁니다.',
        strengths: ['용감함', '실용성', '기지', '사교성', '에너지'],
        weaknesses: ['성급함', '위험 감수', '갈등 회피', '집중력 부족'],
        careers: ['영업사원', 'MC', '배우', '경찰관', '구급요원'],
        imagePath: 'assets/ESTP_Entrepreneur.jpg',
        primaryColor: AppColors.getMBTITypeColor('ESTP'),
      ),
      MBTIType(
        code: 'ESFP',
        name: 'Entertainer',
        category: 'SP',
        description: '자발적이고 에너지 넘치며 열정적인 연예인으로, 주변 사람들을 지루하게 하는 일은 절대 없습니다.',
        strengths: ['사교성', '예술성', '실용성', '수용적', '관대함'],
        weaknesses: ['갈등 회피', '쉽게 지루함', '집중력 부족', '미래 계획 부족'],
        careers: ['연예인', '음악가', '패션디자이너', '상담사', '아동복지사'],
        imagePath: 'assets/ESFP_Entertainer.jpg',
        primaryColor: AppColors.getMBTITypeColor('ESFP'),
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

  // Quick Assessment Questions (20 questions)
  static List<Question> getQuickAssessmentQuestions() {
    return [
      // E/I Questions (5)
      Question(
        id: 1,
        text: '파티에서 당신은 주로 어떻게 행동하나요?',
        dimension: QuestionDimension.ei,
        options: [
          QuestionOption(text: '많은 사람들과 대화하며 에너지를 얻는다', score: 1.0, preference: 'E'),
          QuestionOption(text: '친한 몇 명과만 깊은 대화를 나눈다', score: 1.0, preference: 'I'),
        ],
      ),
      Question(
        id: 2,
        text: '문제를 해결할 때 당신의 방식은?',
        dimension: QuestionDimension.ei,
        options: [
          QuestionOption(text: '다른 사람들과 토론하며 해결책을 찾는다', score: 1.0, preference: 'E'),
          QuestionOption(text: '혼자 충분히 생각한 후 결론을 내린다', score: 1.0, preference: 'I'),
        ],
      ),
      Question(
        id: 3,
        text: '새로운 환경에 적응하는 당신의 모습은?',
        dimension: QuestionDimension.ei,
        options: [
          QuestionOption(text: '적극적으로 사람들에게 다가가며 빠르게 적응한다', score: 1.0, preference: 'E'),
          QuestionOption(text: '조용히 관찰하며 천천히 적응한다', score: 1.0, preference: 'I'),
        ],
      ),
      Question(
        id: 4,
        text: '전화 통화에 대한 당신의 선호는?',
        dimension: QuestionDimension.ei,
        options: [
          QuestionOption(text: '전화로 이야기하는 것을 좋아한다', score: 1.0, preference: 'E'),
          QuestionOption(text: '문자나 이메일을 더 선호한다', score: 1.0, preference: 'I'),
        ],
      ),
      Question(
        id: 5,
        text: '스트레스를 받을 때 당신은?',
        dimension: QuestionDimension.ei,
        options: [
          QuestionOption(text: '친구들과 만나서 이야기한다', score: 1.0, preference: 'E'),
          QuestionOption(text: '혼자만의 시간을 가진다', score: 1.0, preference: 'I'),
        ],
      ),

      // S/N Questions (5)
      Question(
        id: 6,
        text: '정보를 받아들일 때 당신은?',
        dimension: QuestionDimension.sn,
        options: [
          QuestionOption(text: '구체적이고 실용적인 정보를 선호한다', score: 1.0, preference: 'S'),
          QuestionOption(text: '개념적이고 이론적인 정보를 선호한다', score: 1.0, preference: 'N'),
        ],
      ),
      Question(
        id: 7,
        text: '일을 계획할 때 당신의 방식은?',
        dimension: QuestionDimension.sn,
        options: [
          QuestionOption(text: '단계별로 세부적인 계획을 세운다', score: 1.0, preference: 'S'),
          QuestionOption(text: '큰 그림을 그리고 유연하게 진행한다', score: 1.0, preference: 'N'),
        ],
      ),
      Question(
        id: 8,
        text: '새로운 아이디어에 대한 당신의 반응은?',
        dimension: QuestionDimension.sn,
        options: [
          QuestionOption(text: '실현 가능성을 먼저 따진다', score: 1.0, preference: 'S'),
          QuestionOption(text: '가능성과 잠재력에 흥미를 느낀다', score: 1.0, preference: 'N'),
        ],
      ),
      Question(
        id: 9,
        text: '과거와 미래 중 더 관심이 있는 것은?',
        dimension: QuestionDimension.sn,
        options: [
          QuestionOption(text: '과거의 경험과 현재의 현실', score: 1.0, preference: 'S'),
          QuestionOption(text: '미래의 가능성과 비전', score: 1.0, preference: 'N'),
        ],
      ),
      Question(
        id: 10,
        text: '학습할 때 당신의 선호는?',
        dimension: QuestionDimension.sn,
        options: [
          QuestionOption(text: '실습과 경험을 통한 학습', score: 1.0, preference: 'S'),
          QuestionOption(text: '이론과 개념을 통한 학습', score: 1.0, preference: 'N'),
        ],
      ),

      // T/F Questions (5)
      Question(
        id: 11,
        text: '결정을 내릴 때 당신이 중요하게 생각하는 것은?',
        dimension: QuestionDimension.tf,
        options: [
          QuestionOption(text: '논리적 분석과 객관적 사실', score: 1.0, preference: 'T'),
          QuestionOption(text: '사람들의 감정과 가치관', score: 1.0, preference: 'F'),
        ],
      ),
      Question(
        id: 12,
        text: '갈등 상황에서 당신의 대처 방식은?',
        dimension: QuestionDimension.tf,
        options: [
          QuestionOption(text: '원칙과 규칙에 따라 해결한다', score: 1.0, preference: 'T'),
          QuestionOption(text: '모든 사람이 만족할 수 있는 방법을 찾는다', score: 1.0, preference: 'F'),
        ],
      ),
      Question(
        id: 13,
        text: '비판을 받을 때 당신의 반응은?',
        dimension: QuestionDimension.tf,
        options: [
          QuestionOption(text: '논리적으로 맞는지 분석한다', score: 1.0, preference: 'T'),
          QuestionOption(text: '개인적으로 상처받는다', score: 1.0, preference: 'F'),
        ],
      ),
      Question(
        id: 14,
        text: '다른 사람을 평가할 때 중요한 기준은?',
        dimension: QuestionDimension.tf,
        options: [
          QuestionOption(text: '능력과 성과', score: 1.0, preference: 'T'),
          QuestionOption(text: '인품과 노력', score: 1.0, preference: 'F'),
        ],
      ),
      Question(
        id: 15,
        text: '팀 프로젝트에서 당신의 역할은?',
        dimension: QuestionDimension.tf,
        options: [
          QuestionOption(text: '효율성을 높이고 목표 달성에 집중한다', score: 1.0, preference: 'T'),
          QuestionOption(text: '팀의 화합과 구성원들의 만족을 중시한다', score: 1.0, preference: 'F'),
        ],
      ),

      // J/P Questions (5)
      Question(
        id: 16,
        text: '여행을 계획할 때 당신의 스타일은?',
        dimension: QuestionDimension.jp,
        options: [
          QuestionOption(text: '미리 세세한 일정을 계획한다', score: 1.0, preference: 'J'),
          QuestionOption(text: '즉흥적으로 결정하며 여행한다', score: 1.0, preference: 'P'),
        ],
      ),
      Question(
        id: 17,
        text: '데드라인에 대한 당신의 태도는?',
        dimension: QuestionDimension.jp,
        options: [
          QuestionOption(text: '미리 미리 준비해서 여유있게 마무리한다', score: 1.0, preference: 'J'),
          QuestionOption(text: '마지막에 집중해서 완성한다', score: 1.0, preference: 'P'),
        ],
      ),
      Question(
        id: 18,
        text: '변화에 대한 당신의 반응은?',
        dimension: QuestionDimension.jp,
        options: [
          QuestionOption(text: '예측 가능한 것을 선호한다', score: 1.0, preference: 'J'),
          QuestionOption(text: '변화와 새로운 것을 환영한다', score: 1.0, preference: 'P'),
        ],
      ),
      Question(
        id: 19,
        text: '일상생활에서 당신의 모습은?',
        dimension: QuestionDimension.jp,
        options: [
          QuestionOption(text: '규칙적이고 체계적으로 생활한다', score: 1.0, preference: 'J'),
          QuestionOption(text: '융통성 있고 자유롭게 생활한다', score: 1.0, preference: 'P'),
        ],
      ),
      Question(
        id: 20,
        text: '새로운 기회가 왔을 때 당신은?',
        dimension: QuestionDimension.jp,
        options: [
          QuestionOption(text: '신중하게 검토한 후 결정한다', score: 1.0, preference: 'J'),
          QuestionOption(text: '일단 시도해보고 경험하며 배운다', score: 1.0, preference: 'P'),
        ],
      ),
    ];
  }
}