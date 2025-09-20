import '../../domain/entities/question.dart';

class MBTIQuestionsLikert {
  // 5-point Likert Scale MBTI Assessment Questions (20 questions)
  static List<Question> getQuickAssessmentQuestions() {
    return [
      // E/I Questions (5)
      Question(
        id: 1,
        text: 'A. 파티나 큰 모임에서 많은 사람들과 대화하며 에너지를 얻는다\nVS\nB. 소수의 친한 사람들과 깊은 대화를 나누며 에너지를 얻는다',
        dimension: QuestionDimension.ei,
        options: [
          QuestionOption(text: '완전히 A', score: -2.0, value: 1),
          QuestionOption(text: '대체로 A', score: -1.0, value: 2),
          QuestionOption(text: '중간', score: 0.0, value: 3),
          QuestionOption(text: '대체로 B', score: 1.0, value: 4),
          QuestionOption(text: '완전히 B', score: 2.0, value: 5),
        ],
      ),
      Question(
        id: 2,
        text: 'A. 문제가 생기면 다른 사람들과 즉시 토론하며 해결책을 찾는다\nVS\nB. 문제가 생기면 혼자 충분히 생각한 후 결론을 내린다',
        dimension: QuestionDimension.ei,
        options: [
          QuestionOption(text: '완전히 A', score: -2.0, value: 1),
          QuestionOption(text: '대체로 A', score: -1.0, value: 2),
          QuestionOption(text: '중간', score: 0.0, value: 3),
          QuestionOption(text: '대체로 B', score: 1.0, value: 4),
          QuestionOption(text: '완전히 B', score: 2.0, value: 5),
        ],
      ),
      Question(
        id: 3,
        text: 'A. 새로운 환경에서 먼저 다른 사람들에게 다가가 대화를 시작한다\nVS\nB. 새로운 환경에서 상황을 관찰하며 다른 사람이 먼저 다가오길 기다린다',
        dimension: QuestionDimension.ei,
        options: [
          QuestionOption(text: '완전히 A', score: -2.0, value: 1),
          QuestionOption(text: '대체로 A', score: -1.0, value: 2),
          QuestionOption(text: '중간', score: 0.0, value: 3),
          QuestionOption(text: '대체로 B', score: 1.0, value: 4),
          QuestionOption(text: '완전히 B', score: 2.0, value: 5),
        ],
      ),
      Question(
        id: 4,
        text: 'A. 급한 일이 있으면 즉시 전화를 걸어 직접 대화한다\nVS\nB. 급한 일이 있어도 문자나 이메일로 충분히 생각해서 전달한다',
        dimension: QuestionDimension.ei,
        options: [
          QuestionOption(text: '완전히 A', score: -2.0, value: 1),
          QuestionOption(text: '대체로 A', score: -1.0, value: 2),
          QuestionOption(text: '중간', score: 0.0, value: 3),
          QuestionOption(text: '대체로 B', score: 1.0, value: 4),
          QuestionOption(text: '완전히 B', score: 2.0, value: 5),
        ],
      ),
      Question(
        id: 5,
        text: 'A. 스트레스받을 때 친구들과 만나 이야기하며 해소한다\nVS\nB. 스트레스받을 때 혼자만의 시간을 가지며 에너지를 충전한다',
        dimension: QuestionDimension.ei,
        options: [
          QuestionOption(text: '완전히 A', score: -2.0, value: 1),
          QuestionOption(text: '대체로 A', score: -1.0, value: 2),
          QuestionOption(text: '중간', score: 0.0, value: 3),
          QuestionOption(text: '대체로 B', score: 1.0, value: 4),
          QuestionOption(text: '완전히 B', score: 2.0, value: 5),
        ],
      ),

      // S/N Questions (5)
      Question(
        id: 6,
        text: 'A. 구체적이고 세부적인 사실과 데이터를 중시한다\nVS\nB. 큰 그림과 개념, 가능성에 더 관심이 많다',
        dimension: QuestionDimension.sn,
        options: [
          QuestionOption(text: '완전히 A', score: -2.0, value: 1),
          QuestionOption(text: '대체로 A', score: -1.0, value: 2),
          QuestionOption(text: '중간', score: 0.0, value: 3),
          QuestionOption(text: '대체로 B', score: 1.0, value: 4),
          QuestionOption(text: '완전히 B', score: 2.0, value: 5),
        ],
      ),
      Question(
        id: 7,
        text: 'A. 일을 계획할 때 단계별로 세부적이고 구체적인 계획을 세운다\nVS\nB. 일을 계획할 때 대략적인 방향만 정하고 유연하게 진행한다',
        dimension: QuestionDimension.sn,
        options: [
          QuestionOption(text: '완전히 A', score: -2.0, value: 1),
          QuestionOption(text: '대체로 A', score: -1.0, value: 2),
          QuestionOption(text: '중간', score: 0.0, value: 3),
          QuestionOption(text: '대체로 B', score: 1.0, value: 4),
          QuestionOption(text: '완전히 B', score: 2.0, value: 5),
        ],
      ),
      Question(
        id: 8,
        text: 'A. 새로운 아이디어를 들으면 현실적 적용 가능성과 구체적 결과를 먼저 생각한다\nVS\nB. 새로운 아이디어를 들으면 미래 가능성과 잠재력에 더 흥미를 느낀다',
        dimension: QuestionDimension.sn,
        options: [
          QuestionOption(text: '완전히 A', score: 2.0, value: 1),
          QuestionOption(text: '대체로 A', score: 1.0, value: 2),
          QuestionOption(text: '중간', score: 0.0, value: 3),
          QuestionOption(text: '대체로 B', score: -1.0, value: 4),
          QuestionOption(text: '완전히 B', score: -2.0, value: 5),
        ],
      ),
      Question(
        id: 9,
        text: 'A. 과거의 경험과 현재의 현실에 더 집중한다\nVS\nB. 미래의 가능성과 새로운 변화에 더 관심이 많다',
        dimension: QuestionDimension.sn,
        options: [
          QuestionOption(text: '완전히 A', score: -2.0, value: 1),
          QuestionOption(text: '대체로 A', score: -1.0, value: 2),
          QuestionOption(text: '중간', score: 0.0, value: 3),
          QuestionOption(text: '대체로 B', score: 1.0, value: 4),
          QuestionOption(text: '완전히 B', score: 2.0, value: 5),
        ],
      ),
      Question(
        id: 10,
        text: 'A. 실습과 경험을 통한 체험적 학습을 선호한다\nVS\nB. 이론과 개념을 통한 추상적 학습을 선호한다',
        dimension: QuestionDimension.sn,
        options: [
          QuestionOption(text: '완전히 A', score: -2.0, value: 1),
          QuestionOption(text: '대체로 A', score: -1.0, value: 2),
          QuestionOption(text: '중간', score: 0.0, value: 3),
          QuestionOption(text: '대체로 B', score: 1.0, value: 4),
          QuestionOption(text: '완전히 B', score: 2.0, value: 5),
        ],
      ),

      // T/F Questions (5)
      Question(
        id: 11,
        text: 'A. 결정을 내릴 때 논리적 분석과 객관적 사실을 더 중시한다\nVS\nB. 결정을 내릴 때 사람들의 감정과 가치, 인간관계를 더 고려한다',
        dimension: QuestionDimension.tf,
        options: [
          QuestionOption(text: '완전히 A', score: -2.0, value: 1),
          QuestionOption(text: '대체로 A', score: -1.0, value: 2),
          QuestionOption(text: '중간', score: 0.0, value: 3),
          QuestionOption(text: '대체로 B', score: 1.0, value: 4),
          QuestionOption(text: '완전히 B', score: 2.0, value: 5),
        ],
      ),
      Question(
        id: 12,
        text: 'A. 갈등 상황에서 원칙과 규칙에 따라 공정하게 해결한다\nVS\nB. 갈등 상황에서 당사자들의 감정과 관계를 고려해 조화롭게 해결한다',
        dimension: QuestionDimension.tf,
        options: [
          QuestionOption(text: '완전히 A', score: -2.0, value: 1),
          QuestionOption(text: '대체로 A', score: -1.0, value: 2),
          QuestionOption(text: '중간', score: 0.0, value: 3),
          QuestionOption(text: '대체로 B', score: 1.0, value: 4),
          QuestionOption(text: '완전히 B', score: 2.0, value: 5),
        ],
      ),
      Question(
        id: 13,
        text: 'A. 비판을 받을 때 논리적으로 맞는지를 객관적으로 분석한다\nVS\nB. 비판을 받을 때 비판의 의도와 관계에 미치는 영향을 고려한다',
        dimension: QuestionDimension.tf,
        options: [
          QuestionOption(text: '완전히 A', score: -2.0, value: 1),
          QuestionOption(text: '대체로 A', score: -1.0, value: 2),
          QuestionOption(text: '중간', score: 0.0, value: 3),
          QuestionOption(text: '대체로 B', score: 1.0, value: 4),
          QuestionOption(text: '완전히 B', score: 2.0, value: 5),
        ],
      ),
      Question(
        id: 14,
        text: 'A. 다른 사람을 평가할 때 능력과 성과, 객관적 결과를 더 중시한다\nVS\nB. 다른 사람을 평가할 때 인품과 노력, 개인적 상황을 더 고려한다',
        dimension: QuestionDimension.tf,
        options: [
          QuestionOption(text: '완전히 A', score: -2.0, value: 1),
          QuestionOption(text: '대체로 A', score: -1.0, value: 2),
          QuestionOption(text: '중간', score: 0.0, value: 3),
          QuestionOption(text: '대체로 B', score: 1.0, value: 4),
          QuestionOption(text: '완전히 B', score: 2.0, value: 5),
        ],
      ),
      Question(
        id: 15,
        text: 'A. 팀 프로젝트에서 효율성과 목표 달성에 집중한다\nVS\nB. 팀 프로젝트에서 팀 분위기와 구성원들의 만족도를 더 중시한다',
        dimension: QuestionDimension.tf,
        options: [
          QuestionOption(text: '완전히 A', score: -2.0, value: 1),
          QuestionOption(text: '대체로 A', score: -1.0, value: 2),
          QuestionOption(text: '중간', score: 0.0, value: 3),
          QuestionOption(text: '대체로 B', score: 1.0, value: 4),
          QuestionOption(text: '완전히 B', score: 2.0, value: 5),
        ],
      ),

      // J/P Questions (5)
      Question(
        id: 16,
        text: 'A. 여행을 계획할 때 미리 세세한 일정과 예약을 모두 완료한다\nVS\nB. 여행을 계획할 때 대략적 계획만 세우고 즉흥적으로 결정한다',
        dimension: QuestionDimension.jp,
        options: [
          QuestionOption(text: '완전히 A', score: -2.0, value: 1),
          QuestionOption(text: '대체로 A', score: -1.0, value: 2),
          QuestionOption(text: '중간', score: 0.0, value: 3),
          QuestionOption(text: '대체로 B', score: 1.0, value: 4),
          QuestionOption(text: '완전히 B', score: 2.0, value: 5),
        ],
      ),
      Question(
        id: 17,
        text: 'A. 데드라인이 있는 일은 미리 미리 준비해서 여유있게 완료한다\nVS\nB. 데드라인이 있는 일은 마감 임박해서 집중력을 발휘하여 완료한다',
        dimension: QuestionDimension.jp,
        options: [
          QuestionOption(text: '완전히 A', score: -2.0, value: 1),
          QuestionOption(text: '대체로 A', score: -1.0, value: 2),
          QuestionOption(text: '중간', score: 0.0, value: 3),
          QuestionOption(text: '대체로 B', score: 1.0, value: 4),
          QuestionOption(text: '완전히 B', score: 2.0, value: 5),
        ],
      ),
      Question(
        id: 18,
        text: 'A. 예측 가능하고 안정적인 환경을 선호한다\nVS\nB. 변화와 새로운 자극이 있는 환경을 선호한다',
        dimension: QuestionDimension.jp,
        options: [
          QuestionOption(text: '완전히 A', score: -2.0, value: 1),
          QuestionOption(text: '대체로 A', score: -1.0, value: 2),
          QuestionOption(text: '중간', score: 0.0, value: 3),
          QuestionOption(text: '대체로 B', score: 1.0, value: 4),
          QuestionOption(text: '완전히 B', score: 2.0, value: 5),
        ],
      ),
      Question(
        id: 19,
        text: 'A. 일상생활에서 규칙적이고 체계적인 일상을 선호한다\nVS\nB. 일상생활에서 유연하고 자유로운 일상을 선호한다',
        dimension: QuestionDimension.jp,
        options: [
          QuestionOption(text: '완전히 A', score: -2.0, value: 1),
          QuestionOption(text: '대체로 A', score: -1.0, value: 2),
          QuestionOption(text: '중간', score: 0.0, value: 3),
          QuestionOption(text: '대체로 B', score: 1.0, value: 4),
          QuestionOption(text: '완전히 B', score: 2.0, value: 5),
        ],
      ),
      Question(
        id: 20,
        text: 'A. 새로운 기회가 왔을 때 신중하게 검토한 후 결정한다\nVS\nB. 새로운 기회가 왔을 때 직감적으로 빠르게 결정하고 실행한다',
        dimension: QuestionDimension.jp,
        options: [
          QuestionOption(text: '완전히 A', score: -2.0, value: 1),
          QuestionOption(text: '대체로 A', score: -1.0, value: 2),
          QuestionOption(text: '중간', score: 0.0, value: 3),
          QuestionOption(text: '대체로 B', score: 1.0, value: 4),
          QuestionOption(text: '완전히 B', score: 2.0, value: 5),
        ],
      ),
    ];
  }
}
