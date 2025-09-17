import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/app_colors.dart';
import 'core/theme/app_text_styles.dart';
import 'core/animations/app_animations.dart';
import 'features/assessment/presentation/pages/assessment_page.dart';

void main() {
  runApp(const MBTIApp());
}

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

  final List<Map<String, String>> mbtiTypes = [
    {'type': 'ENFJ', 'name': 'Protagonist', 'image': 'assets/ENFJ_Protagonist.jpg', 'category': 'NF'},
    {'type': 'ENFP', 'name': 'Campaigner', 'image': 'assets/ENFP_Campaigner.jpg', 'category': 'NF'},
    {'type': 'ENTJ', 'name': 'Commander', 'image': 'assets/ENTJ_Commander.jpg', 'category': 'NT'},
    {'type': 'ENTP', 'name': 'Debater', 'image': 'assets/ENTP_Debater.jpg', 'category': 'NT'},
    {'type': 'ESFJ', 'name': 'Consul', 'image': 'assets/ESFJ_Consul.jpg', 'category': 'SJ'},
    {'type': 'ESFP', 'name': 'Entertainer', 'image': 'assets/ESFP_Entertainer.jpg', 'category': 'SP'},
    {'type': 'ESTJ', 'name': 'Executive', 'image': 'assets/ESTJ_Executive.jpg', 'category': 'SJ'},
    {'type': 'ESTP', 'name': 'Entrepreneur', 'image': 'assets/ESTP_Entrepreneur.jpg', 'category': 'SP'},
    {'type': 'INFJ', 'name': 'Advocate', 'image': 'assets/INFJ_Advocate.jpg', 'category': 'NF'},
    {'type': 'INFP', 'name': 'Mediator', 'image': 'assets/INFP_Mediator.jpg', 'category': 'NF'},
    {'type': 'INTJ', 'name': 'Architect', 'image': 'assets/INTJ_Architect.jpg', 'category': 'NT'},
    {'type': 'INTP', 'name': 'Thinker', 'image': 'assets/INTP_Thinker.jpg', 'category': 'NT'},
    {'type': 'ISFJ', 'name': 'Protector', 'image': 'assets/ISFJ_Protector.jpg', 'category': 'SJ'},
    {'type': 'ISFP', 'name': 'Adventurer', 'image': 'assets/ISFP_Adventurer.jpg', 'category': 'SP'},
    {'type': 'ISTJ', 'name': 'Logistician', 'image': 'assets/ISTJ_Logistician.jpg', 'category': 'SJ'},
    {'type': 'ISTP', 'name': 'Virtuoso', 'image': 'assets/ISTP_Virtuoso.jpg', 'category': 'SP'},
  ];

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

    _headerFadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _headerAnimationController,
      curve: AppAnimations.fadeIn,
    ));

    _headerSlideAnimation = Tween<Offset>(
      begin: const Offset(0, -0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _headerAnimationController,
      curve: AppAnimations.slideUp,
    ));

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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.primary.withValues(alpha: 0.1),
              AppColors.secondary.withValues(alpha: 0.05),
              Colors.white,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildAnimatedHeader(),
              Expanded(
                child: _buildMBTIGrid(),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  Widget _buildAnimatedHeader() {
    return SlideTransition(
      position: _headerSlideAnimation,
      child: FadeTransition(
        opacity: _headerFadeAnimation,
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: AppColors.primaryGradient,
                      ),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withValues(alpha: 0.3),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.psychology,
                      color: AppColors.white,
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'MBTI Personality Types',
                          style: AppTextStyles.headlineMedium.copyWith(
                            color: AppColors.grey900,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Discover your unique personality',
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.grey600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.grey200.withValues(alpha: 0.5),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: AppColors.grey400,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Search personality types...',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.grey400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMBTIGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.85,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: mbtiTypes.length,
        itemBuilder: (context, index) {
          final mbtiType = mbtiTypes[index];
          return BounceInAnimation(
            delay: AppAnimations.staggerDelay(index),
            curve: AppAnimations.elastic,
            child: _buildMBTICard(mbtiType, index),
          );
        },
      ),
    );
  }

  Widget _buildMBTICard(Map<String, String> mbtiType, int index) {
    final typeColor = AppColors.getMBTITypeColor(mbtiType['type']!);

    return TapBounceAnimation(
      onTap: () => _showMBTIDetail(context, mbtiType),
      child: Hero(
        tag: AppAnimations.heroTag(mbtiType['type']!, index),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: typeColor.withValues(alpha: 0.2),
                blurRadius: 15,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Card(
            elevation: 0,
            margin: EdgeInsets.zero,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 3,
                  child: Stack(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Image.asset(
                            mbtiType['image']!,
                            fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.person,
                                  size: 50,
                                  color: AppColors.grey400,
                                ),
                              ),
                            );
                          },
                          ),
                        ),
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.white.withValues(alpha: 0.9),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            mbtiType['category']!,
                            style: AppTextStyles.labelSmall.copyWith(
                              color: typeColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              mbtiType['type']!,
                              style: AppTextStyles.mbtiTypeTitle.copyWith(
                                color: typeColor,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              mbtiType['name']!,
                              style: AppTextStyles.mbtiTypeName.copyWith(
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFloatingActionButton() {
    return PulseAnimation(
      child: FloatingActionButton.extended(
        onPressed: () {
          HapticFeedback.lightImpact();
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AssessmentPage(),
            ),
          );
        },
        icon: const Icon(Icons.quiz),
        label: const Text('Take Test'),
        backgroundColor: AppColors.primary,
      ),
    );
  }

  void _showMBTIDetail(BuildContext context, Map<String, String> mbtiType) {
    HapticFeedback.mediumImpact();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SlideInAnimation(
          beginOffset: const Offset(0, 0.3),
          child: Dialog(
            backgroundColor: Colors.transparent,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.2),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 280,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                      color: Colors.white,
                    ),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24),
                          ),
                          child: Image.asset(
                            mbtiType['image']!,
                            height: 280,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.person,
                                    size: 80,
                                    color: AppColors.grey400,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Positioned(
                          top: 16,
                          right: 16,
                          child: TapBounceAnimation(
                            onTap: () => Navigator.of(context).pop(),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: AppColors.white.withValues(alpha: 0.9),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.close,
                                color: AppColors.grey700,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        Text(
                          '${mbtiType['type']} - ${mbtiType['name']}',
                          style: AppTextStyles.headlineSmall.copyWith(
                            color: AppColors.getMBTITypeColor(mbtiType['type']!),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'The ${mbtiType['name']} personality type is known for their unique blend of characteristics that make them stand out in various situations.',
                          style: AppTextStyles.mbtiDescription,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 24),
                        TapBounceAnimation(
                          onTap: () {
                            Navigator.of(context).pop();
                            // TODO: Navigate to detailed page
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  AppColors.getMBTITypeColor(mbtiType['type']!),
                                  AppColors.getMBTITypeColor(mbtiType['type']!).withValues(alpha: 0.8),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              'Learn More',
                              style: AppTextStyles.buttonText,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}