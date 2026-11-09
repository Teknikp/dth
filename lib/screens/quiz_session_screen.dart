import 'package:flutter/material.dart';

import '../data/quizzes.dart';
import '../models/quiz.dart';
import '../state/app_state.dart';
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
  late final List<PracticeQuestion> _questions;
  int _index = 0;
  int? _picked;
  int _score = 0;
  bool _revealed = false;
  final _answers = <int, int>{};

  @override
  void initState() {
    super.initState();
    _questions = questionsForQuiz(
      widget.quiz,
      jurisdictionCode: widget.jurisdictionCode,
    );
  }

  PracticeQuestion get _question => _questions[_index];

  void _select(int i) {
    if (_revealed) return;
    setState(() {
      _picked = i;
      _revealed = true;
      _answers[_index] = i;
      if (i == _question.correctIndex) _score++;
    });
  }

  void _next() {
    if (_index + 1 >= _questions.length) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute<void>(
          builder: (_) => QuizResultScreen(
            quiz: widget.quiz,
            questions: _questions,
            score: _score,
            answers: Map<int, int>.from(_answers),
            jurisdictionCode: widget.jurisdictionCode,
          ),
        ),
      );
      return;
    }
    setState(() {
      _index++;
      _picked = null;
      _revealed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final s = AppScope.s(context);
    final locale = AppScope.of(context).locale;
    if (_questions.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text(widget.quiz.titleOf(locale))),
        body: Center(child: Text(s.noQuestions)),
      );
    }
    final q = _question;
    final choices = q.choicesOf(locale);
    return Scaffold(
      appBar: AppBar(title: Text(s.questionOf(_index + 1, _questions.length))),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: [
          const DisclaimerBanner(compact: true, practice: true),
          const SizedBox(height: 16),
          LinearProgressIndicator(
            value: (_index + 1) / _questions.length,
            minHeight: 8,
            borderRadius: BorderRadius.circular(8),
          ),
          const SizedBox(height: 18),
          Text(q.topicOf(locale), style: theme.textTheme.labelLarge),
          const SizedBox(height: 8),
          Text(
            q.promptOf(locale),
            key: const Key('quiz-prompt'),
            style: theme.textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          for (var i = 0; i < choices.length; i++)
            _ChoiceTile(
              key: Key('choice-$i'),
              label: choices[i],
              selected: _picked == i,
              revealed: _revealed,
              correct: i == q.correctIndex,
              onTap: () => _select(i),
            ),
          const SizedBox(height: 12),
          if (_revealed)
            Card(
              key: const Key('quiz-feedback'),
              color: theme.colorScheme.surfaceContainerHighest,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _picked == q.correctIndex ? s.correct : s.notQuite,
                      style: theme.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(q.explanationOf(locale)),
                    const SizedBox(height: 8),
                    Text(
                      q.sourceNoteOf(locale),
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ),
          const SizedBox(height: 16),
          if (_revealed)
            FilledButton(
              key: const Key('quiz-next'),
              onPressed: _next,
              child: Text(
                _index + 1 >= _questions.length ? s.seeResults : s.nextQuestion,
              ),
            ),
        ],
      ),
    );
  }
}

class _ChoiceTile extends StatelessWidget {
  const _ChoiceTile({
    super.key,
    required this.label,
    required this.selected,
    required this.revealed,
    required this.correct,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final bool revealed;
  final bool correct;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Color? color;
    if (revealed && correct) {
      color = theme.colorScheme.primaryContainer;
    } else if (revealed && selected && !correct) {
      color = theme.colorScheme.errorContainer;
    } else if (selected) {
      color = theme.colorScheme.secondaryContainer;
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: color ?? theme.colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: selected
                ? theme.colorScheme.primary
                : theme.colorScheme.outlineVariant,
            width: selected ? 2 : 1,
          ),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Text(label, style: theme.textTheme.bodyLarge),
          ),
        ),
      ),
    );
  }
}
