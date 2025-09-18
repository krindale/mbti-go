import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/animations/app_animations.dart';
import '../../domain/entities/mbti_type.dart';

class TypeDetailPage extends StatefulWidget {
  final MBTIType type;

  const TypeDetailPage({super.key, required this.type});

  @override
  State<TypeDetailPage> createState() => _TypeDetailPageState();
}

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

  void _setupAnimations() {
    _headerAnimationController = AnimationController(
      duration: AppAnimations.slow,
      vsync: this,
    );

    _contentAnimationController = AnimationController(
      duration: AppAnimations.verySlow,
      vsync: this,
    );

    _headerFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _headerAnimationController,
        curve: AppAnimations.fadeIn,
      ),
    );

    _headerSlideAnimation =
        Tween<Offset>(begin: const Offset(0, -0.3), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _headerAnimationController,
            curve: AppAnimations.slideUp,
          ),
        );
  }

  void _startAnimations() {
    _headerAnimationController.forward();
    Future.delayed(const Duration(milliseconds: 300), () {
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
              _buildAnimatedHeader(),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      _buildTypeCard(),
                      _buildDescriptionCard(),
                      _buildStrengthsWeaknesses(),
                      _buildCareerSuggestions(),
                      _buildDetailedStory(),
                      _buildCompatibilitySection(),
                      _buildActionButtons(),
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

  Widget _buildAnimatedHeader() {
    return SlideTransition(
      position: _headerSlideAnimation,
      child: FadeTransition(
        opacity: _headerFadeAnimation,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Row(
            children: [
              TapBounceAnimation(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border.all(color: AppColors.grey30, width: 1),
                  ),
                  child: Icon(
                    Icons.arrow_back,
                    color: AppColors.grey80,
                    size: 20,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.type.code} - ${widget.type.name}',
                      style: AppTextStyles.headlineSmall.copyWith(
                        color: AppColors.grey900,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.type.categoryName,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.grey600,
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

  Widget _buildTypeCard() {
    return BounceInAnimation(
      delay: AppAnimations.staggerDelay(0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Card(
          elevation: 2,
          shadowColor: AppColors.black.withValues(alpha: 0.1),
          shape: const RoundedRectangleBorder(),
          color: AppColors.white,
          child: Container(
            padding: const EdgeInsets.all(32),
            child: Column(
              children: [
                Hero(
                  tag: 'mbti_image_${widget.type.code}',
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: widget.type.primaryColor.withValues(alpha: 0.1),
                      border: Border.all(
                        color: widget.type.primaryColor,
                        width: 3,
                      ),
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        widget.type.imagePath,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(
                            Icons.person,
                            size: 60,
                            color: widget.type.primaryColor,
                          );
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  widget.type.code,
                  style: AppTextStyles.displaySmall.copyWith(
                    color: widget.type.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.type.name,
                  style: AppTextStyles.headlineMedium.copyWith(
                    color: AppColors.grey800,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.grey20,
                    border: Border.all(color: AppColors.grey40, width: 1),
                  ),
                  child: Text(
                    widget.type.categoryName,
                    style: AppTextStyles.labelLarge.copyWith(
                      color: AppColors.grey70,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  widget.type.description,
                  style: AppTextStyles.bodyLarge.copyWith(
                    height: 1.6,
                    color: AppColors.grey700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDescriptionCard() {
    return BounceInAnimation(
      delay: AppAnimations.staggerDelay(1),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Card(
          elevation: 2,
          shape: const RoundedRectangleBorder(),
          color: AppColors.white,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.psychology, color: AppColors.grey70, size: 24),
                    const SizedBox(width: 8),
                    Text(
                      '성격 특성',
                      style: AppTextStyles.headlineSmall.copyWith(
                        color: AppColors.grey900,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _buildTraitItem('외향성 vs 내향성', widget.type.code[0]),
                _buildTraitItem('감각 vs 직관', widget.type.code[1]),
                _buildTraitItem('사고 vs 감정', widget.type.code[2]),
                _buildTraitItem('판단 vs 인식', widget.type.code[3]),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTraitItem(String trait, String preference) {
    final Map<String, String> traitDescriptions = {
      'E': '외향적 - 에너지를 외부에서 얻으며 사교적',
      'I': '내향적 - 에너지를 내부에서 얻으며 신중함',
      'S': '감각적 - 현실적이고 구체적인 정보 선호',
      'N': '직관적 - 가능성과 미래 지향적 사고',
      'T': '사고형 - 논리와 객관성을 중시',
      'F': '감정형 - 감정과 가치를 중시',
      'J': '판단형 - 계획적이고 체계적',
      'P': '인식형 - 유연하고 적응적',
    };

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: AppColors.grey80,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                preference,
                style: AppTextStyles.titleMedium.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  trait,
                  style: AppTextStyles.bodyMedium.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  traitDescriptions[preference] ?? '',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.grey600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStrengthsWeaknesses() {
    return BounceInAnimation(
      delay: AppAnimations.staggerDelay(2),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Card(
                elevation: 2,
                shape: const RoundedRectangleBorder(),
                color: AppColors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.star, color: AppColors.grey70, size: 20),
                          const SizedBox(width: 8),
                          Text(
                            '강점',
                            style: AppTextStyles.titleMedium.copyWith(
                              color: AppColors.grey90,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      ...widget.type.strengths.map((strength) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            children: [
                              Container(
                                width: 4,
                                height: 4,
                                decoration: BoxDecoration(
                                  color: AppColors.grey70,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  strength,
                                  style: AppTextStyles.bodySmall,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Card(
                elevation: 2,
                shape: const RoundedRectangleBorder(),
                color: AppColors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.trending_up,
                            color: AppColors.grey60,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '개선점',
                            style: AppTextStyles.titleMedium.copyWith(
                              color: AppColors.grey80,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      ...widget.type.weaknesses.map((weakness) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            children: [
                              Container(
                                width: 4,
                                height: 4,
                                decoration: const BoxDecoration(
                                  color: AppColors.grey60,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  weakness,
                                  style: AppTextStyles.bodySmall,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCareerSuggestions() {
    return BounceInAnimation(
      delay: AppAnimations.staggerDelay(3),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Card(
          elevation: 2,
          shape: const RoundedRectangleBorder(),
          color: AppColors.white,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.work, color: AppColors.grey70, size: 24),
                    const SizedBox(width: 8),
                    Text(
                      '추천 직업',
                      style: AppTextStyles.headlineSmall.copyWith(
                        color: AppColors.grey900,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: widget.type.careers.map((career) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.grey20,
                        border: Border.all(color: AppColors.grey40, width: 1),
                      ),
                      child: Text(
                        career,
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.grey70,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailedStory() {
    return BounceInAnimation(
      delay: AppAnimations.staggerDelay(4),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Card(
          elevation: 2,
          shape: const RoundedRectangleBorder(),
          color: AppColors.white,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.auto_stories, color: AppColors.grey70, size: 24),
                    const SizedBox(width: 8),
                    Text(
                      '당신의 이야기',
                      style: AppTextStyles.headlineSmall.copyWith(
                        color: AppColors.grey900,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  widget.type.detailedDescription,
                  style: AppTextStyles.bodyLarge.copyWith(
                    height: 1.8,
                    color: AppColors.grey800,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCompatibilitySection() {
    return BounceInAnimation(
      delay: AppAnimations.staggerDelay(5),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Card(
          elevation: 2,
          shape: const RoundedRectangleBorder(),
          color: AppColors.white,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.favorite, color: AppColors.grey70, size: 24),
                    const SizedBox(width: 8),
                    Text(
                      '궁합 정보',
                      style: AppTextStyles.headlineSmall.copyWith(
                        color: AppColors.grey900,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  '${widget.type.name} 타입과 잘 맞는 성격 유형들을 알아보고 싶다면, 곧 출시될 궁합 분석 기능을 기대해 주세요!',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.grey600,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.grey10,
                    border: Border.all(color: AppColors.grey30, width: 1),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: AppColors.grey70,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          '곧 상세한 궁합 분석 기능이 추가됩니다',
                          style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.grey70,
                            fontWeight: FontWeight.w600,
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
      ),
    );
  }

  Widget _buildActionButtons() {
    return BounceInAnimation(
      delay: AppAnimations.staggerDelay(6),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: TapBounceAnimation(
                onTap: () {
                  HapticFeedback.lightImpact();
                  Navigator.of(
                    context,
                  ).pushNamedAndRemoveUntil('/', (route) => false);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(color: AppColors.grey90),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.home, color: AppColors.white, size: 20),
                      const SizedBox(width: 8),
                      Text('홈으로 돌아가기', style: AppTextStyles.buttonText),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: TapBounceAnimation(
                onTap: () {
                  HapticFeedback.lightImpact();
                  Navigator.of(context).pop();
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border.all(color: AppColors.grey30, width: 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.arrow_back, color: AppColors.grey80, size: 20),
                      const SizedBox(width: 8),
                      Text(
                        '이전으로',
                        style: AppTextStyles.buttonText.copyWith(
                          color: AppColors.grey80,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
