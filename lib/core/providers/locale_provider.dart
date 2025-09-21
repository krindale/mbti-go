import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 언어 설정 관리 Provider
/// Single Responsibility: 앱의 언어 설정 상태 관리
class LocaleProvider extends ChangeNotifier {
  static const String _localeKey = 'selected_locale';

  Locale _locale = const Locale('en'); // 기본값: 영어 (시스템 로케일로 자동 설정됨)

  Locale get locale => _locale;

  /// 지원하는 언어 목록
  static const List<Locale> supportedLocales = [
    Locale('ko'), // 한국어
    Locale('en'), // 영어
  ];

  /// SharedPreferences에서 저장된 언어 설정 로드
  /// 저장된 설정이 없으면 시스템 로케일 기반으로 자동 설정
  Future<void> loadLocale() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final languageCode = prefs.getString(_localeKey);

      if (languageCode != null) {
        // 저장된 언어 설정이 있으면 사용
        final savedLocale = Locale(languageCode);
        if (supportedLocales.contains(savedLocale)) {
          _locale = savedLocale;
          notifyListeners();
          return;
        }
      }

      // 저장된 설정이 없으면 시스템 로케일 기반으로 자동 설정
      _setLocaleFromSystem();
    } catch (e) {
      // 로드 실패 시 시스템 로케일 기반으로 설정
      debugPrint('Failed to load locale: $e');
      _setLocaleFromSystem();
    }
  }

  /// 시스템 로케일을 기반으로 언어 설정
  void _setLocaleFromSystem() {
    try {
      final systemLocales = WidgetsBinding.instance.platformDispatcher.locales;

      for (final systemLocale in systemLocales) {
        // 한국어가 시스템 언어 중 하나인지 확인
        if (systemLocale.languageCode == 'ko') {
          _locale = const Locale('ko');
          notifyListeners();
          return;
        }
      }

      // 한국어가 없으면 영어로 설정
      _locale = const Locale('en');
      notifyListeners();
    } catch (e) {
      // 오류 시 기본값 영어로 설정
      debugPrint('Failed to detect system locale: $e');
      _locale = const Locale('en');
      notifyListeners();
    }
  }

  /// 언어 변경 및 저장
  Future<void> setLocale(Locale locale) async {
    if (!supportedLocales.contains(locale)) {
      return;
    }

    _locale = locale;
    notifyListeners();

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_localeKey, locale.languageCode);
    } catch (e) {
      debugPrint('Failed to save locale: $e');
    }
  }

  /// 언어 토글 (한국어 ↔ 영어)
  Future<void> toggleLocale() async {
    final newLocale = _locale.languageCode == 'ko'
        ? const Locale('en')
        : const Locale('ko');
    await setLocale(newLocale);
  }

  /// 현재 언어가 한국어인지 확인
  bool get isKorean => _locale.languageCode == 'ko';

  /// 현재 언어가 영어인지 확인
  bool get isEnglish => _locale.languageCode == 'en';
}