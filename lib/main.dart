import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/app_colors.dart';
import 'core/theme/app_text_styles.dart';
import 'core/animations/app_animations.dart';
import 'core/animations/page_transitions.dart';
import 'features/assessment/presentation/pages/assessment_page.dart';
import 'features/assessment/presentation/pages/type_detail_page.dart';
import 'features/assessment/data/datasources/mbti_data.dart';

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
    {
      'type': 'ENFJ',
      'name': '선도자',
      'image': 'assets/ENFJ_Protagonist.jpg',
      'category': 'NF',
      'description': '카리스마 리더',
      'detailedDescription':
          '선도자는 타인의 성장과 발전을 돕는 천성적인 지도자입니다. 따뜻한 마음과 강력한 소통 능력으로 사람들을 이끌어갑니다.',
    },
    {
      'type': 'ENFP',
      'name': '활동가',
      'image': 'assets/ENFP_Campaigner.jpg',
      'category': 'NF',
      'description': '열정적 자유 영혼',
      'detailedDescription':
          '활동가는 무한한 창의력과 열정으로 새로운 가능성을 찾아내는 사람입니다. 자유롭고 긍정적인 에너지로 사람들을 고무시킵니다.',
    },
    {
      'type': 'ENTJ',
      'name': '지휘관',
      'image': 'assets/ENTJ_Commander.jpg',
      'category': 'NT',
      'description': '강력한 의지의 지도자',
      'detailedDescription':
          '지휘관은 대담하고 전략적인 사고로 목표를 달성하는 것을 즐기는 타고난 리더입니다. 초자연적인 리더십과 설득력을 가졌습니다.',
    },
    {
      'type': 'ENTP',
      'name': '토론가',
      'image': 'assets/ENTP_Debater.jpg',
      'category': 'NT',
      'description': '호기심 많은 사상가',
      'detailedDescription':
          '토론가는 지적 호기심이 뛰어나고 새로운 아이디어를 탐구하는 것을 좋아합니다. 반대 의견을 두려워하지 않는 열정적인 토론가입니다.',
    },
    {
      'type': 'ESFJ',
      'name': '집정관',
      'image': 'assets/ESFJ_Consul.jpg',
      'category': 'SJ',
      'description': '사교적 인기쟁이',
      'detailedDescription':
          '집정관은 다른 사람들의 필요를 민감하게 알아채고 도움을 주는 것을 좋아합니다. 따뜻하고 배려심 많은 성격으로 인기가 많습니다.',
    },
    {
      'type': 'ESFP',
      'name': '연예인',
      'image': 'assets/ESFP_Entertainer.jpg',
      'category': 'SP',
      'description': '열정적 예술가',
      'detailedDescription':
          '연예인은 즉흥적이고 열정적인 성격으로 주변 사람들에게 에너지를 전달합니다. 새로운 경험을 좋아하고 생동감 넘치는 사람입니다.',
    },
    {
      'type': 'ESTJ',
      'name': '경영자',
      'image': 'assets/ESTJ_Executive.jpg',
      'category': 'SJ',
      'description': '뛰어난 관리자',
      'detailedDescription':
          '경영자는 전통과 질서를 중요시하며 조직을 효율적으로 운영하는 데 능숙합니다. 체계적이고 책임감 있는 리더십을 발휘합니다.',
    },
    {
      'type': 'ESTP',
      'name': '사업가',
      'image': 'assets/ESTP_Entrepreneur.jpg',
      'category': 'SP',
      'description': '에너지 넘치는 사업가',
      'detailedDescription':
          '사업가는 현실적이고 에너지가 넘치며 위기 상황에서도 침착하게 대처하는 날카로운 문제 해결사입니다.',
    },
    {
      'type': 'INFJ',
      'name': '옹호자',
      'image': 'assets/INFJ_Advocate.jpg',
      'category': 'NF',
      'description': '신비로운 이상주의자',
      'detailedDescription':
          '옹호자는 내성적이지만 강한 단호력과 창의력으로 세상을 바꿀 수 있다고 믿는 신념의 소유자입니다.',
    },
    {
      'type': 'INFP',
      'name': '중재자',
      'image': 'assets/INFP_Mediator.jpg',
      'category': 'NF',
      'description': '친절한 이상주의자',
      'detailedDescription':
          '중재자는 자신의 가치관과 신념에 따라 살아가는 진정성 있는 사람입니다. 다른 사람들의 열정을 불러일으키는 영감의 원천입니다.',
    },
    {
      'type': 'INTJ',
      'name': '건축가',
      'image': 'assets/INTJ_Architect.jpg',
      'category': 'NT',
      'description': '전략적 사고의 건축가',
      'detailedDescription':
          '건축가는 독립적이고 전략적인 사고를 통해 자신만의 비전을 만들어가는 혁신적인 창조자입니다.',
    },
    {
      'type': 'INTP',
      'name': '논리술사',
      'image': 'assets/INTP_Thinker.jpg',
      'category': 'NT',
      'description': '혁신적인 발명가',
      'detailedDescription':
          '논리술사는 지식에 대한 갈증이 뛰어나고 발명이나 혁신을 통해 세상을 이해하려 하는 이론적 사색가입니다.',
    },
    {
      'type': 'ISFJ',
      'name': '수호자',
      'image': 'assets/ISFJ_Protector.jpg',
      'category': 'SJ',
      'description': '따뜻한 수호자',
      'detailedDescription':
          '수호자는 따뜻하고 이타적인 성격으로 다른 사람들을 돌보고 보호하는 데 천부적인 재능을 가진 사람입니다.',
    },
    {
      'type': 'ISFP',
      'name': '모험가',
      'image': 'assets/ISFP_Adventurer.jpg',
      'category': 'SP',
      'description': '매력적인 예술가',
      'detailedDescription':
          '모험가는 유연하고 매력적인 성격으로 자신의 가치관과 신념에 따라 살아가는 예술가적 기질의 소유자입니다.',
    },
    {
      'type': 'ISTJ',
      'name': '현실주의자',
      'image': 'assets/ISTJ_Logistician.jpg',
      'category': 'SJ',
      'description': '신뢰할 수 있는 현실주의자',
      'detailedDescription':
          '현실주의자는 실용적이고 사실에 근거한 신뢰할 수 있는 성격으로 체계적이고 책임감 있는 사람입니다.',
    },
    {
      'type': 'ISTP',
      'name': '만능재주꾼',
      'image': 'assets/ISTP_Virtuoso.jpg',
      'category': 'SP',
      'description': '실용적 만능재주꾼',
      'detailedDescription':
          '만능재주꾼은 대담하고 실용적인 실험정신으로 손으로 무언가를 만들고 탐구하는 것을 좋아하는 장인정신의 소유자입니다.',
    },
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
            _buildAnimatedHeader(),
            Expanded(child: _buildMBTIGrid()),
          ],
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
          padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border(
              bottom: BorderSide(color: AppColors.grey20, width: 1),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 4,
                    height: 32,
                    decoration: const BoxDecoration(color: AppColors.grey80),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'MBTI 성격 유형 탐색',
                          style: AppTextStyles.headlineMedium.copyWith(
                            color: AppColors.grey100,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '16가지 성격 유형을 통해\n자신만의 특별한 성격을 발견해보세요',
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.grey70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMBTIGrid() {
    return Container(
      color: AppColors.grey10,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
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
            color: AppColors.white,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: AppColors.grey20, width: 1),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withValues(alpha: 0.1),
                blurRadius: 2,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Carbon-style header with type indicator
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: AppColors.grey10,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4),
                    topRight: Radius.circular(4),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 3,
                      height: 20,
                      decoration: BoxDecoration(
                        color: typeColor,
                        borderRadius: BorderRadius.circular(1.5),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        mbtiType['type']!,
                        style: AppTextStyles.titleMedium.copyWith(
                          color: AppColors.grey100,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.grey20,
                        borderRadius: BorderRadius.circular(2),
                        border: Border.all(color: AppColors.grey40, width: 1),
                      ),
                      child: Text(
                        mbtiType['category']!,
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.grey70,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Image section
              Expanded(
                flex: 3,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 16,
                  ),
                  color: AppColors.white,
                  child: Center(
                    child: Image.asset(
                      mbtiType['image']!,
                      fit: BoxFit.contain,
                      width: double.infinity,
                      height: double.infinity,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: AppColors.grey10,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Icon(
                            Icons.person_outline,
                            size: 32,
                            color: AppColors.grey50,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              // Carbon-style footer
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  border: Border(
                    top: BorderSide(color: AppColors.grey20, width: 1),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mbtiType['name']!,
                      style: AppTextStyles.titleSmall.copyWith(
                        color: AppColors.grey100,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      mbtiType['description']!,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.grey60,
                        fontSize: 11,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
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

  Widget _buildFloatingActionButton() {
    return PulseAnimation(
      child: FloatingActionButton.extended(
        onPressed: () {
          HapticFeedback.lightImpact();
          Navigator.of(
            context,
          ).push(PageTransitions.slideRight(const AssessmentPage()));
        },
        icon: const Icon(Icons.quiz),
        label: const Text('검사하기'),
        backgroundColor: AppColors.grey90,
      ),
    );
  }

  void _navigateToDetailPage(BuildContext context, String typeCode) {
    final mbtiType = MBTIData.getTypeByCode(typeCode);
    if (mbtiType != null) {
      Navigator.of(context).push(
        PageTransitions.slideRightWithBackground(
          TypeDetailPage(type: mbtiType),
        ),
      );
    }
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
                            color: AppColors.grey90,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          mbtiType['detailedDescription']!,
                          style: AppTextStyles.mbtiDescription,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 24),
                        TapBounceAnimation(
                          onTap: () {
                            Navigator.of(context).pop();
                            _navigateToDetailPage(context, mbtiType['type']!);
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            decoration: BoxDecoration(
                              color: AppColors.grey90,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              '자세히 보기',
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
