import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/animations/app_animations.dart';
import '../../../../core/animations/page_transitions.dart';
import '../../../assessment/presentation/pages/assessment_page.dart';
import '../../../assessment/presentation/pages/type_detail_page.dart';
import '../../../assessment/data/datasources/mbti_data.dart';
import '../widgets/mbti_type_grid.dart';
import '../widgets/home_header.dart';

/// MBTI 앱의 홈페이지
/// Single Responsibility: 홈페이지 레이아웃과 네비게이션 관리
class MBTIHomePage extends StatefulWidget {
  const MBTIHomePage({super.key});

  @override
  State<MBTIHomePage> createState() => _MBTIHomePageState();
}

class _MBTIHomePageState extends State<MBTIHomePage>
    with TickerProviderStateMixin {
  late AnimationController _headerAnimationController;
  late Animation<double> _headerFadeAnimation;
  late Animation<Offset> _headerSlideAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _startAnimations();
  }

  void _initializeAnimations() {
    _headerAnimationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _headerFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _headerAnimationController,
        curve: AppAnimations.fadeIn,
      ),
    );

    _headerSlideAnimation =
        Tween<Offset>(begin: const Offset(0, -0.5), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _headerAnimationController,
            curve: AppAnimations.slideIn,
          ),
        );
  }

  void _startAnimations() {
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) {
        _headerAnimationController.forward();
      }
    });
  }

  @override
  void dispose() {
    _headerAnimationController.dispose();
    super.dispose();
  }

  void _navigateToAssessment() {
    HapticFeedback.lightImpact();
    Navigator.of(
      context,
    ).push(PageTransitions.slideRight(const AssessmentPage()));
  }

  void _navigateToTypeDetail(String typeCode) {
    final mbtiType = MBTIData.getTypeByCode(typeCode);
    if (mbtiType != null) {
      HapticFeedback.lightImpact();
      Navigator.of(
        context,
      ).push(PageTransitions.slideRight(TypeDetailPage(type: mbtiType)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey10,
      body: SafeArea(
        child: Column(
          children: [
            // 애니메이션 헤더
            SlideTransition(
              position: _headerSlideAnimation,
              child: FadeTransition(
                opacity: _headerFadeAnimation,
                child: HomeHeader(onStartAssessment: _navigateToAssessment),
              ),
            ),

            // MBTI 타입 그리드
            Expanded(
              child: MBTITypeGrid(onTypeSelected: _navigateToTypeDetail),
            ),
          ],
        ),
      ),
    );
  }
}
