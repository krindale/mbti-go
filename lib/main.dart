import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'core/theme/app_theme.dart';
import 'core/providers/locale_provider.dart';
import 'features/home/presentation/pages/home_page.dart';
import 'l10n/app_localizations.dart';

/// MBTI Go 앱 진입점
/// Single Responsibility: 앱 초기화 및 테마 설정
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 언어 설정 로드
  final localeProvider = LocaleProvider();
  await localeProvider.loadLocale();

  runApp(MBTIApp(localeProvider: localeProvider));
}

/// MBTI Go 메인 앱 위젯
/// Single Responsibility: 앱 전역 설정 및 라우팅
class MBTIApp extends StatelessWidget {
  final LocaleProvider localeProvider;

  const MBTIApp({
    super.key,
    required this.localeProvider,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: localeProvider,
      child: Consumer<LocaleProvider>(
        builder: (context, localeProvider, child) {
          return MaterialApp(
            title: 'MBTI Go',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: ThemeMode.light,
            locale: localeProvider.locale,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: LocaleProvider.supportedLocales,
            home: const MBTIHomePage(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
