# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

psyLevel is a multiplatform mobile application built with **Flutter** that calculates user stress levels based on health metrics. The app collects a user's heart rate (pulse) and diastolic blood pressure (lower blood pressure value) and computes a stress indicator.

**Target Platforms:** iOS and Android

## Tech Stack

- **Framework:** Flutter (Dart)
- **State Management:** Provider or Riverpod (to be decided)
- **Backend:** (TBD - local storage or API)
- **Development Environment:** Flutter SDK, Xcode (iOS), Android Studio (Android)

## Development Setup

### Prerequisites
- Flutter SDK (latest stable)
- Dart SDK (included with Flutter)
- Xcode 14+ (for iOS development)
- Android Studio with Android SDK (for Android development)
- CocoaPods (for iOS dependencies)

### Initial Setup
```bash
# Verify Flutter installation
flutter doctor

# Install dependencies
flutter pub get

# Get iOS pods
cd ios && pod install && cd ..
```

## Common Development Commands

### Running the App
```bash
# Run on connected device or emulator
flutter run

# Run on iOS
flutter run -d iPhone

# Run on Android
flutter run -d android

# Run in debug mode with hot reload
flutter run --debug

# Run in release mode
flutter run --release
```

### Building
```bash
# Build APK for Android
flutter build apk

# Build iOS app
flutter build ios

# Build Android App Bundle
flutter build appbundle
```

### Testing
```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage

# Run a specific test file
flutter test test/path_to_test.dart
```

### Development Tools
```bash
# Format code
dart format lib/ test/

# Analyze code
dart analyze

# Get code generation (if using build_runner)
flutter pub run build_runner build

# Watch for changes and rebuild
flutter pub run build_runner watch
```

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── models/                   # Data models (User, HealthMetrics, StressLevel)
├── screens/                  # UI screens
│   ├── home_screen.dart
│   ├── input_screen.dart
│   └── results_screen.dart
├── services/                 # Business logic (stress calculation, data storage)
│   ├── stress_calculator.dart
│   └── health_data_service.dart
├── widgets/                  # Reusable UI components
└── utils/                    # Helper functions and constants

test/                         # Unit and widget tests
android/                      # Android-specific code
ios/                         # iOS-specific code
```

## Core Functionality

### Health Metrics Input
- **Heart Rate (Pulse):** Beats per minute (BPM)
- **Diastolic Blood Pressure:** Lower blood pressure reading (mmHg)

### Stress Calculation

**Formula:**
```
Stress Level = (1 - (ДАД / ЧСС)) × 100
```

Where:
- **ЧСС** (Heart Rate / Pulse) — user input in BPM
- **ДАД** (Diastolic Blood Pressure) — user input in mmHg
- **Result** — stress level as a percentage (0-100 scale)

**Example:** If ЧСС = 80 and ДАД = 60:
- Stress = (1 - (60 / 80)) × 100 = (1 - 0.75) × 100 = 25%

## Key Implementation Notes

- **Platform-specific access:** May need permissions for health data on both iOS and Android
- **Local storage:** Use SQLite (sqflite) or Hive for persisting health records
- **UI/UX:** Keep the interface simple and intuitive for quick data entry and result visualization
- **Testing:** Include unit tests for the stress calculation algorithm

## iOS-Specific Considerations

- Handle HealthKit permissions for iOS 16+
- Update Info.plist with required privacy descriptions
- Code signing and provisioning profiles needed for physical device testing

## Android-Specific Considerations

- Target API level 31+ (current Play Store requirement)
- Handle Android runtime permissions for health data
- Test on multiple device sizes and Android versions

## Useful Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [Dart Language](https://dart.dev)
- [Flutter Pub Packages](https://pub.dev)
