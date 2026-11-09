import '../data/quiz_fr.dart';
import '../l10n/app_locale.dart';

class PracticeQuestion {
  const PracticeQuestion({
    required this.id,
    required this.prompt,
    required this.choices,
    required this.correctIndex,
    required this.explanation,
    required this.topic,
    this.sourceNote =
        'Unofficial study question based on common handbook topics.',
    this.appliesTo = const [],
  });

  final String id;
  final String prompt;
  final List<String> choices;
  final int correctIndex;
  final String explanation;
  final String topic;

  /// Empty means the item is written as a Canada-wide study prompt.
  final List<String> appliesTo;
  final String sourceNote;

  bool get isNational => appliesTo.isEmpty;

  bool isCorrect(int index) => index == correctIndex;

  FrQuestion? get _fr => quizFr[id];

  String promptOf(AppLocale locale) =>
      locale.isFr ? (_fr?.prompt ?? prompt) : prompt;

  List<String> choicesOf(AppLocale locale) =>
      locale.isFr ? (_fr?.choices ?? choices) : choices;

  String explanationOf(AppLocale locale) =>
      locale.isFr ? (_fr?.explanation ?? explanation) : explanation;

  String topicOf(AppLocale locale) =>
      locale.isFr ? (_fr?.topic ?? topic) : topic;

  String sourceNoteOf(AppLocale locale) =>
      locale.isFr ? (_fr?.sourceNote ?? sourceNote) : sourceNote;
}

class PracticeQuiz {
  const PracticeQuiz({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.questionIds,
    this.sampleSize,
  });

  final String id;
  final String title;
  final String subtitle;
  final List<String> questionIds;

  /// If set, a random subset of this size is used for a sitting.
  final int? sampleSize;

  String titleOf(AppLocale locale) =>
      locale.isFr ? (quizMetaFr[id]?.$1 ?? title) : title;

  String subtitleOf(AppLocale locale) =>
      locale.isFr ? (quizMetaFr[id]?.$2 ?? subtitle) : subtitle;
}

class QuizAttempt {
  QuizAttempt({required this.quiz, required this.questions})
    : answers = List<int?>.filled(questions.length, null);

  final PracticeQuiz quiz;
  final List<PracticeQuestion> questions;
  final List<int?> answers;

  int get answeredCount => answers.where((a) => a != null).length;

  int get correctCount {
    var n = 0;
    for (var i = 0; i < questions.length; i++) {
      final answer = answers[i];
      if (answer != null && questions[i].isCorrect(answer)) n++;
    }
    return n;
  }

  bool get isComplete => answers.every((a) => a != null);

  double get percent =>
      questions.isEmpty ? 0 : correctCount / questions.length * 100;
}
