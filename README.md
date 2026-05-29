# psyLevel

A multiplatform mobile application that calculates user stress levels based on heart rate and diastolic blood pressure.

## Features

- Simple and intuitive interface for entering health metrics
- Calculates stress level using the formula: `Stress = (1 - (ДАД / ЧСС)) × 100`
- Visual representation of stress level with color coding
- Stores health measurement history
- Cross-platform support (iOS and Android)

## Getting Started

### Prerequisites

- Flutter SDK (latest stable version)
- Dart SDK (included with Flutter)
- Xcode 14+ (for iOS development)
- Android Studio (for Android development)

### Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd psyLevel
```

2. Install dependencies:
```bash
flutter pub get
cd ios && pod install && cd ..
```

3. Verify your Flutter setup:
```bash
flutter doctor
```

### Running the App

Run on connected device or emulator:
```bash
flutter run
```

Run on specific device:
```bash
flutter run -d iPhone      # iOS simulator
flutter run -d android     # Android emulator
```

### Building

Build APK for Android:
```bash
flutter build apk
```

Build iOS app:
```bash
flutter build ios
```

Build Android App Bundle:
```bash
flutter build appbundle
```

## Testing

Run all tests:
```bash
flutter test
```

Run specific test file:
```bash
flutter test test/stress_calculator_test.dart
```

Run tests with coverage:
```bash
flutter test --coverage
```

## Project Structure

```
lib/
├── main.dart                    # App entry point
├── models/
│   └── health_metrics.dart      # Health data model
├── screens/
│   ├── home_screen.dart         # Main screen
│   ├── input_screen.dart        # Data input screen
│   └── results_screen.dart      # Results display screen
├── services/
│   ├── stress_calculator.dart   # Stress calculation logic
│   └── health_data_service.dart # Data persistence
└── utils/                       # Helper utilities
```

## Stress Calculation Formula

The application calculates stress using the following formula:

```
Stress Level = (1 - (ДАД / ЧСС)) × 100
```

Where:
- **ЧСС** (Heart Rate/Pulse) — in beats per minute (BPM)
- **ДАД** (Diastolic Blood Pressure) — in mmHg
- **Result** — stress level as a percentage (0-100%)

### Example
If ЧСС = 80 and ДАД = 60:
- Stress = (1 - (60 / 80)) × 100 = 25%

## Stress Level Interpretation

- **< 20%** — Low stress
- **20-40%** — Moderate stress
- **40-60%** — Medium stress
- **60-80%** — High stress
- **≥ 80%** — Very high stress

## Development

For development guidelines, see [CLAUDE.md](./CLAUDE.md)

## License

[Add your license information here]
