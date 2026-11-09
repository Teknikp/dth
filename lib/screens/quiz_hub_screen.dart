import 'package:flutter/material.dart';

import '../data/quizzes.dart';
import '../models/quiz.dart';
import '../state/app_state.dart';
import '../widgets/disclaimer_banner.dart';
import '../widgets/hero_header.dart';
import 'quiz_session_screen.dart';

class QuizHubScreen extends StatelessWidget {
  const QuizHubScreen({super.key, this.jurisdictionCode});

  final String? jurisdictionCode;

  @override
  Widget build(BuildContext context) {
    final s = AppScope.s(context);
    final quizzes = allQuizzes;
    final body = ListView(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 32),
      children: [
        const DisclaimerBanner(practice: true),
        const SizedBox(height: 16),
        Text(s.quizHubBody, style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: 16),
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
              FilledButton(onPressed: open, child: Text(s.startPractice)),
            ],
          ),
        ),
      ),
    );
  }
}
