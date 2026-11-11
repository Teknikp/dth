import 'package:flutter/material.dart';

import '../data/catalog.dart';
import '../data/french/catalog_fr.dart';
import '../data/progress_template.dart';
import '../models/jurisdiction.dart';
import '../models/progress.dart';
import '../state/app_state.dart';
import '../widgets/disclaimer_banner.dart';
import '../widgets/hero_header.dart';
import '../widgets/journey_map.dart';
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
        HeroHeader(
          title: s.progressTitle,
          subtitle: s.progressMapLead,
          compact: true,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DisclaimerBanner(compact: true),
              const SizedBox(height: 10),
              _GoalPicker(selectedCode: goal?.jurisdictionCode),
            ],
          ),
        ),
        Expanded(
          child: jurisdiction == null
              ? Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(s.pickGoalHint),
                )
              : _MapPanel(jurisdiction: jurisdiction, goal: goal!),
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
    return KeyedSubtree(
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
    );
  }
}

class _MapPanel extends StatelessWidget {
  const _MapPanel({required this.jurisdiction, required this.goal});

  final Jurisdiction jurisdiction;
  final LicenceGoal goal;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final s = AppScope.s(context);
    final locale = AppScope.of(context).locale;
    final items = progressItemsFor(jurisdiction);
    final done = items.where((i) => goal.isDone(i.id)).length;
    final doneIds = {
      for (final i in items)
        if (goal.isDone(i.id)) i.id,
    };
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  s.mapFor(
                    jurisdictionName(jurisdiction, french: locale.isFr),
                  ),
                  style: theme.textTheme.titleMedium,
                ),
              ),
              Text(
                s.doneOf(done, items.length),
                style: theme.textTheme.labelLarge,
              ),
            ],
          ),
          const SizedBox(height: 6),
          Expanded(
            child: JourneyMap(
              items: items,
              done: doneIds,
              locale: locale,
              strings: s,
              onSelect: (item) {
                final was = goal.isDone(item.id);
                if (!was) {
                  AppScope.of(context).toggleCheck(item.id, done: true);
                }
                _openStop(context, item, true);
              },
            ),
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (_) =>
                          RequirementsScreen(jurisdiction: jurisdiction),
                    ),
                  );
                },
                child: Text(s.openRequirements),
              ),
              const Spacer(),
              TextButton(
                onPressed: () => AppScope.of(context).resetChecks(),
                child: Text(s.resetChecks),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _openStop(
    BuildContext context,
    ProgressItemDef item,
    bool checked,
  ) async {
    final s = AppScope.s(context);
    final locale = AppScope.of(context).locale;
    await showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (sheet) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 4, 20, 28),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                item.title(locale),
                style: Theme.of(sheet).textTheme.titleLarge,
              ),
              if (item.detail(locale).isNotEmpty) ...[
                const SizedBox(height: 8),
                Text(item.detail(locale)),
              ],
              const SizedBox(height: 8),
              Text(s.unofficialMap, style: Theme.of(sheet).textTheme.bodySmall),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: () => Navigator.pop(sheet),
                child: Text(s.backToMap),
              ),
              if (checked)
                TextButton(
                  onPressed: () {
                    AppScope.of(context).toggleCheck(item.id, done: false);
                    Navigator.pop(sheet);
                  },
                  child: Text(s.clearStop),
                ),
            ],
          ),
        );
      },
    );
  }
}
