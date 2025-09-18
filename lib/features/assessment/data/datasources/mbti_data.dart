import '../../domain/entities/mbti_type.dart';
import '../../domain/entities/question.dart';
import 'mbti_types_repository.dart';
import 'mbti_questions_repository.dart';

/// MBTI 데이터에 대한 통합 접근점을 제공하는 파사드 클래스
/// Single Responsibility: 분리된 저장소들에 대한 단일 진입점 제공
class MBTIData {
  // MBTI 타입 관련 메서드들 - MBTITypesRepository로 위임
  static List<MBTIType> getAllTypes() {
    return MBTITypesRepository.getAllTypes();
  }

  static MBTIType? getTypeByCode(String code) {
    return MBTITypesRepository.getTypeByCode(code);
  }

  static List<MBTIType> getTypesByCategory(String category) {
    return MBTITypesRepository.getTypesByCategory(category);
  }

  static List<MBTIType> getAnalysts() {
    return MBTITypesRepository.getAnalysts();
  }

  static List<MBTIType> getDiplomats() {
    return MBTITypesRepository.getDiplomats();
  }

  static List<MBTIType> getSentinels() {
    return MBTITypesRepository.getSentinels();
  }

  static List<MBTIType> getExplorers() {
    return MBTITypesRepository.getExplorers();
  }

  // MBTI 질문 관련 메서드들 - MBTIQuestionsRepository로 위임
  static List<Question> getQuestions() {
    return MBTIQuestionsRepository.getQuestions();
  }

  static List<Question> getExtraversionIntroversionQuestions() {
    return MBTIQuestionsRepository.getExtraversionIntroversionQuestions();
  }

  static List<Question> getSensingIntuitionQuestions() {
    return MBTIQuestionsRepository.getSensingIntuitionQuestions();
  }

  static List<Question> getThinkingFeelingQuestions() {
    return MBTIQuestionsRepository.getThinkingFeelingQuestions();
  }

  static List<Question> getJudgingPerceivingQuestions() {
    return MBTIQuestionsRepository.getJudgingPerceivingQuestions();
  }

  static List<Question> getQuestionsByDimension(QuestionDimension dimension) {
    return MBTIQuestionsRepository.getQuestionsByDimension(dimension);
  }

  static int getQuestionCount() {
    return MBTIQuestionsRepository.getQuestionCount();
  }

  static Map<QuestionDimension, int> getQuestionCountByDimension() {
    return MBTIQuestionsRepository.getQuestionCountByDimension();
  }
}
