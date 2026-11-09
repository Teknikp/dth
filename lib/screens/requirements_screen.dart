import 'package:flutter/material.dart';

import '../data/quizzes.dart';
import '../models/jurisdiction.dart';
import '../widgets/disclaimer_banner.dart';
import '../widgets/source_links.dart';
import '../widgets/stage_card.dart';
import 'quiz_hub_screen.dart';
import 'quiz_session_screen.dart';

class RequirementsScreen extends StatelessWidget {
  const RequirementsScreen({super.key, required this.jurisdiction});

  final Jurisdiction jurisdiction;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(jurisdiction.name)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 40),
        children: [
          const DisclaimerBanner(),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _Chip(label: jurisdiction.regionLabel),
              _Chip(label: 'Learner from ${jurisdiction.minLearnerAge}'),
              _Chip(label: jurisdiction.passengerLicence),
              _Chip(label: 'Reviewed ${jurisdiction.lastReviewed}'),
              if (jurisdiction.dataDepth == DataDepth.thin)
                _Chip(label: 'Thin official data', tone: _ChipTone.warn),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            jurisdiction.authority,
            style: theme.textTheme.titleSmall?.copyWith(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.w700,
            ),
          ),
          if (jurisdiction.minLearnerAgeNote != null) ...[
            const SizedBox(height: 8),
            Text(jurisdiction.minLearnerAgeNote!),
          ],
          const SizedBox(height: 20),
          _SectionTitle(title: 'Parental consent'),
          Text(jurisdiction.parentalConsent),
          const SizedBox(height: 20),
          _SectionTitle(title: 'Graduated licensing'),
          for (var i = 0; i < jurisdiction.stages.length; i++) ...[
            StageCard(index: i, stage: jurisdiction.stages[i]),
            const SizedBox(height: 10),
          ],
          _SectionTitle(title: 'Knowledge test'),
          Text(jurisdiction.knowledgeTest.summary),
          if (jurisdiction.knowledgeTest.passRule != null) ...[
            const SizedBox(height: 8),
            Text('Pass mark: ${jurisdiction.knowledgeTest.passRule}'),
          ],
          if (jurisdiction.knowledgeTest.format != null) ...[
            const SizedBox(height: 8),
            Text('Format: ${jurisdiction.knowledgeTest.format}'),
          ],
          const SizedBox(height: 16),
          FilledButton.icon(
            key: const Key('practice-from-requirements'),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => QuizSessionScreen(
                    quiz: signsQuiz,
                    jurisdictionCode: jurisdiction.code,
                  ),
                ),
              );
            },
            icon: const Icon(Icons.quiz_outlined),
            label: const Text('Practise signs (unofficial)'),
          ),
          const SizedBox(height: 8),
          OutlinedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) =>
                      QuizHubScreen(jurisdictionCode: jurisdiction.code),
                ),
              );
            },
            child: const Text('All practice quizzes'),
          ),
          const SizedBox(height: 20),
          _SectionTitle(title: 'Road test'),
          Text(jurisdiction.roadTest),
          const SizedBox(height: 20),
          _SectionTitle(title: 'Medical and vision'),
          Text(jurisdiction.medical),
          const SizedBox(height: 20),
          _SectionTitle(title: 'Documents'),
          for (final item in jurisdiction.identityDocuments)
            _Bullet(text: item),
          const SizedBox(height: 20),
          _SectionTitle(title: 'Fees (only if published)'),
          for (final fee in jurisdiction.fees) _FeeRow(fee: fee),
          const SizedBox(height: 20),
          _SectionTitle(title: 'Other classes'),
          for (final item in jurisdiction.otherClasses) _Bullet(text: item),
          const SizedBox(height: 20),
          _SectionTitle(title: 'About this summary'),
          Text(jurisdiction.dataNotes),
          const SizedBox(height: 20),
          _SectionTitle(title: 'Official sources'),
          SourceLinks(links: jurisdiction.sources),
          const SizedBox(height: 8),
          OutlinedButton.icon(
            onPressed: () => openOfficialUrl(context, jurisdiction.handbookUrl),
            icon: const Icon(Icons.menu_book_outlined),
            label: const Text('Open the official handbook or guide'),
          ),
        ],
      ),
    );
  }
}

enum _ChipTone { normal, warn }

class _Chip extends StatelessWidget {
  const _Chip({required this.label, this.tone = _ChipTone.normal});

  final String label;
  final _ChipTone tone;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Chip(
      label: Text(label),
      visualDensity: VisualDensity.compact,
      backgroundColor: tone == _ChipTone.warn
          ? scheme.tertiaryContainer
          : scheme.surfaceContainerHighest,
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge
            ?.copyWith(fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _Bullet extends StatelessWidget {
  const _Bullet({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('•  '),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}

class _FeeRow extends StatelessWidget {
  const _FeeRow({required this.fee});

  final FeeItem fee;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            fee.label,
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            fee.isPublished ? fee.amount! : 'Amount not published here',
            style: theme.textTheme.bodyLarge?.copyWith(
              color: fee.isPublished
                  ? theme.colorScheme.primary
                  : theme.colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 2),
          Text(fee.note, style: theme.textTheme.bodySmall),
        ],
      ),
    );
  }
}
