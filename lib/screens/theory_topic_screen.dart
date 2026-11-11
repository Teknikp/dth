import 'package:flutter/material.dart';

import '../data/catalog.dart';
import '../data/presented.dart';
import '../data/quizzes.dart';
import '../data/road_signs.dart';
import '../l10n/app_locale.dart';
import '../models/theory.dart';
import '../state/app_state.dart';
import '../widgets/disclaimer_banner.dart';
import '../widgets/sign_graphic.dart';
import '../widgets/source_links.dart';
import '../widgets/stage_card.dart';
import 'quiz_session_screen.dart';

class TheoryTopicScreen extends StatelessWidget {
  const TheoryTopicScreen({
    super.key,
    required this.topic,
    this.jurisdictionCode,
  });

  final TheoryTopic topic;
  final String? jurisdictionCode;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final s = AppScope.s(context);
    final locale = AppScope.of(context).locale;
    final notes = topic.notesFor(jurisdictionCode);
    final quizzes = [
      for (final id in topic.quizIds) ...allQuizzes.where((q) => q.id == id),
    ];
    final jurisdiction = jurisdictionCode == null
        ? null
        : jurisdictionByCode(jurisdictionCode!);
    final presented = jurisdiction == null
        ? null
        : PresentedJurisdiction.from(jurisdiction, locale);

    return Scaffold(
      appBar: AppBar(title: Text(topic.title.of(locale))),
      body: ListView(
        key: const Key('theory-topic-list'),
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: [
          const DisclaimerBanner(practice: true),
          const SizedBox(height: 16),
          Text(topic.lead.of(locale), style: theme.textTheme.bodyLarge),
          const SizedBox(height: 8),
          Text(s.theorySignCaption, style: theme.textTheme.bodySmall),
          for (final section in topic.sections) ...[
            const SizedBox(height: 22),
            Text(section.heading.of(locale), style: theme.textTheme.titleLarge),
            const SizedBox(height: 8),
            Text(section.body.of(locale)),
            if (section.signIds.isNotEmpty) ...[
              const SizedBox(height: 14),
              _SignRow(signIds: section.signIds, locale: locale),
            ],
          ],
          if (notes.isNotEmpty) ...[
            const SizedBox(height: 22),
            for (final note in notes) ...[
              Card(
                color: theme.colorScheme.tertiaryContainer,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        note.heading.of(locale),
                        style: theme.textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      Text(note.body.of(locale)),
                      if (note.signIds.isNotEmpty) ...[
                        const SizedBox(height: 12),
                        _SignRow(signIds: note.signIds, locale: locale),
                      ],
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ],
          if (topic.usesJurisdictionGdl) ...[
            const SizedBox(height: 22),
            Text(s.gdlStagesHere, style: theme.textTheme.titleLarge),
            const SizedBox(height: 8),
            if (presented == null)
              Text(s.pickPlaceForGdl)
            else ...[
              Text(presented.name, style: theme.textTheme.titleMedium),
              const SizedBox(height: 8),
              Text(presented.dataNotes),
              const SizedBox(height: 12),
              for (var i = 0; i < presented.stages.length; i++) ...[
                StageCard(
                  index: i,
                  stage: presented.stages[i],
                  code: presented.code,
                ),
                const SizedBox(height: 10),
              ],
              SourceLinks(links: presented.sources),
            ],
          ],
          const SizedBox(height: 24),
          for (var i = 0; i < quizzes.length; i++) ...[
            FilledButton(
              key: Key('theory-quiz-${quizzes[i].id}'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) => QuizSessionScreen(
                      quiz: quizzes[i],
                      jurisdictionCode: jurisdictionCode,
                    ),
                  ),
                );
              },
              child: Text(
                i == 0 ? s.startTopicQuiz : quizzes[i].titleOf(locale),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ],
      ),
    );
  }
}

class _SignRow extends StatelessWidget {
  const _SignRow({required this.signIds, required this.locale});

  final List<String> signIds;
  final AppLocale locale;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (final id in signIds)
            if (roadSignById(id) != null)
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: SignGraphic(
                  sign: roadSignById(id)!,
                  size: 112,
                  showCaption: true,
                  locale: locale,
                ),
              ),
        ],
      ),
    );
  }
}
