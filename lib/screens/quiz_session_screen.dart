import 'package:flutter/material.dart';

import '../data/quizzes.dart';
import '../models/quiz.dart';
import '../widgets/disclaimer_banner.dart';
import 'quiz_result_screen.dart';

class QuizSessionScreen extends StatefulWidget {
  const QuizSessionScreen({
    super.key,
    required this.quiz,
    this.jurisdictionCode,
  });

  final PracticeQuiz quiz;
  final String? jurisdictionCode;

  @override
  State<QuizSessionScreen> createState() => _QuizSessionScreenState();
}

class _QuizSessionScreenState extends State<QuizSessionScreen> {
  late final QuizAttempt attempt;
  var index = 0;
  var revealed = false;

  @override
  void initState() {
    super.initState();
    attempt = QuizAttempt(
      quiz: widget.quiz,
      questions: questionsForQuiz(
        widget.quiz,
        jurisdictionCode: widget.jurisdictionCode,
      ),
    );
  }

  PracticeQuestion get current => attempt.questions[index];

  void _choose(int choice) {
    if (revealed) return;
    setState(() {
      attempt.answers[index] = choice;
      revealed = true;
    });
  }

  void _next() {
    if (index + 1 >= attempt.questions.length) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute<void>(
          builder: (_) => QuizResultScreen(
            attempt: attempt,
            jurisdictionCode: widget.jurisdictionCode,
          ),
        ),
      );
      return;
    }
    setState(() {
      index++;
      revealed = attempt.answers[index] != null;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (attempt.questions.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text(widget.quiz.title)),
        body: const Center(child: Text('No questions in this set.')),
      );
    }
    final theme = Theme.of(context);
    final selected = attempt.answers[index];
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.quiz.title),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(6),
          child: LinearProgressIndicator(
            value: (index + (revealed ? 1 : 0)) / attempt.questions.length,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
        children: [
          const DisclaimerBanner(practice: true, compact: true),
          const SizedBox(height: 16),
          Text(
            'Question ${index + 1} of ${attempt.questions.length}',
            style: theme.textTheme.labelLarge?.copyWith(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            current.prompt,
            key: const Key('quiz-prompt'),
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 16),
          for (var i = 0; i < current.choices.length; i++) ...[
            _ChoiceTile(
              index: i,
              label: current.choices[i],
              selected: selected == i,
              revealed: revealed,
              isCorrect: current.isCorrect(i),
              onTap: () => _choose(i),
            ),
            const SizedBox(height: 8),
          ],
          if (revealed) ...[
            const SizedBox(height: 8),
            DecoratedBox(
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      selected != null && current.isCorrect(selected)
                          ? 'Correct'
                          : 'Not quite',
                      key: const Key('quiz-feedback'),
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(current.explanation),
                    const SizedBox(height: 8),
                    Text(
                      current.sourceNote,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            FilledButton(
              key: const Key('quiz-next'),
              onPressed: _next,
              child: Text(
                index + 1 >= attempt.questions.length
                    ? 'See results'
                    : 'Next question',
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _ChoiceTile extends StatelessWidget {
  const _ChoiceTile({
    required this.index,
    required this.label,
    required this.selected,
    required this.revealed,
    required this.isCorrect,
    required this.onTap,
  });

  final int index;
  final String label;
  final bool selected;
  final bool revealed;
  final bool isCorrect;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    Color? color;
    if (revealed && isCorrect) {
      color = scheme.primaryContainer;
    } else if (revealed && selected && !isCorrect) {
      color = scheme.errorContainer;
    } else if (selected) {
      color = scheme.secondaryContainer;
    }
    return Card(
      color: color ?? Colors.white,
      child: InkWell(
        key: Key('choice-$index'),
        onTap: revealed ? null : onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              CircleAvatar(
                radius: 14,
                backgroundColor: scheme.surfaceContainerHighest,
                child: Text(String.fromCharCode(65 + index)),
              ),
              const SizedBox(width: 12),
              Expanded(child: Text(label)),
            ],
          ),
        ),
      ),
    );
  }
}
