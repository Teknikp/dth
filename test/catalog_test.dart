import 'package:flutter_test/flutter_test.dart';
import 'package:licence_prep/data/catalog.dart';
import 'package:licence_prep/data/quizzes.dart';
import 'package:licence_prep/models/jurisdiction.dart';
import 'package:licence_prep/models/quiz.dart';

void main() {
  test('covers all 13 provinces and territories', () {
    expect(
      allJurisdictions.map((j) => j.code).toSet(),
      expectedJurisdictionCodes,
    );
    expect(allJurisdictions, hasLength(13));
  });

  test('every jurisdiction has official https sources and a handbook link', () {
    for (final item in allJurisdictions) {
      expect(item.sources, isNotEmpty, reason: item.code);
      for (final link in item.sources) {
        expect(
          link.url,
          startsWith('https://'),
          reason: '${item.code} ${link.label}',
        );
      }
      expect(item.handbookUrl, startsWith('https://'), reason: item.code);
      expect(item.stages, isNotEmpty, reason: item.code);
    }
  });

  test('unpublished fees include a note instead of a made-up amount', () {
    for (final item in allJurisdictions) {
      for (final fee in item.fees) {
        expect(fee.note, isNotEmpty, reason: '${item.code} ${fee.label}');
        if (!fee.isPublished) {
          expect(fee.amount, isNull);
        }
      }
    }
  });

  test('Nunavut is marked as thin official data', () {
    expect(jurisdictionByCode('NU')!.dataDepth, DataDepth.thin);
  });

  test('search finds Ontario by name and code', () {
    expect(searchJurisdictions('ont').single.code, 'ON');
    expect(searchJurisdictions('ON').single.code, 'ON');
    expect(searchJurisdictions('Ontario').single.code, 'ON');
  });

  test('quiz items have a valid correct index and explanation', () {
    expect(allQuestions, isNotEmpty);
    for (final q in allQuestions) {
      expect(q.choices.length, greaterThanOrEqualTo(2), reason: q.id);
      expect(
        q.correctIndex,
        inInclusiveRange(0, q.choices.length - 1),
        reason: q.id,
      );
      expect(q.explanation, isNotEmpty, reason: q.id);
    }
  });

  test('quiz scoring counts only correct answers', () {
    final questions = questionsForQuiz(signsQuiz);
    final attempt = QuizAttempt(quiz: signsQuiz, questions: questions);
    attempt.answers[0] = questions[0].correctIndex;
    if (questions.length > 1) {
      attempt.answers[1] =
          (questions[1].correctIndex + 1) % questions[1].choices.length;
    }
    expect(attempt.correctCount, 1);
    expect(attempt.answeredCount, 2);
  });

  test('mixed practice returns 20 questions', () {
    final questions = questionsForQuiz(mixedQuiz, seed: 7);
    expect(questions, hasLength(20));
  });
}
