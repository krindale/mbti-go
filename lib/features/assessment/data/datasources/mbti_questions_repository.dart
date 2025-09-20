import '../../domain/entities/question.dart';

/// MBTI 검사 질문 데이터를 관리하는 저장소
/// Single Responsibility: 5지선다형 MBTI 검사 질문만 관리
class MBTIQuestionsRepository {
  static List<Question> getQuestions() {
    return [
      // E/I Questions (5)
      Question(
        id: 1,
        text: '파티나 모임에서 많은 사람들과 어울리는 것이 즐겁다',
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
        text: '문제가 생겼을 때 다른 사람들과 토론하며 해결책을 찾는 편이다',
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
        text: '새로운 환경에서 적극적으로 다른 사람들에게 다가간다',
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
        text: '전화로 이야기하는 것을 문자나 이메일보다 선호한다',
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
        text: '스트레스를 받을 때 친구들과 만나서 이야기하는 것이 도움이 된다',
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
        text: '세부 사항보다는 전체적인 그림을 보는 것을 좋아한다',
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
        text: '아이디어와 이론에 대해 토론하는 것을 즐긴다',
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
        text: '현실적이고 실용적인 해결책을 선호한다',
        dimension: QuestionDimension.sn,
        isReversed: true,
        options: [
          QuestionOption(text: '완전히 A', score: -2.0, value: 1),
          QuestionOption(text: '대체로 A', score: -1.0, value: 2),
          QuestionOption(text: '중간', score: 0.0, value: 3),
          QuestionOption(text: '대체로 B', score: 1.0, value: 4),
          QuestionOption(text: '완전히 B', score: 2.0, value: 5),
        ],
      ),
      Question(
        id: 9,
        text: '미래의 가능성에 대해 생각하는 것을 좋아한다',
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
        text: '새로운 방법보다는 검증된 방법을 선택한다',
        dimension: QuestionDimension.sn,
        isReversed: true,
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
        text: '결정을 내릴 때 논리적 분석을 우선시한다',
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
        text: '다른 사람의 감정을 쉽게 이해하고 공감한다',
        dimension: QuestionDimension.tf,
        isReversed: true,
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
        text: '비판을 받을 때 객관적으로 분석하려고 노력한다',
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
        text: '조화로운 관계를 유지하는 것이 중요하다',
        dimension: QuestionDimension.tf,
        isReversed: true,
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
        text: '효율성과 성과를 중시한다',
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
        text: '계획을 세우고 그에 따라 행동하는 것을 선호한다',
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
        text: '마감일이 다가와야 집중력이 높아진다',
        dimension: QuestionDimension.jp,
        isReversed: true,
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
        text: '갑작스러운 변화에 잘 적응한다',
        dimension: QuestionDimension.jp,
        isReversed: true,
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
        text: '일정한 루틴을 따르는 것을 선호한다',
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
        text: '결정을 내리기 전에 모든 옵션을 열어두는 것을 좋아한다',
        dimension: QuestionDimension.jp,
        isReversed: true,
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

  /// E/I 차원의 질문들만 반환
  static List<Question> getExtraversionIntroversionQuestions() {
    return getQuestions()
        .where((q) => q.dimension == QuestionDimension.ei)
        .toList();
  }

  /// S/N 차원의 질문들만 반환
  static List<Question> getSensingIntuitionQuestions() {
    return getQuestions()
        .where((q) => q.dimension == QuestionDimension.sn)
        .toList();
  }

  /// T/F 차원의 질문들만 반환
  static List<Question> getThinkingFeelingQuestions() {
    return getQuestions()
        .where((q) => q.dimension == QuestionDimension.tf)
        .toList();
  }

  /// J/P 차원의 질문들만 반환
  static List<Question> getJudgingPerceivingQuestions() {
    return getQuestions()
        .where((q) => q.dimension == QuestionDimension.jp)
        .toList();
  }

  /// 특정 차원의 질문들 반환
  static List<Question> getQuestionsByDimension(QuestionDimension dimension) {
    return getQuestions().where((q) => q.dimension == dimension).toList();
  }

  /// 질문 총 개수 반환
  static int getQuestionCount() {
    return getQuestions().length;
  }

  /// 각 차원별 질문 개수 반환
  static Map<QuestionDimension, int> getQuestionCountByDimension() {
    final questions = getQuestions();
    return {
      QuestionDimension.ei: questions
          .where((q) => q.dimension == QuestionDimension.ei)
          .length,
      QuestionDimension.sn: questions
          .where((q) => q.dimension == QuestionDimension.sn)
          .length,
      QuestionDimension.tf: questions
          .where((q) => q.dimension == QuestionDimension.tf)
          .length,
      QuestionDimension.jp: questions
          .where((q) => q.dimension == QuestionDimension.jp)
          .length,
    };
  }
}
