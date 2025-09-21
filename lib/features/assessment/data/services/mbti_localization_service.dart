import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/mbti_type.dart';
import '../../../../core/theme/app_colors.dart';

/// MBTI 타입의 현지화된 데이터를 제공하는 서비스
/// Single Responsibility: MBTI 데이터의 다국어 지원만 담당
class MBTILocalizationService {
  final AppLocalizations l10n;

  const MBTILocalizationService(this.l10n);

  /// MBTI 코드를 기반으로 현지화된 MBTIType 생성
  MBTIType getLocalizedMBTIType(String code) {
    final lowerCode = code.toLowerCase();

    return MBTIType(
      code: code,
      name: _getLocalizedName(lowerCode),
      category: _getCategoryCode(code),
      description: _getLocalizedDescription(lowerCode),
      strengths: _getLocalizedStrengths(lowerCode),
      weaknesses: _getLocalizedWeaknesses(lowerCode),
      careers: _getLocalizedCareers(lowerCode),
      imagePath: 'assets/${code}_${_getEnglishName(lowerCode)}.jpg',
      primaryColor: AppColors.getMBTITypeColor(code),
      detailedDescription: _getLocalizedDetailedDescription(lowerCode),
    );
  }

  /// 현지화된 이름 가져오기
  String _getLocalizedName(String lowerCode) {
    switch (lowerCode) {
      case 'enfj': return l10n.enfj_name;
      case 'enfp': return l10n.enfp_name;
      case 'entj': return l10n.entj_name;
      case 'entp': return l10n.entp_name;
      case 'esfj': return l10n.esfj_name;
      case 'esfp': return l10n.esfp_name;
      case 'estj': return l10n.estj_name;
      case 'estp': return l10n.estp_name;
      case 'infj': return l10n.infj_name;
      case 'infp': return l10n.infp_name;
      case 'intj': return l10n.intj_name;
      case 'intp': return l10n.intp_name;
      case 'isfj': return l10n.isfj_name;
      case 'isfp': return l10n.isfp_name;
      case 'istj': return l10n.istj_name;
      case 'istp': return l10n.istp_name;
      default: return lowerCode.toUpperCase();
    }
  }

  /// 현지화된 설명 가져오기
  String _getLocalizedDescription(String lowerCode) {
    switch (lowerCode) {
      case 'enfj': return l10n.enfj_description;
      case 'enfp': return l10n.enfp_description;
      case 'entj': return l10n.entj_description;
      case 'entp': return l10n.entp_description;
      case 'esfj': return l10n.esfj_description;
      case 'esfp': return l10n.esfp_description;
      case 'estj': return l10n.estj_description;
      case 'estp': return l10n.estp_description;
      case 'infj': return l10n.infj_description;
      case 'infp': return l10n.infp_description;
      case 'intj': return l10n.intj_description;
      case 'intp': return l10n.intp_description;
      case 'isfj': return l10n.isfj_description;
      case 'isfp': return l10n.isfp_description;
      case 'istj': return l10n.istj_description;
      case 'istp': return l10n.istp_description;
      default: return '';
    }
  }

  /// 현지화된 상세 설명 가져오기
  String _getLocalizedDetailedDescription(String lowerCode) {
    switch (lowerCode) {
      case 'enfj': return l10n.enfj_detailed;
      case 'enfp': return l10n.enfp_detailed;
      case 'entj': return l10n.entj_detailed;
      case 'entp': return l10n.entp_detailed;
      case 'esfj': return l10n.esfj_detailed;
      case 'esfp': return l10n.esfp_detailed;
      case 'estj': return l10n.estj_detailed;
      case 'estp': return l10n.estp_detailed;
      case 'infj': return l10n.infj_detailed;
      case 'infp': return l10n.infp_detailed;
      case 'intj': return l10n.intj_detailed;
      case 'intp': return l10n.intp_detailed;
      case 'isfj': return l10n.isfj_detailed;
      case 'isfp': return l10n.isfp_detailed;
      case 'istj': return l10n.istj_detailed;
      case 'istp': return l10n.istp_detailed;
      default: return '';
    }
  }

  /// 현지화된 간략 설명 가져오기 (팝업용)
  String getLocalizedBriefDescription(String code) {
    final lowerCode = code.toLowerCase();
    switch (lowerCode) {
      case 'enfj': return l10n.enfj_brief;
      case 'enfp': return l10n.enfp_brief;
      case 'entj': return l10n.entj_brief;
      case 'entp': return l10n.entp_brief;
      case 'esfj': return l10n.esfj_brief;
      case 'esfp': return l10n.esfp_brief;
      case 'estj': return l10n.estj_brief;
      case 'estp': return l10n.estp_brief;
      case 'infj': return l10n.infj_brief;
      case 'infp': return l10n.infp_brief;
      case 'intj': return l10n.intj_brief;
      case 'intp': return l10n.intp_brief;
      case 'isfj': return l10n.isfj_brief;
      case 'isfp': return l10n.isfp_brief;
      case 'istj': return l10n.istj_brief;
      case 'istp': return l10n.istp_brief;
      default: return '';
    }
  }

  /// 영어 이름 가져오기 (에셋 경로용)
  String _getEnglishName(String lowerCode) {
    switch (lowerCode) {
      case 'enfj': return 'Protagonist';
      case 'enfp': return 'Campaigner';
      case 'entj': return 'Commander';
      case 'entp': return 'Debater';
      case 'esfj': return 'Consul';
      case 'esfp': return 'Entertainer';
      case 'estj': return 'Executive';
      case 'estp': return 'Entrepreneur';
      case 'infj': return 'Advocate';
      case 'infp': return 'Mediator';
      case 'intj': return 'Architect';
      case 'intp': return 'Thinker';
      case 'isfj': return 'Protector';
      case 'isfp': return 'Adventurer';
      case 'istj': return 'Logistician';
      case 'istp': return 'Virtuoso';
      default: return '';
    }
  }

