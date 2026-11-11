import 'package:flutter/material.dart';

import '../data/progress_template.dart';
import '../data/theory_content.dart';
import '../models/quiz.dart';
import '../state/app_state.dart';
import '../widgets/disclaimer_banner.dart';
import 'quiz_session_screen.dart';
import 'theory_topic_screen.dart';

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

  Set<String> get _missedTopics {
    final ids = <String>{};
    for (var i = 0; i < questions.length; i++) {
      if (answers[i] != questions[i].correctIndex) {
        ids.add(questions[i].topicId);
      }
    }
    return ids;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final s = AppScope.s(context);
    final locale = AppScope.of(context).locale;
    final total = questions.length;
    final percent = total == 0 ? 0 : ((score / total) * 100).round();
    final threshold = quiz.unofficialPassPercent;
    final missed = _missedTopics;

    return Scaffold(
      appBar: AppBar(title: Text(s.practiceResult)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: [
          const DisclaimerBanner(practice: true),
          const SizedBox(height: 20),
          Text(
            s.youScored(score, total),
            style: theme.textTheme.displaySmall,
          ),
          if (threshold != null) ...[
            const SizedBox(height: 8),
            Text(
              s.scorePercent(percent),
              key: const Key('mock-percent'),
              style: theme.textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(
              percent >= threshold ? s.unofficialPass : s.unofficialFail,
              key: const Key('mock-threshold'),
              style: theme.textTheme.titleMedium?.copyWith(
                color: percent >= threshold
                    ? theme.colorScheme.primary
                    : theme.colorScheme.error,
              ),
            ),
            const SizedBox(height: 8),
            Text(s.unofficialPassLabel(threshold)),
          ] else ...[
            const SizedBox(height: 8),
            Text(s.resultBody),
          ],
          if (missed.isNotEmpty) ...[
            const SizedBox(height: 16),
            Text(s.weakTopicsLead, style: theme.textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(s.weakTopicsBody),
            const SizedBox(height: 12),
            FilledButton.tonal(
              key: const Key('save-missed-topics'),
              onPressed: () async {
                await AppScope.of(context).bookmarkTopics(missed);
                if (!context.mounted) return;
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(s.topicsSaved)));
              },
              child: Text(s.saveMissedTopics),
            ),
            const SizedBox(height: 8),
            for (final id in missed)
              if (theoryTopicById(id) != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: OutlinedButton(
                    key: Key('open-missed-$id'),
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
                    child: Text(
                      s.reviewTopic(theoryTopicById(id)!.title.of(locale)),
                    ),
                  ),
                ),
          ],
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
            _ReviewRow(
              question: questions[i],
              picked: answers[i],
              onSaveTopic: () => AppScope.of(
                context,
              ).bookmarkTopics([questions[i].topicId]),
            ),
        ],
      ),
    );
  }
}

class _ReviewRow extends StatelessWidget {
  const _ReviewRow({
    required this.question,
    required this.picked,
    required this.onSaveTopic,
  });

  final PracticeQuestion question;
  final int? picked;
  final VoidCallback onSaveTopic;

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
              Row(
                children: [
                  Expanded(
                    child: Text(
                      ok ? s.correct : s.missed,
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: ok
                            ? theme.colorScheme.primary
                            : theme.colorScheme.error,
                      ),
                    ),
                  ),
                  if (!ok)
                    TextButton(
                      onPressed: onSaveTopic,
                      child: Text(s.saveTopic),
                    ),
                ],
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
