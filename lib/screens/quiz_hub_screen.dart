import 'package:flutter/material.dart';

import '../data/catalog.dart';
import '../data/quizzes.dart';
import '../models/quiz.dart';
import '../widgets/disclaimer_banner.dart';
import 'quiz_session_screen.dart';

class QuizHubScreen extends StatelessWidget {
  const QuizHubScreen({
    super.key,
    this.jurisdictionCode,
    this.embedded = false,
  });

  final String? jurisdictionCode;
  final bool embedded;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final where = jurisdictionCode == null
        ? 'Canada-wide study items, plus a few province-specific examples.'
        : 'Questions for ${jurisdictionByCode(jurisdictionCode!)?.name ?? jurisdictionCode}, plus Canada-wide items.';
    final content = ListView(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
      children: [
        Text(
          'Practice quizzes',
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          where,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 16),
        const DisclaimerBanner(practice: true),
        const SizedBox(height: 16),
        for (final quiz in allQuizzes) ...[
          _QuizCard(quiz: quiz, jurisdictionCode: jurisdictionCode),
          const SizedBox(height: 10),
        ],
      ],
    );
    if (embedded) return SafeArea(child: content);
    return Scaffold(
      appBar: AppBar(title: const Text('Practice')),
      body: content,
    );
  }
}

class _QuizCard extends StatelessWidget {
  const _QuizCard({required this.quiz, required this.jurisdictionCode});

  final PracticeQuiz quiz;
  final String? jurisdictionCode;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final count = questionsForQuiz(
      quiz,
      jurisdictionCode: jurisdictionCode,
    ).length;
    return Card(
      key: Key('quiz-${quiz.id}'),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: count == 0
            ? null
            : () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) => QuizSessionScreen(
                      quiz: quiz,
                      jurisdictionCode: jurisdictionCode,
                    ),
                  ),
                );
              },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(Icons.menu_book_outlined, color: theme.colorScheme.primary),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      quiz.title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      quiz.subtitle,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '$count questions · unofficial',
                      style: theme.textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}
