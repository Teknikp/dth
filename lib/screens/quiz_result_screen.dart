import 'package:flutter/material.dart';

import '../data/progress_template.dart';
import '../models/quiz.dart';
import '../state/app_state.dart';
import '../widgets/disclaimer_banner.dart';
import 'quiz_session_screen.dart';

class QuizResultScreen extends StatelessWidget {
  const QuizResultScreen({
    super.key,
    required this.quiz,
    required this.questions,
    required this.score,
    required this.answers,
    this.jurisdictionCode,
  });

  final PracticeQuiz quiz;
  final List<PracticeQuestion> questions;
  final int score;
  final Map<int, int> answers;
  final String? jurisdictionCode;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final s = AppScope.s(context);
    return Scaffold(
      appBar: AppBar(title: Text(s.practiceResult)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: [
          const DisclaimerBanner(practice: true),
          const SizedBox(height: 20),
          Text(
            s.youScored(score, questions.length),
            style: theme.textTheme.displaySmall,
          ),
          const SizedBox(height: 8),
          Text(s.resultBody),
          const SizedBox(height: 20),
          FilledButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute<void>(
                  builder: (_) => QuizSessionScreen(
                    quiz: quiz,
                    jurisdictionCode: jurisdictionCode,
                  ),
                ),
              );
            },
            child: Text(s.tryAgain),
          ),
          const SizedBox(height: 8),
          OutlinedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(s.backToQuizzes),
          ),
          if (jurisdictionCode != null) ...[
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: () async {
                final state = AppScope.of(context);
                final goal = state.progress.activeGoal;
                if (goal != null && goal.jurisdictionCode == jurisdictionCode) {
                  await state.toggleCheck(
                    knowledgeItemId(jurisdictionCode!),
                    done: true,
                  );
                }
                if (!context.mounted) return;
                Navigator.of(context).pop();
              },
              child: Text(s.markKnowledgeDone),
            ),
          ],
          const SizedBox(height: 24),
          for (var i = 0; i < questions.length; i++)
            _ReviewRow(question: questions[i], picked: answers[i]),
        ],
      ),
    );
  }
}

class _ReviewRow extends StatelessWidget {
  const _ReviewRow({required this.question, required this.picked});

  final PracticeQuestion question;
  final int? picked;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final s = AppScope.s(context);
    final locale = AppScope.of(context).locale;
    final ok = picked == question.correctIndex;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ok ? s.correct : s.missed,
                style: theme.textTheme.labelLarge?.copyWith(
                  color: ok
                      ? theme.colorScheme.primary
                      : theme.colorScheme.error,
                ),
              ),
              const SizedBox(height: 6),
              Text(question.promptOf(locale)),
            ],
          ),
        ),
      ),
    );
  }
}
