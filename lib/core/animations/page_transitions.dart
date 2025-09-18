import 'package:flutter/material.dart';

class SlidePageRoute<T> extends PageRouteBuilder<T> {
  final Widget child;
  final Duration duration;
  final Offset beginOffset;
  final bool includeFade;

  SlidePageRoute({
    required this.child,
    this.duration = const Duration(milliseconds: 300),
    this.beginOffset = const Offset(1.0, 0.0), // 기본값: 오른쪽에서 왼쪽으로
    this.includeFade = true,
  }) : super(
         pageBuilder: (context, animation, secondaryAnimation) => child,
         transitionDuration: duration,
         reverseTransitionDuration: duration,
         transitionsBuilder: (context, animation, secondaryAnimation, child) {
           const end = Offset.zero;
           const curve = Curves.easeInOut;

           var slideTween = Tween(
             begin: beginOffset,
             end: end,
           ).chain(CurveTween(curve: curve));

           if (includeFade) {
             var fadeTween = Tween(
               begin: 0.0,
               end: 1.0,
             ).chain(CurveTween(curve: curve));

             return SlideTransition(
               position: animation.drive(slideTween),
               child: FadeTransition(
                 opacity: animation.drive(fadeTween),
                 child: child,
               ),
             );
           } else {
             return SlideTransition(
               position: animation.drive(slideTween),
               child: child,
             );
           }
         },
       );
}

class SlidePageRouteWithBackground<T> extends PageRouteBuilder<T> {
  final Widget child;
  final Duration duration;
  final Offset beginOffset;
  final Offset backgroundEndOffset;

  SlidePageRouteWithBackground({
    required this.child,
    this.duration = const Duration(milliseconds: 300),
    this.beginOffset = const Offset(1.0, 0.0),
    this.backgroundEndOffset = const Offset(-0.3, 0.0),
  }) : super(
         pageBuilder: (context, animation, secondaryAnimation) => child,
         transitionDuration: duration,
         reverseTransitionDuration: duration,
         transitionsBuilder: (context, animation, secondaryAnimation, child) {
           const end = Offset.zero;
           const curve = Curves.easeInOut;

           var slideTween = Tween(
             begin: beginOffset,
             end: end,
           ).chain(CurveTween(curve: curve));

           // 기존 페이지가 왼쪽으로 약간 밀려나는 효과
           const secondaryBegin = Offset.zero;

           var secondarySlideTween = Tween(
             begin: secondaryBegin,
             end: backgroundEndOffset,
           ).chain(CurveTween(curve: curve));

           // 페이드 효과
           var fadeTween = Tween(
             begin: 0.0,
             end: 1.0,
           ).chain(CurveTween(curve: curve));

           return Stack(
             children: [
               // 기존 페이지 (배경)
               SlideTransition(
                 position: secondaryAnimation.drive(secondarySlideTween),
                 child: Container(), // 빈 컨테이너로 배경 효과
               ),
               // 새 페이지
               SlideTransition(
                 position: animation.drive(slideTween),
                 child: FadeTransition(
                   opacity: animation.drive(fadeTween),
                   child: child,
                 ),
               ),
             ],
           );
         },
       );
}

// 페이지 전환 유틸리티 클래스
class PageTransitions {
  // 오른쪽에서 왼쪽으로 슬라이드 (기본)
  static Route<T> slideRight<T>(Widget page) {
    return SlidePageRoute<T>(child: page);
  }

  // 왼쪽에서 오른쪽으로 슬라이드
  static Route<T> slideLeft<T>(Widget page) {
    return SlidePageRoute<T>(child: page, beginOffset: const Offset(-1.0, 0.0));
  }

  // 아래에서 위로 슬라이드
  static Route<T> slideUp<T>(Widget page) {
    return SlidePageRoute<T>(child: page, beginOffset: const Offset(0.0, 1.0));
  }

  // 위에서 아래로 슬라이드
  static Route<T> slideDown<T>(Widget page) {
    return SlidePageRoute<T>(child: page, beginOffset: const Offset(0.0, -1.0));
  }

  // 배경 효과와 함께 슬라이드 (더 세련된 효과)
  static Route<T> slideRightWithBackground<T>(Widget page) {
    return SlidePageRouteWithBackground<T>(child: page);
  }

  // 페이드만
  static Route<T> fade<T>(Widget page) {
    return PageRouteBuilder<T>(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }
}
