# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

**MBTI Go** is a comprehensive Flutter application for MBTI (Myers-Briggs Type Indicator) personality analysis and exploration. The app provides an interactive platform for users to discover, understand, and explore the 16 MBTI personality types through a modern, animated interface.

### Vision & Mission
- **Vision**: MBTI 성격 유형을 통해 자신과 타인을 이해하고, 더 나은 인간관계와 자기계발을 돕는 종합적인 성격 분석 플랫폼
- **Mission**: 정확하고 과학적인 MBTI 검사 제공, 개인화된 성격 분석과 맞춤형 조언, 커뮤니티를 통한 상호 이해 증진

### Target Users
- **20-30대 직장인**: 자기계발과 커리어 성장에 관심이 높은 층
- **대학생**: 진로 탐색과 대인관계 개선을 원하는 층
- **MBTI 관심층**: 성격 유형학에 이미 관심을 가진 사용자

## Development Commands

### Essential Flutter Commands
```bash
# Get dependencies
flutter pub get

# Run the app in debug mode
flutter run

# Run on specific device
flutter run -d <device-id>

# Build for release
flutter build apk          # Android APK
flutter build ios          # iOS (requires macOS)
flutter build web          # Web build
flutter build windows      # Windows executable
flutter build macos        # macOS executable
flutter build linux        # Linux executable

# Hot reload during development
# Press 'r' in terminal or save files in IDE

# Hot restart (full restart)
# Press 'R' in terminal
```

### Code Quality & Analysis
```bash
# **MANDATORY**: Run before every commit
flutter analyze                    # Check for code issues and warnings
dart format lib/ test/            # Format code to consistent style

# Run all tests
flutter test

# Run specific test file
flutter test test/widget_test.dart

# Check for outdated dependencies
flutter pub outdated

# Advanced linting
flutter analyze --fatal-infos     # Treat info-level issues as fatal
dart analyze --fatal-warnings     # Strict analysis mode

# Performance analysis
flutter build apk --analyze-size  # Analyze app size
flutter build web --analyze-size  # Analyze web bundle size
```

### SOLID Principles Compliance
This project follows SOLID principles for maintainable code:

**S - Single Responsibility Principle**
- Each class has one reason to change
- Widgets focus on UI presentation
- Business logic separated into services
- Data models handle only data structure

**O - Open/Closed Principle**
- Classes open for extension, closed for modification
- Use composition over inheritance
- Plugin architecture for features
- Theme system extensible without core changes

**L - Liskov Substitution Principle**
- Derived classes substitutable for base classes
- Interface implementations maintain contract
- Widget inheritance preserves behavior
- Repository pattern ensures data source interchangeability

**I - Interface Segregation Principle**
- Small, focused interfaces
- Clients depend only on needed methods
- Abstract classes define minimal contracts
- Repository interfaces specific to use cases

**D - Dependency Inversion Principle**
- Depend on abstractions, not concretions
- Use dependency injection
- Repository pattern abstracts data sources
- Service interfaces define contracts

### Quality Gates
Before any commit or PR, ensure:
1. ✅ `flutter analyze` passes with zero issues
2. ✅ `dart format` applied to all code
3. ✅ All tests pass (`flutter test`)
4. ✅ No TODO comments in production code
5. ✅ SOLID principles followed
6. ✅ Animation performance tested
7. ✅ Accessibility guidelines met
8. ✅ Memory leaks checked

### Device Management
```bash
# List available devices
flutter devices

# Launch iOS simulator
open -a Simulator

# Launch Android emulator
flutter emulators --launch <emulator-id>
```

## Project Structure

```
lib/
├── main.dart                    # Entry point with MBTI app and homepage
├── core/                        # Core utilities and systems
│   ├── theme/                   # Design system
│   │   ├── app_colors.dart      # Color palette and MBTI type colors
│   │   ├── app_theme.dart       # Material 3 theme configuration
│   │   └── app_text_styles.dart # Typography system
│   └── animations/              # Animation system
│       └── app_animations.dart  # Reusable animation widgets
├── features/                    # Feature-based architecture (planned)
│   ├── assessment/              # MBTI test functionality
│   ├── profile/                 # User profile management
│   ├── types/                   # 16 personality types data
│   ├── compatibility/           # Relationship analysis
│   └── community/               # Social features
├── data/                        # Data layer (planned)
│   ├── datasources/             # API and local data sources
│   ├── models/                  # Data models
│   └── repositories/            # Repository implementations
└── domain/                      # Business logic (planned)
    ├── entities/                # Business entities
    ├── repositories/            # Repository contracts
    └── usecases/                # Business use cases

assets/                          # MBTI personality type images
├── ENFJ_Protagonist.jpg         # Fixed from 'asssets' typo
├── ENFP_Campaigner.jpg
├── ENTJ_Commander.jpg
├── ENTP_Debater.jpg
├── ESFJ_Consul.jpg
├── ESFP_Entertainer.jpg
├── ESTJ_Executive.jpg
├── ESTP_Entrepreneur.jpg
├── INFJ_Advocate.jpg
├── INFP_Mediator.jpg
├── INTJ_Architect.jpg
├── INTP_Thinker.jpg
├── ISFJ_Protector.jpg
├── ISFP_Adventurer.jpg
├── ISTJ_Logistician.jpg
└── ISTP_Virtuoso.jpg

test/
└── widget_test.dart             # Widget tests for MBTI components
```

