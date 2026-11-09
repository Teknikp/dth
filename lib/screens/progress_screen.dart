import 'package:flutter/material.dart';

import '../data/catalog.dart';
import '../data/french/catalog_fr.dart';
import '../data/progress_template.dart';
import '../models/jurisdiction.dart';
import '../models/progress.dart';
import '../state/app_state.dart';
import '../theme/accents.dart';
import '../widgets/disclaimer_banner.dart';
import '../widgets/hero_header.dart';
import 'requirements_screen.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final s = AppScope.s(context);
    final state = AppScope.of(context);
    final goal = state.progress.activeGoal;
    final jurisdiction = goal == null
        ? null
        : jurisdictionByCode(goal.jurisdictionCode);
    return Column(
      children: [
        HeroHeader(title: s.progressTitle, subtitle: s.progressLead),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 18, 20, 32),
            children: [
              const DisclaimerBanner(),
              const SizedBox(height: 16),
              Text(
                s.progressBody,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 16),
              _GoalPicker(selectedCode: goal?.jurisdictionCode),
              const SizedBox(height: 20),
              if (jurisdiction == null)
                Text(s.pickGoalHint)
              else
                _Checklist(jurisdiction: jurisdiction, goal: goal!),
            ],
          ),
        ),
      ],
    );
  }
}

class _GoalPicker extends StatelessWidget {
  const _GoalPicker({required this.selectedCode});

  final String? selectedCode;

  @override
  Widget build(BuildContext context) {
    final s = AppScope.s(context);
    final locale = AppScope.of(context).locale;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(s.yourGoal, style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 8),
        KeyedSubtree(
          key: const Key('goal-province'),
          child: DropdownButtonFormField<String>(
            key: ValueKey('goal-${selectedCode ?? 'none'}'),
            initialValue: selectedCode,
            hint: Text(s.chooseProvince),
            items: [
              for (final j in allJurisdictions)
                DropdownMenuItem(
                  value: j.code,
                  child: Text(jurisdictionName(j, french: locale.isFr)),
                ),
            ],
            onChanged: (code) async {
              if (code == null) return;
              final state = AppScope.of(context);
              final now = DateTime.now().toUtc();
              final existing = state.progress.goals
                  .cast<LicenceGoal?>()
                  .firstWhere(
                    (g) =>
                        g?.jurisdictionCode == code &&
                        g?.kind == LicenceGoal.firstPassengerLicence,
                    orElse: () => null,
                  );
              await state.setActiveGoal(
                existing ??
                    LicenceGoal(
                      id: 'goal_${code}_${now.microsecondsSinceEpoch}',
                      jurisdictionCode: code,
                      kind: LicenceGoal.firstPassengerLicence,
                      createdAt: now,
                      updatedAt: now,
                    ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _Checklist extends StatelessWidget {
  const _Checklist({required this.jurisdiction, required this.goal});

  final Jurisdiction jurisdiction;
  final LicenceGoal goal;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final s = AppScope.s(context);
    final locale = AppScope.of(context).locale;
    final items = progressItemsFor(jurisdiction);
    final done = items.where((i) => goal.isDone(i.id)).length;
    final accent = accentFor(jurisdiction.code);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          s.checklistFor(jurisdictionName(jurisdiction, french: locale.isFr)),
          style: theme.textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            value: items.isEmpty ? 0 : done / items.length,
            minHeight: 10,
            color: accent,
            backgroundColor: accent.withValues(alpha: 0.16),
          ),
        ),
        const SizedBox(height: 6),
        Text(s.doneOf(done, items.length), style: theme.textTheme.labelLarge),
        const SizedBox(height: 8),
        TextButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (_) => RequirementsScreen(jurisdiction: jurisdiction),
              ),
            );
          },
          child: Text(s.openRequirements),
        ),
        const SizedBox(height: 8),
        for (final item in items)
          _CheckTile(item: item, checked: goal.isDone(item.id)),
        const SizedBox(height: 8),
        OutlinedButton(
          onPressed: () => AppScope.of(context).resetChecks(),
          child: Text(s.resetChecks),
        ),
      ],
    );
  }
}

class _CheckTile extends StatelessWidget {
  const _CheckTile({required this.item, required this.checked});

  final ProgressItemDef item;
  final bool checked;

  @override
  Widget build(BuildContext context) {
    final locale = AppScope.of(context).locale;
    return Card(
      key: Key('check-${item.id}'),
      child: CheckboxListTile(
        value: checked,
        onChanged: (v) =>
            AppScope.of(context).toggleCheck(item.id, done: v ?? false),
        title: Text(item.title(locale)),
        subtitle: item.detail(locale).isEmpty
            ? null
            : Text(item.detail(locale)),
        secondary: Icon(switch (item.kind) {
          ProgressItemKind.knowledge => Icons.menu_book_outlined,
          ProgressItemKind.vision => Icons.visibility_outlined,
          ProgressItemKind.road => Icons.directions_car_outlined,
          ProgressItemKind.wait => Icons.hourglass_bottom_outlined,
          ProgressItemKind.admin => Icons.badge_outlined,
        }),
      ),
    );
  }
}
