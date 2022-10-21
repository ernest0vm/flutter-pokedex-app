# Pokedex App

![flutter](https://img.shields.io/badge/flutter-v3.3.4-blue)
![flutter-ci](https://github.com/ernest0vm/flutter-pokedex-app/actions/workflows/flutter-ci.yml/badge.svg)

**Pokedex App** use Google's Flutter Framework.

You can download and install it using this instructions:
<https://docs.flutter.dev/get-started/install>

![pokedex-app](android/app/src/main/res/mipmap-xxxhdpi/ic_launcher.png)

---

## Environment Requirements

Please use next development environment:

```console
[✓] Flutter (Channel stable, 3.3.4, on macOS 12.6 21G115 darwin-x64, locale en-MX)
    • Flutter version 3.3.4 on channel stable at /Users/ernestovm/Library/flutter
    • Upstream repository https://github.com/flutter/flutter.git
    • Framework revision eb6d86ee27 (2 weeks ago), 2022-10-04 22:31:45 -0700
    • Engine revision c08d7d5efc
    • Dart version 2.18.2
    • DevTools version 2.15.0

[✓] Android toolchain - develop for Android devices (Android SDK version 33.0.0)
    • Android SDK at /Users/ernestovm/Library/Android/sdk
    • Platform android-33, build-tools 33.0.0
    • ANDROID_HOME = /Users/ernestovm/Library/Android/sdk
    • Java binary at: /Applications/Android Studio.app/Contents/jre/Contents/Home/bin/java
    • Java version OpenJDK Runtime Environment (build 11.0.13+0-b1751.21-8125866)
    • All Android licenses accepted.

[✓] Xcode - develop for iOS and macOS (Xcode 14.0.1)
    • Xcode at /Applications/Xcode.app/Contents/Developer
    • Build 14A400
    • CocoaPods version 1.11.3

[✓] Chrome - develop for the web
    • Chrome at /Applications/Google Chrome.app/Contents/MacOS/Google Chrome

[✓] Android Studio (version 2021.3)
    • Android Studio at /Applications/Android Studio.app/Contents
    • Flutter plugin can be installed from:
      🔨 https://plugins.jetbrains.com/plugin/9212-flutter
    • Dart plugin can be installed from:
      🔨 https://plugins.jetbrains.com/plugin/6351-dart
    • Java version OpenJDK Runtime Environment (build 11.0.13+0-b1751.21-8125866)

[✓] VS Code (version 1.72.2)
    • VS Code at /Applications/Visual Studio Code.app/Contents
    • Flutter extension version 3.50.0

[✓] Connected device (3 available)
    • iPhone 14 Pro Max (mobile) • CB67DD65-F34E-4D71-83FA-26A7DDCAEACE • ios            •
      com.apple.CoreSimulator.SimRuntime.iOS-16-0 (simulator)
    • macOS (desktop)            • macos                                • darwin-x64     • macOS 12.6 21G115 darwin-x64
    • Chrome (web)               • chrome                               • web-javascript • Google Chrome 106.0.5249.119

[✓] HTTP Host Availability
    • All required HTTP hosts are available

• No issues found!
```

---

## Build requirements

**For Android:**

1. You will need add an **Android Keystore** file.

2. You need create `key.properties` file into `/android` directory, this file contains **Android Keystore** absolute path, alias and passwords for generate new application packages into release mode.

3. Please fill `key.properties` with next variables:

```properties
storeFile=/path/to/your/keystore
storePassword=p@ssw0rd
keyPassword=p@ssw0rd
keyAlias=aliasKey
```

**For iOS:**

You will need add an Apple Developer account, please [create one](https://developer.apple.com/programs/enroll/), if you already have one just need a drink of coffee ☕️.

---

## Run Pokedex App

You can use `VS Code Launch Configurations` for run the project without type long command lines.

just press `F5` key and select a configuration to run **Pokemon App**, through this method you can select between a lot of configurations of `debug mode`, `profile mode` and `release mode`.

If you want type a command within terminal:

```console
flutter run
```

---

## Build Pokedex App

**For Android:**

For build android binaries (`apk` or `appbundle`), your can go to **Terminal** menu > **Run Task...** and select **flutter build apk** or **flutter build appbundle**.

or use next commands:

```console
# Build android apk
  flutter build apk
# Build android appbundle
  flutter build appbundle
```

**For iOS:**

For build iOS binaries (`ipa`), your can go to **Terminal** menu > **Run Task..**. and select **flutter build ipa**.

or use next commands:

```console
# Build iOS archive
  flutter build ios
# Build iOS ipa
  flutter build ipa
```

---

## Contributors

[![Ernesto Valdez](https://images.weserv.nl/?url=github.com/ernest0vm.png?v=4&h=100&w=100&fit=cover&mask=circle&maxage=7d)](https://github.com/ernest0vm)

---

## Help

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
