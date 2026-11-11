import 'package:flutter/material.dart';

import '../data/quizzes.dart';
import '../data/theory_content.dart';
import '../models/quiz.dart';
import '../state/app_state.dart';
import '../widgets/disclaimer_banner.dart';
import '../widgets/hero_header.dart';
import 'quiz_session_screen.dart';
import 'theory_topic_screen.dart';

class QuizHubScreen extends StatelessWidget {
  const QuizHubScreen({super.key, this.jurisdictionCode});

  final String? jurisdictionCode;

  @override
  Widget build(BuildContext context) {
    final s = AppScope.s(context);
    final quizzes = allQuizzes;
    final body = ListView(
      key: const Key('quiz-hub-list'),
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 32),
      children: [
        const DisclaimerBanner(practice: true),
        const SizedBox(height: 16),
        Text(s.quizHubBody, style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: 16),
        _SavedAndWeak(jurisdictionCode: jurisdictionCode),
        for (final quiz in quizzes) ...[
          _QuizCard(quiz: quiz, jurisdictionCode: jurisdictionCode),
          const SizedBox(height: 10),
        ],
      ],
    );

    if (jurisdictionCode != null) {
      return Scaffold(
        appBar: AppBar(title: Text(s.practiceQuizzes)),
        body: body,
      );
    }

    return Column(
      children: [
        HeroHeader(title: s.practiceQuizzes, subtitle: s.quizHubLead),
        Expanded(child: body),
      ],
    );
  }
}

class _SavedAndWeak extends StatelessWidget {
  const _SavedAndWeak({this.jurisdictionCode});

  final String? jurisdictionCode;

  @override
  Widget build(BuildContext context) {
    final s = AppScope.s(context);
    final locale = AppScope.of(context).locale;
    final study = AppScope.of(context).study;
    final ids = study.savedTopicIds
        .where((id) => theoryTopicById(id) != null)
        .toList();
    if (ids.isEmpty) return const SizedBox.shrink();
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Card(
        key: const Key('saved-weak-card'),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(s.savedTopics, style: theme.textTheme.titleMedium),
              const SizedBox(height: 6),
              Text(s.weakTopicsBody),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (final id in ids)
                    ActionChip(
                      key: Key('practice-saved-$id'),
                      label: Text(
                        [
                          theoryTopicById(id)!.title.of(locale),
                          if ((study.weakCounts[id] ?? 0) > 0)
                            s.missedCount(study.weakCounts[id]!),
                        ].join(' · '),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (_) => TheoryTopicScreen(
                              topic: theoryTopicById(id)!,
                              jurisdictionCode: jurisdictionCode,
                            ),
                          ),
                        );
                      },
                    ),
                ],
              ),
              const SizedBox(height: 12),
              FilledButton(
                key: const Key('quiz-weak'),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (_) => QuizSessionScreen(
                        quiz: weakQuiz,
                        jurisdictionCode: jurisdictionCode,
                        topicIds: ids.toSet(),
                      ),
                    ),
                  );
                },
                child: Text(s.practiceSavedTopics),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _QuizCard extends StatelessWidget {
  const _QuizCard({required this.quiz, this.jurisdictionCode});

  final PracticeQuiz quiz;
  final String? jurisdictionCode;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final s = AppScope.s(context);
    final locale = AppScope.of(context).locale;
    void open() {
      Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (_) =>
              QuizSessionScreen(quiz: quiz, jurisdictionCode: jurisdictionCode),
        ),
      );
    }

    return Card(
      key: Key('quiz-${quiz.id}'),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: open,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(quiz.titleOf(locale), style: theme.textTheme.titleMedium),
              const SizedBox(height: 6),
              Text(quiz.subtitleOf(locale)),
              const SizedBox(height: 12),
              FilledButton(
                onPressed: open,
                child: Text(
                  quiz.isScoredMock ? s.startMockExam : s.startPractice,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
