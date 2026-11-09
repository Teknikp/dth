import 'package:flutter/material.dart';

import '../models/quiz.dart';
import '../widgets/disclaimer_banner.dart';
import 'quiz_session_screen.dart';

class QuizResultScreen extends StatelessWidget {
  const QuizResultScreen({
    super.key,
    required this.attempt,
    this.jurisdictionCode,
  });

  final QuizAttempt attempt;
  final String? jurisdictionCode;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final percent = attempt.percent.round();
    return Scaffold(
      appBar: AppBar(title: const Text('Results')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
        children: [
          const DisclaimerBanner(practice: true),
          const SizedBox(height: 20),
          Text(
            '$percent%',
            key: const Key('quiz-score'),
            style: theme.textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
          Text(
            '${attempt.correctCount} of ${attempt.questions.length} correct',
            style: theme.textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'This score is only for unofficial practice. It is not an official knowledge-test result.',
            style: theme.textTheme.bodySmall,
          ),
          const SizedBox(height: 20),
          FilledButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute<void>(
                  builder: (_) => QuizSessionScreen(
                    quiz: attempt.quiz,
                    jurisdictionCode: jurisdictionCode,
                  ),
                ),
              );
            },
            child: const Text('Try this set again'),
          ),
          const SizedBox(height: 20),
          Text(
            'Review',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          for (var i = 0; i < attempt.questions.length; i++)
            _ReviewTile(
              number: i + 1,
              question: attempt.questions[i],
              answer: attempt.answers[i],
            ),
        ],
      ),
    );
  }
}

class _ReviewTile extends StatelessWidget {
  const _ReviewTile({
    required this.number,
    required this.question,
    required this.answer,
  });

  final int number;
  final PracticeQuestion question;
  final int? answer;

  @override
  Widget build(BuildContext context) {
    final ok = answer != null && question.isCorrect(answer!);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              ok ? 'Q$number · correct' : 'Q$number · missed',
              style: Theme.of(context).textTheme.labelLarge
                  ?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 4),
            Text(question.prompt),
            const SizedBox(height: 6),
            Text(
              'Answer: ${question.choices[question.correctIndex]}',
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
