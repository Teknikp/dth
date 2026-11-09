# Licence Prep

A Flutter app for looking up **passenger-vehicle licence requirements** in all 13 Canadian provinces and territories, and practising knowledge-test topics (signs, rules, alcohol/drugs, winter driving).

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

## What is in v1

- Pick a province or territory, then read GDL stages, knowledge vs road tests, documents, medical/vision notes, and fees **only when published**.
- Official source buttons and handbook links on each jurisdiction page.
- Practice quizzes with immediate explanations, clearly labelled unofficial.
- English only, no accounts.

## Gaps

Nunavut has the thinnest official GDL write-up (no multi-year L/N-style program on current Motor Vehicles pages). Several jurisdictions do not publish a complete public fee table; those rows say so. See each jurisdiction’s “About this summary” note in the app.