## Architecture

**MBTI Go** follows Clean Architecture principles with feature-based organization:

### Current Implementation
- **Entry Point**: `lib/main.dart` contains the MBTI app with animated personality type grid
- **Design System**: Comprehensive theme system with MBTI-specific colors and animations
- **UI**: Material 3 design with advanced animations and responsive layout
- **Assets**: 16 MBTI personality type images properly configured
- **Animation System**: Custom animation widgets with bounce, slide, and pulse effects

### Planned Architecture (Clean Architecture + BLoC)
```
Presentation Layer (UI)
├── Widgets (Stateless/Stateful)
├── BLoC (Business Logic Components)
└── Pages/Screens

Domain Layer (Business Logic)
├── Entities (Business Objects)
├── Use Cases (Business Rules)
└── Repository Interfaces

Data Layer (External Concerns)
├── Repository Implementations
├── Data Sources (API, Local Storage)
└── Models (Data Transfer Objects)
```

### Core Features Implemented
- ✅ **16 MBTI Type Display**: Interactive grid with type-specific colors
- ✅ **Animation System**: Bouncy, elastic animations with staggered effects
- ✅ **Design System**: Comprehensive theming with gradients and shadows
- ✅ **Responsive UI**: Adaptive layout for different screen sizes
- ✅ **Hero Animations**: Smooth transitions between views
- ✅ **Haptic Feedback**: Touch responses for better UX

### Planned Features (Roadmap)
- 🔄 **MBTI Assessment**: 20-question quick test + 93-question full test
- 🔄 **Personal Dashboard**: Customized insights and daily tips
- 🔄 **Compatibility Analysis**: Relationship matching and advice
- 🔄 **Community Features**: Type-based discussions and sharing
- 🔄 **Offline Support**: Local storage and caching

## Key Configuration Files

- **pubspec.yaml**: Defines dependencies, currently minimal with only `cupertino_icons` and standard Flutter packages
- **analysis_options.yaml**: Uses `flutter_lints` for code analysis with default rules
- **Platform folders**: Standard Flutter platform-specific configuration in `android/`, `ios/`, `web/`, `windows/`, `macos/`, `linux/`

## Assets Integration

To use the MBTI images in the app, you'll need to:

1. Fix the assets directory name from `asssets` to `assets`
2. Add asset declarations to `pubspec.yaml`:
```yaml
flutter:
  assets:
    - assets/
```

## Feature Planning & Development Phases

### Phase 1: MVP (4-6주) - Core MBTI Experience
**우선순위 1: 핵심 기능**
- ✅ 16가지 MBTI 유형 표시 (완료)
- ✅ 애니메이션 및 디자인 시스템 (완료)
- 🔄 간편 MBTI 검사 (20문항)
- 🔄 검사 결과 상세 페이지
- 🔄 기본 프로필 설정

### Phase 2: 고도화 (6-8주) - Personalization
**우선순위 2: 개인화 기능**
- 정식 MBTI 검사 (93문항)
- 개인화 대시보드
- 일일 성격 팁
- 검사 이력 관리
- 오프라인 저장 기능

### Phase 3: 소셜 기능 (8-10주) - Community
**우선순위 3: 커뮤니티**
- 호환성 분석 기능
- 유저 간 매칭
- 게시판 시스템
- 댓글 및 좋아요
- 알림 시스템

### Phase 4: 고급 기능 (10-12주) - Advanced Features
**우선순위 4: 부가 기능**
- AI 기반 개인 분석
- 성장 추천 시스템
- 프리미엄 구독 모델
- 다국어 지원
- 심화 분석 리포트

## Animation & Design System

### Animation Features Implemented
- **BounceInAnimation**: 탄성 있는 카드 등장 효과
- **TapBounceAnimation**: 터치 시 팡팡한 반응
- **PulseAnimation**: 지속적인 맥박 효과
- **SlideInAnimation**: 부드러운 슬라이드 전환
- **Hero Animations**: 화면 간 매끄러운 전환
- **Staggered Effects**: 순차적 애니메이션 등장

### Design System Features
- **MBTI Type Colors**: 각 성격 유형별 고유 색상
- **Gradient Effects**: 카드와 버튼의 입체감
- **Material 3**: 최신 디자인 가이드라인
- **Typography System**: 일관된 텍스트 스타일
- **Responsive Layout**: 다양한 화면 크기 대응

## Development Notes

### Current Status
- ✅ **Modern MBTI App**: 고급 애니메이션을 가진 성격 유형 탐색기 완성
- ✅ **SDK Version**: `^3.9.0`
- ✅ **Assets Configuration**: 16개 MBTI 이미지 정상 설정
- ✅ **Design System**: 포괄적인 테마 및 애니메이션 시스템
- ✅ **Clean Code**: SOLID 원칙 준수 및 체계적인 폴더 구조

### Technical Debt & Todos
- [ ] BLoC state management 도입
- [ ] Repository pattern 구현
- [ ] Unit/Widget/Integration 테스트 추가
- [ ] 접근성 가이드라인 구현
- [ ] 성능 최적화 (이미지 캐싱, 메모리 관리)
- [ ] 에러 처리 및 로깅 시스템

### Performance Considerations
- 이미지 lazy loading 및 캐싱
- 애니메이션 최적화 (60fps 유지)
- 메모리 누수 방지
- 배터리 효율성 고려