  /// 카테고리 코드 가져오기
  String _getCategoryCode(String code) {
    if (code.contains('NT')) return 'NT';
    if (code.contains('NF')) return 'NF';
    if (code.contains('SJ')) return 'SJ';
    if (code.contains('SP')) return 'SP';

    // MBTI 코드를 기반으로 카테고리 결정
    final type = code.substring(1, 3);
    switch (type) {
      case 'NT': return 'NT';
      case 'NF': return 'NF';
      case 'ST': case 'SF':
        return code.endsWith('J') ? 'SJ' : 'SP';
      default: return '';
    }
  }

  /// 현지화된 강점 목록
  List<String> _getLocalizedStrengths(String lowerCode) {
    String strengthsString;
    switch (lowerCode) {
      case 'intj': strengthsString = l10n.intj_strengths; break;
      case 'intp': strengthsString = l10n.intp_strengths; break;
      case 'entj': strengthsString = l10n.entj_strengths; break;
      case 'entp': strengthsString = l10n.entp_strengths; break;
      case 'infj': strengthsString = l10n.infj_strengths; break;
      case 'infp': strengthsString = l10n.infp_strengths; break;
      case 'enfj': strengthsString = l10n.enfj_strengths; break;
      case 'enfp': strengthsString = l10n.enfp_strengths; break;
      case 'istj': strengthsString = l10n.istj_strengths; break;
      case 'isfj': strengthsString = l10n.isfj_strengths; break;
      case 'estj': strengthsString = l10n.estj_strengths; break;
      case 'esfj': strengthsString = l10n.esfj_strengths; break;
      case 'istp': strengthsString = l10n.istp_strengths; break;
      case 'isfp': strengthsString = l10n.isfp_strengths; break;
      case 'estp': strengthsString = l10n.estp_strengths; break;
      case 'esfp': strengthsString = l10n.esfp_strengths; break;
      default: return [];
    }
    return strengthsString.split('|');
  }

  /// 현지화된 약점 목록
  List<String> _getLocalizedWeaknesses(String lowerCode) {
    String weaknessesString;
    switch (lowerCode) {
      case 'intj': weaknessesString = l10n.intj_weaknesses; break;
      case 'intp': weaknessesString = l10n.intp_weaknesses; break;
      case 'entj': weaknessesString = l10n.entj_weaknesses; break;
      case 'entp': weaknessesString = l10n.entp_weaknesses; break;
      case 'infj': weaknessesString = l10n.infj_weaknesses; break;
      case 'infp': weaknessesString = l10n.infp_weaknesses; break;
      case 'enfj': weaknessesString = l10n.enfj_weaknesses; break;
      case 'enfp': weaknessesString = l10n.enfp_weaknesses; break;
      case 'istj': weaknessesString = l10n.istj_weaknesses; break;
      case 'isfj': weaknessesString = l10n.isfj_weaknesses; break;
      case 'estj': weaknessesString = l10n.estj_weaknesses; break;
      case 'esfj': weaknessesString = l10n.esfj_weaknesses; break;
      case 'istp': weaknessesString = l10n.istp_weaknesses; break;
      case 'isfp': weaknessesString = l10n.isfp_weaknesses; break;
      case 'estp': weaknessesString = l10n.estp_weaknesses; break;
      case 'esfp': weaknessesString = l10n.esfp_weaknesses; break;
      default: return [];
    }
    return weaknessesString.split('|');
  }

  /// 현지화된 직업 목록
  List<String> _getLocalizedCareers(String lowerCode) {
    String careersString;
    switch (lowerCode) {
      case 'intj': careersString = l10n.intj_careers; break;
      case 'intp': careersString = l10n.intp_careers; break;
      case 'entj': careersString = l10n.entj_careers; break;
      case 'entp': careersString = l10n.entp_careers; break;
      case 'infj': careersString = l10n.infj_careers; break;
      case 'infp': careersString = l10n.infp_careers; break;
      case 'enfj': careersString = l10n.enfj_careers; break;
      case 'enfp': careersString = l10n.enfp_careers; break;
      case 'istj': careersString = l10n.istj_careers; break;
      case 'isfj': careersString = l10n.isfj_careers; break;
      case 'estj': careersString = l10n.estj_careers; break;
      case 'esfj': careersString = l10n.esfj_careers; break;
      case 'istp': careersString = l10n.istp_careers; break;
      case 'isfp': careersString = l10n.isfp_careers; break;
      case 'estp': careersString = l10n.estp_careers; break;
      case 'esfp': careersString = l10n.esfp_careers; break;
      default: return [];
    }
    return careersString.split('|');
  }

  /// 현지화된 카테고리 이름 가져오기
  String getLocalizedCategoryName(String category) {
    switch (category) {
      case 'NT': return l10n.categoryAnalysts;
      case 'NF': return l10n.categoryDiplomats;
      case 'SJ': return l10n.categorySentinels;
      case 'SP': return l10n.categoryExplorers;
      default: return category;
    }
  }

  /// 모든 MBTI 타입의 현지화된 목록 반환
  static List<String> getAllMBTICodes() {
    return [
      'INTJ', 'INTP', 'ENTJ', 'ENTP', // Analysts (NT)
      'INFJ', 'INFP', 'ENFJ', 'ENFP', // Diplomats (NF)
      'ISTJ', 'ISFJ', 'ESTJ', 'ESFJ', // Sentinels (SJ)
      'ISTP', 'ISFP', 'ESTP', 'ESFP', // Explorers (SP)
    ];
  }
}