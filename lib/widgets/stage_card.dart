import 'package:flutter/material.dart';

import '../data/presented.dart';
import '../state/app_state.dart';
import '../theme/accents.dart';

class StageCard extends StatelessWidget {
  const StageCard({
    super.key,
    required this.index,
    required this.stage,
    required this.code,
  });

  final int index;
  final PresentedStage stage;
  final String code;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final s = AppScope.s(context);
    final accent = accentFor(code);
    return Card(
      clipBehavior: Clip.antiAlias,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(width: 7, color: accent),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: accent.withValues(alpha: 0.16),
                          foregroundColor: accent,
                          child: Text(
                            '${index + 1}',
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                stage.name,
                                style: theme.textTheme.titleMedium,
                              ),
                              Text(
                                stage.classCode,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: accent,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    _Labeled(label: s.timeInStage, body: stage.duration),
                    const SizedBox(height: 8),
                    _Labeled(label: s.howYouEnter, body: stage.howToEnter),
                    const SizedBox(height: 8),
                    Text(
                      s.restrictions,
                      style: theme.textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 6),
                    for (final item in stage.restrictions)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('•  ', style: theme.textTheme.bodyMedium),
                            Expanded(child: Text(item)),
                          ],
                        ),
                      ),
                    const SizedBox(height: 4),
                    _Labeled(label: s.howYouMoveOn, body: stage.howToAdvance),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Labeled extends StatelessWidget {
  const _Labeled({required this.label, required this.body});

  final String label;
  final String body;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 4),
        Text(body, style: theme.textTheme.bodyMedium?.copyWith(height: 1.4)),
      ],
    );
  }
}
