import 'package:flutter/material.dart';

import '../data/catalog.dart';
import '../data/french/catalog_fr.dart';
import '../data/progress_template.dart';
import '../models/jurisdiction.dart';
import '../state/app_state.dart';
import '../theme/accents.dart';
import '../widgets/disclaimer_banner.dart';
import '../widgets/hero_header.dart';
import 'requirements_screen.dart';

class JurisdictionListScreen extends StatefulWidget {
  const JurisdictionListScreen({super.key});

  @override
  State<JurisdictionListScreen> createState() => _JurisdictionListScreenState();
}

class _JurisdictionListScreenState extends State<JurisdictionListScreen> {
  final _query = TextEditingController();

  @override
  void dispose() {
    _query.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = AppScope.s(context);
    final locale = AppScope.of(context).locale;
    final items = searchJurisdictions(_query.text, locale: locale);
    return Column(
      children: [
        HeroHeader(title: s.homeTitle, subtitle: s.homeSubtitle),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 18, 20, 32),
            children: [
              const DisclaimerBanner(),
              const SizedBox(height: 16),
              TextField(
                controller: _query,
                onChanged: (_) => setState(() {}),
                decoration: InputDecoration(
                  hintText: s.searchHint,
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
              const SizedBox(height: 16),
              for (final item in items) ...[
                _JurisdictionTile(jurisdiction: item),
                const SizedBox(height: 10),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _JurisdictionTile extends StatelessWidget {
  const _JurisdictionTile({required this.jurisdiction});

  final Jurisdiction jurisdiction;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final s = AppScope.s(context);
    final locale = AppScope.of(context).locale;
    final name = jurisdictionName(jurisdiction, french: locale.isFr);
    final authority = locale.isFr
        ? (frenchFor(jurisdiction.code)?.authority ?? jurisdiction.authority)
        : jurisdiction.authority;
    final accent = accentFor(jurisdiction.code);
    final progress = AppScope.of(context).progress.activeGoal;
    final tracked = progress?.jurisdictionCode == jurisdiction.code;
    var done = 0;
    var total = 0;
    if (tracked) {
      final items = progressItemsFor(jurisdiction);
      total = items.length;
      done = items.where((i) => progress!.isDone(i.id)).length;
    }
    return Card(
      key: Key('province-${jurisdiction.code}'),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (_) => RequirementsScreen(jurisdiction: jurisdiction),
            ),
          );
        },
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(width: 8, color: accent),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(14, 14, 12, 14),
                  child: Row(
                    children: [
                      Container(
                        width: 52,
                        height: 52,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: accent.withValues(alpha: 0.14),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          jurisdiction.code,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w800,
                            color: accent,
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(name, style: theme.textTheme.titleMedium),
                            const SizedBox(height: 2),
                            Text(
                              '$authority · ${s.learnerFrom(jurisdiction.minLearnerAge)}',
                              style: theme.textTheme.bodySmall,
                            ),
                            if (jurisdiction.dataDepth == DataDepth.thin) ...[
                              const SizedBox(height: 6),
                              Text(
                                s.limitedDetail,
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: theme.colorScheme.secondary,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                            if (tracked) ...[
                              const SizedBox(height: 6),
                              Text(
                                s.doneOf(done, total),
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: accent,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
