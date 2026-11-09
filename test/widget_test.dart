import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:licence_prep/app.dart';

void main() {
  testWidgets('province pick shows requirements then a practice quiz', (
    tester,
  ) async {
    await tester.pumpWidget(const LicencePrepApp());
    await tester.pumpAndSettle();

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
    await tester.pumpWidget(const LicencePrepApp());
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('nav-practice')));
    await tester.pumpAndSettle();

    expect(find.text('Practice quizzes'), findsOneWidget);
    await tester.tap(find.byKey(const Key('quiz-signs')));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('quiz-prompt')), findsOneWidget);
  });
}
