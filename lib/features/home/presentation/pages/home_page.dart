import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/animations/app_animations.dart';
import '../../../../core/animations/page_transitions.dart';
import '../../../assessment/presentation/pages/type_detail_page.dart';
import '../../../assessment/data/datasources/mbti_data.dart';
import '../../data/models/mbti_type_model.dart';
import '../widgets/animated_home_header.dart';
import '../widgets/mbti_grid_widget.dart';
import '../widgets/mbti_detail_dialog.dart';
import '../widgets/assessment_fab_widget.dart';

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
    _setupAnimations();
  }

  void _setupAnimations() {
    _headerAnimationController = AnimationController(
      duration: AppAnimations.slow,
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
            curve: AppAnimations.slideUp,
          ),
        );

    // Start header animation
    _headerAnimationController.forward();
  }

  @override
  void dispose() {
    _headerAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey10,
      body: SafeArea(
        top: true,
        bottom: false,
        child: Column(
          children: [
            AnimatedHomeHeader(
              fadeAnimation: _headerFadeAnimation,
              slideAnimation: _headerSlideAnimation,
            ),
            Expanded(
              child: MBTIGridWidget(onTypeSelected: _handleTypeSelected),
            ),
          ],
        ),
      ),
      floatingActionButton: const AssessmentFABWidget(),
    );
  }

  /// MBTI 타입 선택 처리
  void _handleTypeSelected(MBTITypeModel mbtiType) {
    MBTIDetailDialog.show(
      context: context,
      mbtiType: mbtiType,
      onDetailPressed: () => _navigateToDetailPage(mbtiType.type),
    );
  }

  /// 타입 상세 페이지로 이동
  void _navigateToDetailPage(String typeCode) {
    final mbtiType = MBTIData.getTypeByCode(typeCode);
    if (mbtiType != null) {
      Navigator.of(context).push(
        PageTransitions.slideRightWithBackground(
          TypeDetailPage(type: mbtiType),
        ),
      );
    }
  }
}
