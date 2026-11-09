import 'package:flutter/material.dart';

import '../data/catalog.dart';
import '../models/jurisdiction.dart';
import '../widgets/disclaimer_banner.dart';
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
    final items = searchJurisdictions(_query.text);
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
        children: [
          Text(
            'Canadian licence prep',
            style: Theme.of(context).textTheme.headlineMedium
                ?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 6),
          Text(
            'Pick a province or territory for official-style requirements, then practise the knowledge test.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              height: 1.4,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 16),
          const DisclaimerBanner(),
          const SizedBox(height: 16),
          TextField(
            controller: _query,
            onChanged: (_) => setState(() {}),
            decoration: const InputDecoration(
              hintText: 'Search by name or code',
              prefixIcon: Icon(Icons.search),
            ),
          ),
          const SizedBox(height: 16),
          for (final item in items) ...[
            _JurisdictionTile(jurisdiction: item),
            const SizedBox(height: 10),
          ],
        ],
      ),
    );
  }
}

class _JurisdictionTile extends StatelessWidget {
  const _JurisdictionTile({required this.jurisdiction});

  final Jurisdiction jurisdiction;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 52,
                height: 52,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Text(
                  jurisdiction.code,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: theme.colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      jurisdiction.name,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${jurisdiction.authority} · learner from ${jurisdiction.minLearnerAge}',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    if (jurisdiction.dataDepth == DataDepth.thin) ...[
                      const SizedBox(height: 6),
                      Text(
                        'Limited official detail',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: theme.colorScheme.tertiary,
                          fontWeight: FontWeight.w700,
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
    );
  }
}
