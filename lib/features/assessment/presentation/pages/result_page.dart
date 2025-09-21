import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/animations/app_animations.dart';
import '../../domain/entities/assessment_result.dart';
import '../widgets/result_animated_header_widget.dart';
import '../widgets/result_card_widget.dart';
import '../widgets/result_score_breakdown_widget.dart';
import '../widgets/result_strengths_weaknesses_widget.dart';
import '../widgets/result_career_suggestions_widget.dart';
import '../widgets/result_detailed_description_widget.dart';
import '../widgets/result_action_buttons_widget.dart';

class ResultPage extends StatefulWidget {
  final AssessmentResult result;

  const ResultPage({super.key, required this.result});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> with TickerProviderStateMixin {
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

  void _startAnimations() {
    _headerAnimationController.forward();
    Future.delayed(const Duration(milliseconds: 500), () {
      _contentAnimationController.forward();
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
              ResultAnimatedHeaderWidget(
                fadeAnimation: _headerFadeAnimation,
                slideAnimation: _headerSlideAnimation,
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ResultCardWidget(result: widget.result),
                      ResultScoreBreakdownWidget(result: widget.result),
                      ResultStrengthsWeaknessesWidget(result: widget.result),
                      ResultCareerSuggestionsWidget(result: widget.result),
                      ResultDetailedDescriptionWidget(result: widget.result),
                      const ResultActionButtonsWidget(),
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
