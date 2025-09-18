import '../../domain/entities/question.dart';

class MBTIQuestionsLikert {
  // 5-point Likert Scale MBTI Assessment Questions (20 questions)
  static List<Question> getQuickAssessmentQuestions() {
    return [
      // E/I Questions (5)
      Question(
        id: 1,
        text: '파티나 모임에서 많은 사람들과\n어울리는 것이 즐겁다',
        dimension: QuestionDimension.ei,
        options: [
          QuestionOption(text: '전혀 그렇지 않다', score: -2.0, value: 1),
          QuestionOption(text: '그렇지 않다', score: -1.0, value: 2),
          QuestionOption(text: '보통이다', score: 0.0, value: 3),
          QuestionOption(text: '그렇다', score: 1.0, value: 4),
          QuestionOption(text: '매우 그렇다', score: 2.0, value: 5),
        ],
      ),
      Question(
        id: 2,
        text: '문제가 생겼을 때 다른 사람들과\n토론하며 해결책을 찾는 편이다',
        dimension: QuestionDimension.ei,
        options: [
          QuestionOption(text: '전혀 그렇지 않다', score: -2.0, value: 1),
          QuestionOption(text: '그렇지 않다', score: -1.0, value: 2),
          QuestionOption(text: '보통이다', score: 0.0, value: 3),
          QuestionOption(text: '그렇다', score: 1.0, value: 4),
          QuestionOption(text: '매우 그렇다', score: 2.0, value: 5),
        ],
      ),
      Question(
        id: 3,
        text: '새로운 환경에서 적극적으로\n다른 사람들에게 다가간다',
        dimension: QuestionDimension.ei,
        options: [
          QuestionOption(text: '전혀 그렇지 않다', score: -2.0, value: 1),
          QuestionOption(text: '그렇지 않다', score: -1.0, value: 2),
          QuestionOption(text: '보통이다', score: 0.0, value: 3),
          QuestionOption(text: '그렇다', score: 1.0, value: 4),
          QuestionOption(text: '매우 그렇다', score: 2.0, value: 5),
        ],
      ),
      Question(
        id: 4,
        text: '전화로 이야기하는 것을\n문자나 이메일보다 선호한다',
        dimension: QuestionDimension.ei,
        options: [
          QuestionOption(text: '전혀 그렇지 않다', score: -2.0, value: 1),
          QuestionOption(text: '그렇지 않다', score: -1.0, value: 2),
          QuestionOption(text: '보통이다', score: 0.0, value: 3),
          QuestionOption(text: '그렇다', score: 1.0, value: 4),
          QuestionOption(text: '매우 그렇다', score: 2.0, value: 5),
        ],
      ),
      Question(
        id: 5,
        text: '스트레스를 받을 때 친구들과\n만나서 이야기하는 것이\n도움이 된다',
        dimension: QuestionDimension.ei,
        options: [
          QuestionOption(text: '전혀 그렇지 않다', score: -2.0, value: 1),
          QuestionOption(text: '그렇지 않다', score: -1.0, value: 2),
          QuestionOption(text: '보통이다', score: 0.0, value: 3),
          QuestionOption(text: '그렇다', score: 1.0, value: 4),
          QuestionOption(text: '매우 그렇다', score: 2.0, value: 5),
        ],
      ),

      // S/N Questions (5)
      Question(
        id: 6,
        text: '구체적이고 세부적인\n정보를 선호한다',
        dimension: QuestionDimension.sn,
        options: [
          QuestionOption(text: '전혀 그렇지 않다', score: -2.0, value: 1),
          QuestionOption(text: '그렇지 않다', score: -1.0, value: 2),
          QuestionOption(text: '보통이다', score: 0.0, value: 3),
          QuestionOption(text: '그렇다', score: 1.0, value: 4),
          QuestionOption(text: '매우 그렇다', score: 2.0, value: 5),
        ],
      ),
      Question(
        id: 7,
        text: '일을 계획할 때 단계별로\n세부적인 계획을 세우는 편이다',
        dimension: QuestionDimension.sn,
        options: [
          QuestionOption(text: '전혀 그렇지 않다', score: -2.0, value: 1),
          QuestionOption(text: '그렇지 않다', score: -1.0, value: 2),
          QuestionOption(text: '보통이다', score: 0.0, value: 3),
          QuestionOption(text: '그렇다', score: 1.0, value: 4),
          QuestionOption(text: '매우 그렇다', score: 2.0, value: 5),
        ],
      ),
      Question(
        id: 8,
        text: '새로운 아이디어를 들으면\n가능성과 잠재력에\n더 흥미를 느낀다',
        dimension: QuestionDimension.sn,
        isReversed: true,
        options: [
          QuestionOption(text: '전혀 그렇지 않다', score: 2.0, value: 1),
          QuestionOption(text: '그렇지 않다', score: 1.0, value: 2),
          QuestionOption(text: '보통이다', score: 0.0, value: 3),
          QuestionOption(text: '그렇다', score: -1.0, value: 4),
          QuestionOption(text: '매우 그렇다', score: -2.0, value: 5),
        ],
      ),
      Question(
        id: 9,
        text: '과거의 경험과 현재의 현실에\n더 집중하는 편이다',
        dimension: QuestionDimension.sn,
        options: [
          QuestionOption(text: '전혀 그렇지 않다', score: -2.0, value: 1),
          QuestionOption(text: '그렇지 않다', score: -1.0, value: 2),
          QuestionOption(text: '보통이다', score: 0.0, value: 3),
          QuestionOption(text: '그렇다', score: 1.0, value: 4),
          QuestionOption(text: '매우 그렇다', score: 2.0, value: 5),
        ],
      ),
      Question(
        id: 10,
        text: '실습과 경험을 통한\n학습을 선호한다',
        dimension: QuestionDimension.sn,
        options: [
          QuestionOption(text: '전혀 그렇지 않다', score: -2.0, value: 1),
          QuestionOption(text: '그렇지 않다', score: -1.0, value: 2),
          QuestionOption(text: '보통이다', score: 0.0, value: 3),
          QuestionOption(text: '그렇다', score: 1.0, value: 4),
          QuestionOption(text: '매우 그렇다', score: 2.0, value: 5),
        ],
      ),

      // T/F Questions (5)
      Question(
        id: 11,
        text: '결정을 내릴 때\n논리적 분석과 객관적 사실을\n더 중요하게 생각한다',
        dimension: QuestionDimension.tf,
        options: [
          QuestionOption(text: '전혀 그렇지 않다', score: -2.0, value: 1),
          QuestionOption(text: '그렇지 않다', score: -1.0, value: 2),
          QuestionOption(text: '보통이다', score: 0.0, value: 3),
          QuestionOption(text: '그렇다', score: 1.0, value: 4),
          QuestionOption(text: '매우 그렇다', score: 2.0, value: 5),
        ],
      ),
      Question(
        id: 12,
        text: '갈등 상황에서 원칙과 규칙에\n따라 해결하려고 한다',
        dimension: QuestionDimension.tf,
        options: [
          QuestionOption(text: '전혀 그렇지 않다', score: -2.0, value: 1),
          QuestionOption(text: '그렇지 않다', score: -1.0, value: 2),
          QuestionOption(text: '보통이다', score: 0.0, value: 3),
          QuestionOption(text: '그렇다', score: 1.0, value: 4),
          QuestionOption(text: '매우 그렇다', score: 2.0, value: 5),
        ],
      ),
      Question(
        id: 13,
        text: '비판을 받을 때 논리적으로\n맞는지를 먼저 분석한다',
        dimension: QuestionDimension.tf,
        options: [
          QuestionOption(text: '전혀 그렇지 않다', score: -2.0, value: 1),
          QuestionOption(text: '그렇지 않다', score: -1.0, value: 2),
          QuestionOption(text: '보통이다', score: 0.0, value: 3),
          QuestionOption(text: '그렇다', score: 1.0, value: 4),
          QuestionOption(text: '매우 그렇다', score: 2.0, value: 5),
        ],
      ),
      Question(
        id: 14,
        text: '다른 사람을 평가할 때 능력과\n성과를 더 중요하게 본다',
        dimension: QuestionDimension.tf,
        options: [
          QuestionOption(text: '전혀 그렇지 않다', score: -2.0, value: 1),
          QuestionOption(text: '그렇지 않다', score: -1.0, value: 2),
          QuestionOption(text: '보통이다', score: 0.0, value: 3),
          QuestionOption(text: '그렇다', score: 1.0, value: 4),
          QuestionOption(text: '매우 그렇다', score: 2.0, value: 5),
        ],
      ),
      Question(
        id: 15,
        text: '팀 프로젝트에서 효율성을 높이고\n목표 달성에 집중한다',
        dimension: QuestionDimension.tf,
        options: [
          QuestionOption(text: '전혀 그렇지 않다', score: -2.0, value: 1),
          QuestionOption(text: '그렇지 않다', score: -1.0, value: 2),
          QuestionOption(text: '보통이다', score: 0.0, value: 3),
          QuestionOption(text: '그렇다', score: 1.0, value: 4),
          QuestionOption(text: '매우 그렇다', score: 2.0, value: 5),
        ],
      ),

      // J/P Questions (5)
      Question(
        id: 16,
        text: '여행을 계획할 때 미리 세세한\n일정을 계획하는 편이다',
        dimension: QuestionDimension.jp,
        options: [
          QuestionOption(text: '전혀 그렇지 않다', score: -2.0, value: 1),
          QuestionOption(text: '그렇지 않다', score: -1.0, value: 2),
          QuestionOption(text: '보통이다', score: 0.0, value: 3),
          QuestionOption(text: '그렇다', score: 1.0, value: 4),
          QuestionOption(text: '매우 그렇다', score: 2.0, value: 5),
        ],
      ),
      Question(
        id: 17,
        text: '데드라인이 있는 일은 미리 미리\n준비해서 여유있게 마무리한다',
        dimension: QuestionDimension.jp,
        options: [
          QuestionOption(text: '전혀 그렇지 않다', score: -2.0, value: 1),
          QuestionOption(text: '그렇지 않다', score: -1.0, value: 2),
          QuestionOption(text: '보통이다', score: 0.0, value: 3),
          QuestionOption(text: '그렇다', score: 1.0, value: 4),
          QuestionOption(text: '매우 그렇다', score: 2.0, value: 5),
        ],
      ),
      Question(
        id: 18,
        text: '예측 가능하고\n안정적인 환경을 선호한다',
        dimension: QuestionDimension.jp,
        options: [
          QuestionOption(text: '전혀 그렇지 않다', score: -2.0, value: 1),
          QuestionOption(text: '그렇지 않다', score: -1.0, value: 2),
          QuestionOption(text: '보통이다', score: 0.0, value: 3),
          QuestionOption(text: '그렇다', score: 1.0, value: 4),
          QuestionOption(text: '매우 그렇다', score: 2.0, value: 5),
        ],
      ),
      Question(
        id: 19,
        text: '일상생활에서 규칙적이고\n체계적으로 생활한다',
        dimension: QuestionDimension.jp,
        options: [
          QuestionOption(text: '전혀 그렇지 않다', score: -2.0, value: 1),
          QuestionOption(text: '그렇지 않다', score: -1.0, value: 2),
          QuestionOption(text: '보통이다', score: 0.0, value: 3),
          QuestionOption(text: '그렇다', score: 1.0, value: 4),
          QuestionOption(text: '매우 그렇다', score: 2.0, value: 5),
        ],
      ),
      Question(
        id: 20,
        text: '새로운 기회가 왔을 때\n신중하게 검토한 후 결정한다',
        dimension: QuestionDimension.jp,
        options: [
          QuestionOption(text: '전혀 그렇지 않다', score: -2.0, value: 1),
          QuestionOption(text: '그렇지 않다', score: -1.0, value: 2),
          QuestionOption(text: '보통이다', score: 0.0, value: 3),
          QuestionOption(text: '그렇다', score: 1.0, value: 4),
          QuestionOption(text: '매우 그렇다', score: 2.0, value: 5),
        ],
      ),
    ];
  }
}
