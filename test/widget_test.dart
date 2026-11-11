import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:licence_prep/app.dart';
import 'package:licence_prep/data/quizzes.dart';
import 'package:licence_prep/screens/quiz_result_screen.dart';
import 'package:licence_prep/state/app_state.dart';
import 'package:licence_prep/theme/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<LicencePrepApp> pumpApp(WidgetTester tester) async {
  SharedPreferences.setMockInitialValues({});
  final state = await AppState.load();
  final app = LicencePrepApp(state: state);
  await tester.pumpWidget(app);
  await tester.pumpAndSettle();
  return app;
}

Finder verticalScroll(Key key) {
  return find.descendant(
    of: find.byKey(key),
    matching: find.byWidgetPredicate(
      (widget) =>
          widget is Scrollable && widget.axisDirection == AxisDirection.down,
    ),
  );
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

    await tester.scrollUntilVisible(
      find.byKey(const Key('choice-0')),
      300,
      scrollable: verticalScroll(const Key('quiz-session-list')),
    );
    await tester.tap(find.byKey(const Key('choice-0')));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('quiz-feedback')), findsOneWidget);
    await tester.scrollUntilVisible(
      find.byKey(const Key('quiz-next')),
      300,
      scrollable: verticalScroll(const Key('quiz-session-list')),
    );
    expect(find.byKey(const Key('quiz-next')), findsOneWidget);
  });

  testWidgets('practice tab opens the signs quiz', (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await pumpApp(tester);

    await tester.tap(find.byKey(const Key('nav-practice')));
    await tester.pumpAndSettle();

    expect(find.text('Practice quizzes'), findsOneWidget);
    expect(find.byKey(const Key('quiz-mock')), findsOneWidget);
    await tester.scrollUntilVisible(
      find.byKey(const Key('quiz-signs')),
      300,
      scrollable: verticalScroll(const Key('quiz-hub-list')),
    );
    await tester.ensureVisible(
      find.descendant(
        of: find.byKey(const Key('quiz-signs')),
        matching: find.byType(FilledButton),
      ),
    );
    await tester.pumpAndSettle();
    await tester.tap(
      find.descendant(
        of: find.byKey(const Key('quiz-signs')),
        matching: find.byType(FilledButton),
      ),
    );
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

  testWidgets('theory lesson then a sign quiz shows a graphic', (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await pumpApp(tester);

    await tester.tap(find.byKey(const Key('nav-theory')));
    await tester.pumpAndSettle();
    expect(find.text('Theory'), findsWidgets);
    await tester.scrollUntilVisible(
      find.byKey(const Key('theory-signs')),
      300,
      scrollable: verticalScroll(const Key('theory-list')),
    );
    expect(find.byKey(const Key('theory-signs')), findsOneWidget);
    await tester.ensureVisible(
      find.descendant(
        of: find.byKey(const Key('theory-signs')),
        matching: find.byType(FilledButton),
      ),
    );
    await tester.pumpAndSettle();
    await tester.tap(
      find.descendant(
        of: find.byKey(const Key('theory-signs')),
        matching: find.byType(FilledButton),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.textContaining('How signs are grouped'), findsOneWidget);

    await tester.scrollUntilVisible(
      find.byKey(const Key('theory-quiz-signs')),
      400,
      scrollable: verticalScroll(const Key('theory-topic-list')),
    );
    await tester.tap(find.byKey(const Key('theory-quiz-signs')));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('quiz-sign')), findsOneWidget);
    expect(find.byKey(const Key('quiz-prompt')), findsOneWidget);
    expect(find.text('What does this sign mean?'), findsOneWidget);
  });

  testWidgets('French theory tab and sign prompt', (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    SharedPreferences.setMockInitialValues({});
    final state = await AppState.load();
    await tester.pumpWidget(LicencePrepApp(state: state));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('lang-fr')).first);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('nav-theory')));
    await tester.pumpAndSettle();
    expect(find.text('Théorie'), findsWidgets);
    await tester.scrollUntilVisible(
      find.byKey(const Key('theory-signs')),
      300,
      scrollable: verticalScroll(const Key('theory-list')),
    );

    await tester.ensureVisible(
      find.descendant(
        of: find.byKey(const Key('theory-signs')),
        matching: find.byType(FilledButton),
      ),
    );
    await tester.pumpAndSettle();
    await tester.tap(
      find.descendant(
        of: find.byKey(const Key('theory-signs')),
        matching: find.byType(FilledButton),
      ),
    );
    await tester.pumpAndSettle();
    expect(
      find.textContaining('Comment les panneaux sont groupés'),
      findsOneWidget,
    );

    await tester.scrollUntilVisible(
      find.byKey(const Key('theory-quiz-sign-identify')),
      400,
      scrollable: verticalScroll(const Key('theory-topic-list')),
    );
    await tester.tap(find.byKey(const Key('theory-quiz-sign-identify')));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('quiz-sign')), findsOneWidget);
    expect(find.text('Que signifie ce panneau?'), findsOneWidget);
  });

  testWidgets('progress tab tracks a province on device', (tester) async {
    tester.view.physicalSize = const Size(390, 844);
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

    expect(find.textContaining('Trail — Ontario'), findsOneWidget);
    expect(find.byKey(const Key('progress-car')), findsOneWidget);
    expect(find.byKey(const Key('gdl-wait-times')), findsOneWidget);
    final knowledge = find.byKey(const Key('check-ON.knowledge'));
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

  testWidgets('progress shows cited GDL stage times, not invented queues', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await pumpApp(tester);
    await tester.tap(find.byKey(const Key('nav-progress')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('goal-province')));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Ontario').last);
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('gdl-wait-times')));
    await tester.pumpAndSettle();

    expect(find.text('Official GDL stage times'), findsWidgets);
    expect(find.textContaining('Usually 12 months'), findsOneWidget);
    expect(
      find.textContaining('This is not a booking-queue estimate'),
      findsOneWidget,
    );
    await tester.scrollUntilVisible(
      find.text('Open the official handbook or guide'),
      200,
      scrollable: find
          .descendant(
            of: find.byType(DraggableScrollableSheet),
            matching: find.byType(Scrollable),
          )
          .first,
    );
    expect(find.text('Open the official handbook or guide'), findsOneWidget);
  });

  testWidgets('theory bookmark persists on device', (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await pumpApp(tester);
    await tester.tap(find.byKey(const Key('nav-theory')));
    await tester.pumpAndSettle();
    await tester.scrollUntilVisible(
      find.byKey(const Key('theory-signs')),
      300,
      scrollable: verticalScroll(const Key('theory-list')),
    );
    await tester.ensureVisible(
      find.descendant(
        of: find.byKey(const Key('theory-signs')),
        matching: find.byType(FilledButton),
      ),
    );
    await tester.pumpAndSettle();
    await tester.tap(
      find.descendant(
        of: find.byKey(const Key('theory-signs')),
        matching: find.byType(FilledButton),
      ),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('bookmark-signs')));
    await tester.pumpAndSettle();

    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString('licence_prep.study.v1');
    expect(raw, isNotNull);
    expect(raw, contains('signs'));
    expect(prefs.getString('licence_prep.progress.v1'), isNull);
  });

  testWidgets('mock result shows unofficial percent and can save a weak topic', (
    tester,
  ) async {
    SharedPreferences.setMockInitialValues({});
    final state = await AppState.load();
    final questions = questionsForQuiz(signsQuiz).take(5).toList();
    final wrong =
        (questions.first.correctIndex + 1) % questions.first.choices.length;
    await tester.pumpWidget(
      AppScope(
        state: state,
        child: ListenableBuilder(
          listenable: state,
          builder: (context, _) {
            return MaterialApp(
              theme: AppTheme.light(),
              home: QuizResultScreen(
                quiz: mockQuiz,
                questions: questions,
                score: 4,
                answers: {
                  0: wrong,
                  for (var i = 1; i < questions.length; i++)
                    i: questions[i].correctIndex,
                },
              ),
            );
          },
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('mock-percent')), findsOneWidget);
    expect(find.textContaining('Score: 80%'), findsOneWidget);
    expect(find.byKey(const Key('mock-threshold')), findsOneWidget);
    expect(find.textContaining('Unofficial study threshold: 80%'), findsOneWidget);
    await tester.tap(find.byKey(const Key('save-missed-topics')));
    await tester.pumpAndSettle();
    final prefs = await SharedPreferences.getInstance();
    expect(prefs.getString('licence_prep.study.v1'), contains('signs'));
  });
}
