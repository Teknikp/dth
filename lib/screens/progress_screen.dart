import 'package:flutter/material.dart';

import '../data/catalog.dart';
import '../data/french/catalog_fr.dart';
import '../data/presented.dart';
import '../data/progress_template.dart';
import '../models/jurisdiction.dart';
import '../models/progress.dart';
import '../state/app_state.dart';
import '../widgets/disclaimer_banner.dart';
import '../widgets/hero_header.dart';
import '../widgets/journey_map.dart';
import '../widgets/source_links.dart';
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
        isExpanded: true,
        isDense: true,
        hint: Text(s.chooseProvince, overflow: TextOverflow.ellipsis),
        items: [
          for (final j in allJurisdictions)
            DropdownMenuItem(
              value: j.code,
              child: Text(
                jurisdictionName(j, french: locale.isFr),
                overflow: TextOverflow.ellipsis,
              ),
            ),
        ],
        onChanged: (code) async {
          if (code == null) return;
          final state = AppScope.of(context);
          final now = DateTime.now().toUtc();
          final existing = state.progress.goals.cast<LicenceGoal?>().firstWhere(
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
                  s.mapFor(jurisdictionName(jurisdiction, french: locale.isFr)),
                  style: theme.textTheme.titleMedium,
                ),
              ),
              Text(
                s.doneOf(done, items.length),
                style: theme.textTheme.labelLarge,
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton.icon(
              key: const Key('gdl-wait-times'),
              style: TextButton.styleFrom(
                visualDensity: VisualDensity.compact,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: () => _openGdlWaits(context),
              icon: const Icon(Icons.schedule, size: 18),
              label: Text(s.gdlWaitButton),
            ),
          ),
          Expanded(
            child: JourneyMap(
              items: items,
              done: doneIds,
              locale: locale,
              strings: s,
              onSelect: (item) async {
                final was = goal.isDone(item.id);
                if (!was) {
                  AppScope.of(context).toggleCheck(item.id, done: true);
                  await Future<void>.delayed(
                    const Duration(milliseconds: 2000),
                  );
                }
                if (!context.mounted) return;
                final index = items.indexWhere((e) => e.id == item.id);
                await _openStop(context, items, index < 0 ? 0 : index);
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (_) =>
                            RequirementsScreen(jurisdiction: jurisdiction),
                      ),
                    );
                  },
                  child: Text(
                    s.openRequirements,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () => AppScope.of(context).resetChecks(),
                  child: Text(s.resetChecks, overflow: TextOverflow.ellipsis),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _openStop(
    BuildContext context,
    List<ProgressItemDef> items,
    int index,
  ) {
    return showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (_) => _StopSheet(items: items, initialIndex: index),
    );
  }

  Future<void> _openGdlWaits(BuildContext context) async {
    final s = AppScope.s(context);
    final locale = AppScope.of(context).locale;
    final view = PresentedJurisdiction.from(jurisdiction, locale);
    final unpublished = jurisdiction.dataDepth == DataDepth.thin;
    await showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (sheet) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.72,
          minChildSize: 0.4,
          maxChildSize: 0.92,
          builder: (context, scroll) {
            return ListView(
              controller: scroll,
              padding: const EdgeInsets.fromLTRB(20, 4, 20, 28),
              children: [
                Text(
                  s.gdlWaitTitle,
                  style: Theme.of(sheet).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(s.gdlWaitLead),
                const SizedBox(height: 8),
                Text(
                  unpublished ? s.gdlWaitUnpublished : s.gdlWaitNotBooking,
                  style: Theme.of(sheet).textTheme.bodySmall,
                ),
                const SizedBox(height: 16),
                for (final stage in view.stages) ...[
                  Text(
                    '${stage.name} (${stage.classCode})',
                    style: Theme.of(sheet).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 4),
                  Text(stage.duration),
                  const SizedBox(height: 14),
                ],
                Text(
                  '${s.reviewed(view.lastReviewed)} · ${view.authority}',
                  style: Theme.of(sheet).textTheme.bodySmall,
                ),
                const SizedBox(height: 12),
                OutlinedButton.icon(
                  onPressed: () => openOfficialUrl(context, view.handbookUrl),
                  icon: const Icon(Icons.menu_book, size: 18),
                  label: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(s.openHandbook),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  s.gdlWaitOpenSources,
                  style: Theme.of(sheet).textTheme.titleSmall,
                ),
                const SizedBox(height: 8),
                SourceLinks(links: view.sources),
              ],
            );
          },
        );
      },
    );
  }
}

class _StopSheet extends StatefulWidget {
  const _StopSheet({required this.items, required this.initialIndex});

  final List<ProgressItemDef> items;
  final int initialIndex;

  @override
  State<_StopSheet> createState() => _StopSheetState();
}

class _StopSheetState extends State<_StopSheet> {
  late int _index;

  @override
  void initState() {
    super.initState();
    final last = widget.items.length - 1;
    _index = widget.initialIndex < 0
        ? 0
        : (widget.initialIndex > last ? last : widget.initialIndex);
  }

  ProgressItemDef get _item => widget.items[_index];

  bool get _isFirst => _index <= 0;

  bool get _isLast => _index >= widget.items.length - 1;

  @override
  Widget build(BuildContext context) {
    final s = AppScope.s(context);
    final locale = AppScope.of(context).locale;
    final item = _item;
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 4, 20, 28),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            item.title(locale),
            key: const Key('stop-title'),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          if (item.detail(locale).isNotEmpty) ...[
            const SizedBox(height: 8),
            Text(item.detail(locale)),
          ],
          if (item.kind == ProgressItemKind.wait) ...[
            const SizedBox(height: 8),
            Text(
              s.gdlWaitNotBooking,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
          const SizedBox(height: 8),
          Text(s.unofficialMap, style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  key: const Key('stop-previous'),
                  onPressed: _isFirst
                      ? null
                      : () => setState(() => _index -= 1),
                  child: Text(s.previousStep, overflow: TextOverflow.ellipsis),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: FilledButton(
                  key: const Key('stop-next'),
                  onPressed: () {
                    if (_isLast) {
                      Navigator.pop(context);
                    } else {
                      setState(() => _index += 1);
                    }
                  },
                  child: Text(s.nextStep, overflow: TextOverflow.ellipsis),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
