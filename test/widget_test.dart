import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:licence_prep/app.dart';
import 'package:licence_prep/state/app_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<LicencePrepApp> pumpApp(WidgetTester tester) async {
  SharedPreferences.setMockInitialValues({});
  final state = await AppState.load();
  final app = LicencePrepApp(state: state);
  await tester.pumpWidget(app);
  await tester.pumpAndSettle();
  return app;
}

void main() {
  testWidgets('province pick shows requirements then a practice quiz', (
    tester,
  ) async {
    await pumpApp(tester);

    expect(find.text('Canadian licence prep'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'Ontario');
    await tester.pump();
    await tester.tap(find.byKey(const Key('province-ON')));
    await tester.pumpAndSettle();

    expect(find.text('Ontario'), findsWidgets);
    expect(find.textContaining('G1'), findsWidgets);

    final requirementsScroll = find.byType(Scrollable).first;
    await tester.scrollUntilVisible(
      find.text('Knowledge test'),
      400,
      scrollable: requirementsScroll,
    );
    expect(find.text('Knowledge test'), findsOneWidget);

    await tester.scrollUntilVisible(
      find.byKey(const Key('practice-from-requirements')),
      200,
      scrollable: requirementsScroll,
    );
    await tester.tap(find.byKey(const Key('practice-from-requirements')));
    await tester.pumpAndSettle();

    expect(find.textContaining('Unofficial study material'), findsWidgets);
    expect(find.byKey(const Key('quiz-prompt')), findsOneWidget);

    await tester.tap(find.byKey(const Key('choice-0')));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('quiz-feedback')), findsOneWidget);
    await tester.scrollUntilVisible(
      find.byKey(const Key('quiz-next')),
      300,
      scrollable: find.byType(Scrollable).first,
    );
    expect(find.byKey(const Key('quiz-next')), findsOneWidget);
  });

  testWidgets('practice tab opens the signs quiz', (tester) async {
    await pumpApp(tester);

    await tester.tap(find.byKey(const Key('nav-practice')));
    await tester.pumpAndSettle();

    expect(find.text('Practice quizzes'), findsOneWidget);
    await tester.tap(find.byKey(const Key('quiz-signs')));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('quiz-prompt')), findsOneWidget);
  });

  testWidgets('French toggle switches chrome and persists', (tester) async {
    SharedPreferences.setMockInitialValues({});
    var state = await AppState.load();
    await tester.pumpWidget(LicencePrepApp(state: state));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('lang-fr')).first);
    await tester.pumpAndSettle();
    expect(find.text('Permis canadien'), findsOneWidget);
    expect(find.text('Suivi'), findsOneWidget);

    final prefs = await SharedPreferences.getInstance();
    expect(prefs.getString('licence_prep.locale'), 'fr');

    state = await AppState.load();
    await tester.pumpWidget(LicencePrepApp(state: state));
    await tester.pumpAndSettle();
    expect(find.text('Permis canadien'), findsOneWidget);

    await tester.tap(find.byKey(const Key('nav-progress')));
    await tester.pumpAndSettle();
    expect(find.text('Votre parcours'), findsOneWidget);
    expect(find.text('Your progress'), findsNothing);
  });

  testWidgets('progress tab tracks a province on device', (tester) async {
    tester.view.physicalSize = const Size(800, 1400);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await pumpApp(tester);

    await tester.tap(find.byKey(const Key('nav-progress')));
    await tester.pumpAndSettle();
    expect(find.text('Your progress'), findsOneWidget);

    await tester.tap(find.byKey(const Key('goal-province')));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Ontario').last);
    await tester.pumpAndSettle();

    expect(find.textContaining('Checklist for Ontario'), findsOneWidget);
    final knowledge = find.descendant(
      of: find.byKey(const Key('check-ON.knowledge')),
      matching: find.byType(Checkbox),
    );
    await tester.scrollUntilVisible(
      knowledge,
      400,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.ensureVisible(knowledge);
    await tester.pumpAndSettle();
    await tester.tap(knowledge);
    await tester.pumpAndSettle();

    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString('licence_prep.progress.v1');
    expect(raw, isNotNull);
    expect(raw, contains('ON.knowledge'));
    expect(raw, contains('"accountId":null'));
  });
}
