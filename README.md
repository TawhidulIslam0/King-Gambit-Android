# Medieval Chess 3D — Android Flutter wrapper for the original game

This project is intentionally **not a rewrite of the chess game**. It opens the owner's original published game inside an Android WebView managed by a small Flutter/Dart app. The original project archive is also included under `original-web-source/medieval-chess-game-3d-main/` so the original multi-file codebase remains intact in this ZIP.

- Original source repository: https://github.com/TawhidulIslam0/medieval-chess-game-3d
- Original live game: https://tawhidulislam0.github.io/medieval-chess-game-3d/

## Why this approach preserves the game

The original is a React + TypeScript + Three.js project. Its renderer, chess rules, computer opponent, animated 3D characters, armies, arenas, sound, and menus are all part of that existing web code. Rebuilding those systems separately in Flutter would be a new implementation and could change or omit features. This Flutter app therefore leaves the original game untouched and displays the real live game.

## Important limitation

An internet connection is required. The game loads from the published GitHub Pages site, and the original game also fetches 3D models and other assets from its configured remote asset hosts. This wrapper does not copy or rewrite those game systems into Dart. The original site must remain online for the game to load.

## Run in VS Code

Install the Flutter SDK and Android Studio/Android SDK. Open this project folder in VS Code, then run:

```bash
flutter create . --platforms=android
flutter pub get
flutter run
```

If `flutter create` asks to overwrite existing source files, keep the existing `lib/` files. It may generate the remaining Android Gradle wrapper and platform files needed for your local SDK.

## Build an APK

```bash
flutter build apk --release
```

APK output:

```text
build/app/outputs/flutter-apk/app-release.apk
```

## Project structure

```text
lib/
  main.dart
  screens/
    chess_web_screen.dart
android/
  app/src/main/AndroidManifest.xml
pubspec.yaml
README.md
```

The Flutter wrapper is split into separate files instead of placing everything in `main.dart`. The original React/TypeScript/Three.js source is retained separately under `original-web-source/` and is not replaced with a new chess implementation.
