import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:licence_prep/data/catalog.dart';
import 'package:licence_prep/data/french/catalog_fr.dart';
import 'package:licence_prep/data/progress_template.dart';
import 'package:licence_prep/data/quiz_fr.dart';
import 'package:licence_prep/data/quiz_fr_extra.dart';
import 'package:licence_prep/data/quizzes.dart';
import 'package:licence_prep/data/road_signs.dart';
import 'package:licence_prep/data/theory_content.dart';
import 'package:licence_prep/models/jurisdiction.dart';
import 'package:licence_prep/models/progress.dart';
import 'package:licence_prep/models/quiz.dart';
import 'package:licence_prep/models/study.dart';

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

  test('mixed practice returns 30 questions', () {
    final questions = questionsForQuiz(mixedQuiz, seed: 7);
    expect(questions, hasLength(30));
  });

  test('mock exam is a 40-question unofficial sitting', () {
    expect(mockQuiz.sampleSize, 40);
    expect(mockQuiz.unofficialPassPercent, 80);
    expect(questionsForQuiz(mockQuiz, seed: 3), hasLength(40));
    final attempt = QuizAttempt(
      quiz: mockQuiz,
      questions: questionsForQuiz(mockQuiz, seed: 3),
    );
    for (var i = 0; i < 32; i++) {
      attempt.answers[i] = attempt.questions[i].correctIndex;
    }
    expect(attempt.percent, closeTo(80, 0.05));
  });

  test('topic quizzes are longer than a handful of items', () {
    expect(questionsForQuiz(signsQuiz).length, greaterThanOrEqualTo(15));
    expect(questionsForQuiz(rulesQuiz).length, greaterThanOrEqualTo(15));
    expect(questionsForQuiz(gdlQuiz).length, greaterThanOrEqualTo(8));
    expect(questionsForQuiz(pointsQuiz).length, greaterThanOrEqualTo(15));
    expect(allQuestions.length, greaterThanOrEqualTo(80));
    expect(
      questionsForQuiz(mockQuiz, jurisdictionCode: 'ON', seed: 2),
      hasLength(40),
    );
    expect(
      questionsForQuiz(pointsQuiz, jurisdictionCode: 'ON')
          .map((q) => q.id)
          .toSet(),
      containsAll(['pts-on-15', 'pts-not-national']),
    );
    expect(
      questionsForQuiz(pointsQuiz, jurisdictionCode: 'ON').map((q) => q.id),
      isNot(contains('pts-qc-25')),
    );
  });

  test('every jurisdiction has a French overlay of matching shape', () {
    for (final item in allJurisdictions) {
      final fr = frenchFor(item.code);
      expect(fr, isNotNull, reason: item.code);
      expect(fr!.stages, hasLength(item.stages.length), reason: item.code);
      expect(fr.fees, hasLength(item.fees.length), reason: item.code);
      expect(fr.sources, hasLength(item.sources.length), reason: item.code);
      expect(fr.name, isNotEmpty);
      expect(fr.parentalConsent, isNotEmpty);
      expect(fr.knowledgeTest.summary, isNotEmpty);
    }
  });

  test('every quiz question has French copy with the same choice count', () {
    for (final q in allQuestions) {
      final fr = quizFr[q.id] ?? quizFrExtra[q.id];
      expect(fr, isNotNull, reason: q.id);
      expect(fr!.choices, hasLength(q.choices.length), reason: q.id);
      expect(fr.prompt, isNotEmpty, reason: q.id);
      expect(fr.explanation, isNotEmpty, reason: q.id);
    }
  });

  test('progress document round-trips with a null accountId', () {
    final now = DateTime.utc(2026, 11, 9);
    final doc = ProgressDocument(
      accountId: null,
      updatedAt: now,
      activeGoalId: 'goal_ON_1',
      goals: [
        LicenceGoal(
          id: 'goal_ON_1',
          jurisdictionCode: 'ON',
          kind: LicenceGoal.firstPassengerLicence,
          createdAt: now,
          updatedAt: now,
          checks: {'ON.knowledge': ProgressCheck(done: true, updatedAt: now)},
        ),
      ],
    );
    final copy = ProgressDocument.fromJson(doc.toJson());
    expect(copy.accountId, isNull);
    expect(copy.activeGoalId, 'goal_ON_1');
    expect(copy.activeGoal!.isDone('ON.knowledge'), isTrue);
    expect(copy.toJson()['schemaVersion'], 1);
  });

  test('study bookmarks stay off the progress JSON key', () {
    final now = DateTime.utc(2026, 11, 11);
    final doc = StudyDocument(
      updatedAt: now,
      bookmarks: {'signs', 'points'},
      weakCounts: {'rules': 2},
    );
    final copy = StudyDocument.fromJson(doc.toJson());
    expect(copy.bookmarks, {'points', 'signs'});
    expect(copy.weakCounts['rules'], 2);
    expect(copy.toJson()['schemaVersion'], 1);
    expect(StudyDocument.storageKey, isNot(ProgressDocument.storageKey));
  });

  test('sign drawings exist and quiz signIds resolve', () {
    for (final sign in allRoadSigns) {
      expect(File(sign.asset).existsSync(), isTrue, reason: sign.id);
    }
    for (final q in allQuestions) {
      if (q.signId == null) continue;
      expect(roadSignById(q.signId), isNotNull, reason: q.id);
    }
    for (final q in questionsForQuiz(signIdentifyQuiz)) {
      expect(q.signId, isNotNull, reason: q.id);
    }
    expect(allRoadSigns.length, greaterThanOrEqualTo(30));
  });

  test('theory topics are bilingual and point at real quizzes', () {
    expect(allTheoryTopics.map((t) => t.id).toSet(), {
      'signs',
      'rules',
      'impairment',
      'winter',
      'gdl',
      'points',
    });
    final quizIds = allQuizzes.map((q) => q.id).toSet();
    for (final topic in allTheoryTopics) {
      expect(topic.title.fr, isNotEmpty, reason: topic.id);
      expect(topic.lead.fr, isNotEmpty, reason: topic.id);
      expect(topic.sections, isNotEmpty, reason: topic.id);
      for (final section in topic.sections) {
        expect(section.heading.fr, isNotEmpty, reason: topic.id);
        expect(section.body.fr, isNotEmpty, reason: topic.id);
        for (final signId in section.signIds) {
          expect(
            roadSignById(signId),
            isNotNull,
            reason: '${topic.id} $signId',
          );
        }
      }
      expect(topic.quizIds, isNotEmpty, reason: topic.id);
      for (final id in topic.quizIds) {
        expect(quizIds, contains(id), reason: topic.id);
      }
    }
  });

  test('points topic cites official https sources for every jurisdiction', () {
    final topic = theoryTopicById('points')!;
    expect(topic.showAllNotesWhenNational, isTrue);
    expect(topic.notesFor(null), hasLength(expectedJurisdictionCodes.length));
    for (final code in expectedJurisdictionCodes) {
      final notes = topic.notesFor(code);
      expect(notes, isNotEmpty, reason: code);
      expect(notes.first.sources, isNotEmpty, reason: code);
      for (final link in notes.first.sources) {
        expect(link.url, startsWith('https://'), reason: '$code ${link.label}');
      }
      expect(notes.first.body.fr, isNotEmpty, reason: code);
    }
  });

  test('progress items include knowledge, vision, road, and GDL waits', () {
    final items = progressItemsFor(jurisdictionByCode('ON')!);
    expect(
      items.map((i) => i.id),
      containsAll(['ON.knowledge', 'ON.vision', 'ON.road']),
    );
    expect(items.any((i) => i.id.startsWith('ON.gdl.')), isTrue);
  });
}
