# LabRadio

Discover radio stations from around the world. Flutter app using BLoC, Retrofit, injectable, and the [50K Radio Stations API](https://rapidapi.com) on RapidAPI.

## Requirements

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (Dart `^3.11.5` — see `pubspec.yaml`)
- Xcode (for iOS) with CocoaPods
- Android Studio / Android SDK (for Android)
- [RapidAPI](https://rapidapi.com) key for `50k-radio-stations`
- Optional: [Firebase](https://firebase.google.com) config if you enable Firebase in `lib/main.dart`

Verify your setup:

```bash
flutter doctor -v
```

## Getting started

### 1. Clone and install dependencies

```bash
git clone <repository-url>
cd labradio
flutter pub get
```

### 2. Environment variables

Env files are gitignored. Copy the example and add your RapidAPI credentials:

```bash
cp .env.example .env.development
cp .env.example .env.production   # optional, for release builds
```

Edit `.env.development`:

| Variable        | Description                                      |
|-----------------|--------------------------------------------------|
| `BASE_URL`      | API base URL (see `.env.example`)                |
| `RAPIDAPI_KEY`  | Your RapidAPI key                                |
| `RAPIDAPI_HOST` | RapidAPI host (`50k-radio-stations.p.rapidapi.com`) |

Debug builds load `.env.development`; release builds load `.env.production`.

### 3. iOS: CocoaPods

```bash
cd ios && pod install && cd ..
```

Or use the Makefile helper (runs `pub get` + pods):

```bash
make get
```

### 4. Code generation (build_runner)

The project uses **injectable**, **freezed**, **json_serializable**, and **retrofit**. Generate code after changing models, DI, or API clients:

```bash
make build_runner
```

Watch mode (regenerates on file changes):

```bash
make build_runner_watch
```

Equivalent without Make:

```bash
dart run build_runner build --delete-conflicting-outputs
```

Run this whenever you add or change:

- `@injectable` / `@module` classes
- `@freezed` / `@JsonSerializable` models
- `@RestApi()` clients

### 5. Run the app

**Mobile (iOS / Android device or simulator):**

```bash
make run_dev_mobile
```

Or:

```bash
flutter run
```

**Web (Chrome):**

```bash
make run_dev_web
```

**Pick a device:**

```bash
flutter devices
flutter run -d <device_id>
```

## Makefile commands

List all targets:

```bash
make help
```

| Command | Description |
|---------|-------------|
| `make get` | `flutter pub get` + `pod install` in `ios/` |
| `make build_runner` | One-shot code generation |
| `make build_runner_watch` | Code generation in watch mode |
| `make run_dev_mobile` | Run on a connected mobile device / emulator |
| `make run_dev_web` | Run in Chrome |
| `make lint` | `dart analyze` |
| `make format` | `dart format .` |
| `make run_unit` | `flutter test` |
| `make clean` | `flutter clean` (removes `pubspec.lock`) |
| `make translate` | `flutter gen-l10n` |
| `make generate_splash` | Regenerate native splash assets |

## Build for Android

### Debug APK

```bash
flutter build apk --debug
```

Output: `build/app/outputs/flutter-apk/app-debug.apk`

### Release APK

```bash
flutter build apk --release
```

Output: `build/app/outputs/flutter-apk/app-release.apk`

### Release App Bundle (Play Store)

```bash
flutter build appbundle --release
```

Or:

```bash
make build_release
```

Output: `build/app/outputs/bundle/release/app-release.aab`

Configure [app signing](https://docs.flutter.dev/deployment/android#signing-the-app) in `android/app/build.gradle.kts` before store upload.

### Flavor builds (Makefile)

The Makefile includes flavor targets (`development`, `staging`, `production`). They require matching Android product flavors and entrypoints (e.g. `lib/main_development.dart`). If those are not set up yet, use the standard `flutter build` commands above or `flutter run` with `lib/main.dart`.

```bash
make build_dev    # development APK
make build_stg    # staging APK
make build_prod   # production APK
```

## Build for iOS

### Run on simulator / device

```bash
cd ios && pod install && cd ..
flutter run
```

### Release build (device archive)

```bash
flutter build ios --release
```

Then open `ios/Runner.xcworkspace` in Xcode, select a team, and **Product → Archive** for App Store distribution.

### IPA (command line, with export options)

```bash
flutter build ipa --release
```

Requires valid signing certificates and provisioning profiles in Xcode.

## Typical workflow

```bash
# First time
cp .env.example .env.development
# edit .env.development with your RapidAPI key
make get
make build_runner

# Daily development
make build_runner    # after changing generated code
flutter run

# Before commit
make format
make lint
make run_unit
```

## Troubleshooting

### `FileNotFoundError` for `.env.development`

- Ensure `.env.development` exists at the project root.
- Confirm env files are listed under `flutter: assets:` in `pubspec.yaml`.
- Run `flutter pub get` and restart the app (not just hot reload).

### CocoaPods not installed / not in valid state

```bash
brew install cocoapods   # or: sudo gem install cocoapods
cd ios && pod install && cd ..
flutter doctor -v
```

### Code generation conflicts

```bash
make build_runner
# uses: dart run build_runner build --delete-conflicting-outputs
```

### Firebase

Firebase init is commented out in `lib/main.dart` by default. To use Analytics/Crashlytics, add `google-services.json` (Android) and `GoogleService-Info.plist` (iOS), then uncomment `Firebase.initializeApp()` in `main.dart`.

## Project structure (high level)

```
lib/
  main.dart              # App entry, env + DI bootstrap
  app.dart               # Root widget, BLoC providers
  core/                  # DI, networking, storage, theme
  features/              # Feature modules (home, favorites, onboarding, …)
ios/                     # Xcode project + Podfile
android/                 # Gradle project
```

## License

Private project — not published to pub.dev (`publish_to: 'none'`).
