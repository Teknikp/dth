# Licence Prep

A Flutter app for looking up **passenger-vehicle licence requirements** in all 13 Canadian provinces and territories, studying knowledge-test **theory**, and practising quizzes (signs, rules, alcohol/drugs, winter driving, GDL).

This is unofficial study material, **not legal advice**. Official handbooks, tests, and fee pages always win. Where a number was not published on an official page, the app says so and links that page instead of inventing a figure.

No account is required.

## Run

You need the [Flutter SDK](https://docs.flutter.dev/get-started/install) (this project was built with Flutter 3.47 / Dart 3.13).

```bash
flutter pub get
flutter test
flutter run -d chrome          # or: flutter run -d web-server --web-hostname 127.0.0.1 --web-port 8080
flutter run                    # iOS / Android device or simulator
```

Web is included so the flow can be checked in a browser. The layout is mobile-first.

### Android emulator (Windows)

Flutter 3.47 compiles against **API 36** and NDK **28.2.13676358** (`flutter.compileSdkVersion` / `flutter.ndkVersion`). Gradle configure calls `sdkmanager` if those packages are missing. That needs Google’s SDK source lists **while you are online**. A failure often surfaces at `android/build.gradle.kts` line 19 (`evaluationDependsOn(":app")`) even though `:app` is the project that actually failed.

Install and accept licenses, then retry:

```bat
flutter doctor -v
flutter doctor --android-licenses

rem From a terminal where ANDROID_HOME (or ANDROID_SDK_ROOT) is the Android SDK:
sdkmanager --install "platforms;android-36" "build-tools;36.0.0" "platform-tools" "ndk;28.2.13676358"
sdkmanager --list_installed

flutter run -d emulator-5554
```

In Android Studio’s SDK Manager, that is **Android API 36**, matching **SDK Build-Tools 36.0.0**, and **NDK (Side by side) 28.2.13676358**.

`Warning: Failed to download any source lists!` / `IO exception while downloading manifest` means `sdkmanager` cannot reach `dl.google.com`. Use Android Studio’s SDK Manager on the same machine (it uses the same SDK path), or fix proxy/firewall, then run the installs above. Do not expect configure to succeed offline if those packages are not already installed.

## What is in v1

- Pick a province or territory, then read GDL stages, knowledge vs road tests, documents, medical/vision notes, and fees **only when published**.
- Official source buttons and handbook links on each jurisdiction page.
- Practice quizzes with immediate explanations, clearly labelled unofficial.
- **Theory** tab: handbook-style lessons (signs, rules, impairment, winter, GDL) then quizzes. Canada-wide where the idea is shared; provincial notes where rules differ (pick a study place).
- Sign questions show an **original in-repo graphic** and ask what it means — not a text-only description of the shape.
- English and French in-app, with a persistent EN/FR toggle. Official legal pages stay linked in the government’s language.
- On-device progress mapping (pick a province, check off knowledge/vision/road/GDL stages). No accounts.

## Sign graphics (copyright)

Drawings in `assets/signs/` are **original study-aid vectors** made for this app. They recreate the public, on-street *look* of common Canadian regulatory and warning signs (octagon, yield triangle, MAXIMUM plate, school pentagon, and similar) with simple geometry and original lettering (STOP, ARRÊT, YIELD, CÉDEZ, MAXIMUM).

They are **not**:

- TAC (Transportation Association of Canada) plates or MUTCDC artwork
- scans or copies from a provincial MOT handbook
- assets from a commercial test-bank app

Use them only as unofficial study diagrams. Official meaning still comes from the handbook for the province or territory where you will take the test.

## Gaps

Nunavut has the thinnest official GDL write-up (no multi-year L/N-style program on current Motor Vehicles pages). Several jurisdictions do not publish a complete public fee table; those rows say so. See each jurisdiction’s “About this summary” note in the app.
