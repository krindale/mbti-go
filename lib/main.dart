import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/home/presentation/pages/home_page.dart';

/// MBTI Go 앱 진입점
/// Single Responsibility: 앱 초기화 및 테마 설정
void main() {
  runApp(const MBTIApp());
}

/// MBTI Go 메인 앱 위젯
/// Single Responsibility: 앱 전역 설정 및 라우팅
class MBTIApp extends StatelessWidget {
  const MBTIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MBTI Go',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      home: const MBTIHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
