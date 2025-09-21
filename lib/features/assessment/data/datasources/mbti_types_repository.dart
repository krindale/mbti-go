import '../../domain/entities/mbti_type.dart';
import '../services/mbti_localization_service.dart';

/// MBTI 타입 데이터를 관리하는 저장소
/// Single Responsibility: 16가지 MBTI 타입의 정보만 관리
class MBTITypesRepository {
  final MBTILocalizationService localizationService;

  const MBTITypesRepository(this.localizationService);
  List<MBTIType> getAllTypes() {
    return MBTILocalizationService.getAllMBTICodes()
        .map((code) => localizationService.getLocalizedMBTIType(code))
        .toList();
  }

  MBTIType? getTypeByCode(String code) {
    try {
      return getAllTypes().firstWhere((type) => type.code == code);
    } catch (e) {
      return null;
    }
  }

  List<MBTIType> getTypesByCategory(String category) {
    return getAllTypes().where((type) => type.category == category).toList();
  }

  /// 분석가 그룹 (NT) 타입들 반환
  List<MBTIType> getAnalysts() {
    return getTypesByCategory('NT');
  }

  /// 외교관 그룹 (NF) 타입들 반환
  List<MBTIType> getDiplomats() {
    return getTypesByCategory('NF');
  }

  /// 관리자 그룹 (SJ) 타입들 반환
  List<MBTIType> getSentinels() {
    return getTypesByCategory('SJ');
  }

  /// 탐험가 그룹 (SP) 타입들 반환
  List<MBTIType> getExplorers() {
    return getTypesByCategory('SP');
  }
}
