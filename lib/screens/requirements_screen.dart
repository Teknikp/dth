import 'package:flutter/material.dart';

import '../data/presented.dart';
import '../data/quizzes.dart';
import '../models/jurisdiction.dart';
import '../models/progress.dart';
import '../state/app_state.dart';
import '../theme/accents.dart';
import '../widgets/disclaimer_banner.dart';
import '../widgets/language_toggle.dart';
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
    final s = AppScope.s(context);
    final locale = AppScope.of(context).locale;
    final view = PresentedJurisdiction.from(jurisdiction, locale);
    final accent = accentFor(jurisdiction.code);
    return Scaffold(
      appBar: AppBar(
        title: Text(view.name),
        actions: const [
          Padding(padding: EdgeInsets.only(right: 12), child: LanguageToggle()),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 40),
        children: [
          const DisclaimerBanner(),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _Chip(
                label: view.isTerritory ? s.territory : s.province,
                color: accent,
              ),
              _Chip(label: s.learnerFrom(view.minLearnerAge), color: accent),
              _Chip(label: view.passengerLicence, color: accent),
              _Chip(label: s.reviewed(view.lastReviewed), color: accent),
              if (view.dataDepth == DataDepth.thin)
                _Chip(label: s.thinData, tone: _ChipTone.warn),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            view.authority,
            style: theme.textTheme.titleSmall?.copyWith(
              color: accent,
              fontWeight: FontWeight.w800,
            ),
          ),
          if (view.minLearnerAgeNote != null) ...[
            const SizedBox(height: 8),
            Text(view.minLearnerAgeNote!),
          ],
          const SizedBox(height: 16),
          FilledButton.icon(
            key: const Key('track-licence'),
            onPressed: () => _track(context),
            icon: const Icon(Icons.flag_outlined),
            label: Text(s.trackHere),
          ),
          const SizedBox(height: 20),
          _SectionTitle(title: s.parentalConsent),
          Text(view.parentalConsent),
          const SizedBox(height: 20),
          _SectionTitle(title: s.graduatedLicensing),
          for (var i = 0; i < view.stages.length; i++) ...[
            StageCard(index: i, stage: view.stages[i], code: view.code),
            const SizedBox(height: 10),
          ],
          _SectionTitle(title: s.knowledgeTest),
          Text(view.knowledgeSummary),
          if (view.passRule != null) ...[
            const SizedBox(height: 8),
            Text('${s.passMark}: ${view.passRule}'),
          ],
          if (view.format != null) ...[
            const SizedBox(height: 8),
            Text('${s.format}: ${view.format}'),
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
            label: Text(s.practiseSigns),
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
            child: Text(s.allQuizzes),
          ),
          const SizedBox(height: 20),
          _SectionTitle(title: s.roadTest),
          Text(view.roadTest),
          const SizedBox(height: 20),
          _SectionTitle(title: s.medicalVision),
          Text(view.medical),
          const SizedBox(height: 20),
          _SectionTitle(title: s.documents),
          for (final item in view.identityDocuments) _Bullet(text: item),
          const SizedBox(height: 20),
          _SectionTitle(title: s.fees),
          for (final fee in view.fees) _FeeRow(fee: fee),
          const SizedBox(height: 20),
          _SectionTitle(title: s.otherClasses),
          for (final item in view.otherClasses) _Bullet(text: item),
          const SizedBox(height: 20),
          _SectionTitle(title: s.aboutSummary),
          Text(view.dataNotes),
          const SizedBox(height: 20),
          _SectionTitle(title: s.officialSources),
          Text(s.officialPageMayBeEn, style: theme.textTheme.bodySmall),
          const SizedBox(height: 8),
          SourceLinks(links: view.sources),
          const SizedBox(height: 8),
          OutlinedButton.icon(
            onPressed: () => openOfficialUrl(context, view.handbookUrl),
            icon: const Icon(Icons.menu_book_outlined),
            label: Text(s.openHandbook),
          ),
        ],
      ),
    );
  }

  Future<void> _track(BuildContext context) async {
    final state = AppScope.of(context);
    final now = DateTime.now().toUtc();
    final existing = state.progress.goals.cast<LicenceGoal?>().firstWhere(
      (g) =>
          g?.jurisdictionCode == jurisdiction.code &&
          g?.kind == LicenceGoal.firstPassengerLicence,
      orElse: () => null,
    );
    final goal =
        existing ??
        LicenceGoal(
          id: 'goal_${jurisdiction.code}_${now.microsecondsSinceEpoch}',
          jurisdictionCode: jurisdiction.code,
          kind: LicenceGoal.firstPassengerLicence,
          createdAt: now,
          updatedAt: now,
        );
    await state.setActiveGoal(goal);
    if (!context.mounted) return;
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(AppScope.s(context).trackHere)));
  }
}

enum _ChipTone { normal, warn }

class _Chip extends StatelessWidget {
  const _Chip({required this.label, this.tone = _ChipTone.normal, this.color});

  final String label;
  final _ChipTone tone;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Chip(
      label: Text(label),
      visualDensity: VisualDensity.compact,
      backgroundColor: tone == _ChipTone.warn
          ? scheme.secondaryContainer
          : (color ?? scheme.primary).withValues(alpha: 0.12),
      side: BorderSide.none,
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
      child: Text(title, style: Theme.of(context).textTheme.titleLarge),
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

  final PresentedFee fee;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final s = AppScope.s(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(fee.label, style: theme.textTheme.titleSmall),
          const SizedBox(height: 2),
          Text(
            fee.isPublished ? fee.amount! : s.amountUnpublished,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: fee.isPublished
                  ? theme.colorScheme.primary
                  : theme.colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 2),
          Text(fee.note, style: theme.textTheme.bodySmall),
        ],
      ),
    );
  }
}
