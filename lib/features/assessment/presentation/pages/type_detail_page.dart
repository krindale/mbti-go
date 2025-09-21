import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/animations/app_animations.dart';
import '../../domain/entities/mbti_type.dart';
import '../widgets/type_detail_animated_header_widget.dart';
import '../widgets/type_detail_main_card_widget.dart';
import '../widgets/type_detail_description_card_widget.dart';
import '../widgets/type_detail_strengths_weaknesses_widget.dart';
import '../widgets/type_detail_career_suggestions_widget.dart';
import '../widgets/type_detail_detailed_story_widget.dart';
import '../widgets/type_detail_compatibility_section_widget.dart';
import '../widgets/type_detail_action_buttons_widget.dart';

/// MBTI 타입 상세 페이지
/// Single Responsibility: 타입 상세 정보 표시와 네비게이션 관리
class TypeDetailPage extends StatefulWidget {
  final MBTIType type;

  const TypeDetailPage({super.key, required this.type});

  @override
  State<TypeDetailPage> createState() => _TypeDetailPageState();
}

/// MBTI 타입 상세 페이지 상태 관리
/// Single Responsibility: 애니메이션과 네비게이션 관리
class _TypeDetailPageState extends State<TypeDetailPage>
    with TickerProviderStateMixin {
  late AnimationController _headerAnimationController;
  late AnimationController _contentAnimationController;
  late Animation<double> _headerFadeAnimation;
  late Animation<Offset> _headerSlideAnimation;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _startAnimations();
  }

  /// 애니메이션 설정
  void _setupAnimations() {
    _headerAnimationController = AnimationController(
      duration: AnimationConstants.slow,
      vsync: this,
    );

    _contentAnimationController = AnimationController(
      duration: AnimationConstants.verySlow,
      vsync: this,
    );

    _headerFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _headerAnimationController,
        curve: AnimationConstants.fadeIn,
      ),
    );

    _headerSlideAnimation =
        Tween<Offset>(begin: const Offset(0, -0.3), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _headerAnimationController,
            curve: AnimationConstants.slideUp,
          ),
        );
  }

  /// 애니메이션 시작
  void _startAnimations() {
    _headerAnimationController.forward();
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) {
        _contentAnimationController.forward();
      }
    });
  }

  @override
  void dispose() {
    _headerAnimationController.dispose();
    _contentAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.grey10,
        child: SafeArea(
          child: Column(
            children: [
              TypeDetailAnimatedHeaderWidget(
                type: widget.type,
                fadeAnimation: _headerFadeAnimation,
                slideAnimation: _headerSlideAnimation,
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TypeDetailMainCardWidget(type: widget.type),
                      TypeDetailDescriptionCardWidget(type: widget.type),
                      TypeDetailStrengthsWeaknessesWidget(type: widget.type),
                      TypeDetailCareerSuggestionsWidget(type: widget.type),
                      TypeDetailDetailedStoryWidget(type: widget.type),
                      TypeDetailCompatibilitySectionWidget(type: widget.type),
                      TypeDetailActionButtonsWidget(type: widget.type),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
