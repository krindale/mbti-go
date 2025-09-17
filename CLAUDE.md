# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Flutter application called `mbti_go` that appears to be related to MBTI (Myers-Briggs Type Indicator) personality types. The project contains assets for all 16 MBTI personality types with corresponding images.

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

### Testing & Analysis
```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/widget_test.dart

# Analyze code for issues
flutter analyze

# Format code
dart format lib/ test/

# Check for outdated dependencies
flutter pub outdated
```

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
├── main.dart          # Entry point with MyApp and MyHomePage widgets

asssets/               # MBTI personality type images
├── ENFJ_Protagonist.jpg
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
└── widget_test.dart   # Basic widget tests for counter functionality
```

## Architecture

The app currently follows the default Flutter structure:

- **Entry Point**: `lib/main.dart` contains the `MyApp` root widget and `MyHomePage` stateful widget
- **State Management**: Currently uses basic `setState()` for a simple counter example
- **UI**: Material Design with default Flutter demo counter interface
- **Assets**: Contains 16 MBTI personality type images (note: directory is misspelled as "asssets")

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

## Development Notes

- The project is currently in initial state with default Flutter counter app
- SDK version: `^3.9.0`
- No additional dependencies beyond Flutter defaults
- No custom state management, routing, or architectural patterns implemented yet
- Assets directory needs to be properly configured before images can be used