import 'package:flutter/material.dart';

import '../state/app_state.dart';
import '../theme/app_theme.dart';
import 'language_toggle.dart';

class HeroHeader extends StatelessWidget {
  const HeroHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.compact = false,
  });

  final String title;
  final String subtitle;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 8, 20, compact ? 14 : 22),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF0B6E63), Color(0xFF1D6F8A), Color(0xFF2F6FA8)],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(28),
          bottomRight: Radius.circular(28),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  AppScope.s(context).appName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.2,
                  ),
                ),
                const Spacer(),
                const LanguageToggle(),
              ],
            ),
            SizedBox(height: compact ? 10 : 18),
            Text(
              title,
              style:
                  (compact
                          ? Theme.of(context).textTheme.titleLarge
                          : Theme.of(context).textTheme.headlineMedium)
                      ?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
            ),
            const SizedBox(height: 6),
            Text(
              subtitle,
              maxLines: compact ? 2 : 4,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.white.withValues(alpha: 0.92),
                height: 1.35,
                fontSize: compact ? 13 : null,
              ),
            ),
            const SizedBox(height: 4),
            Container(
              width: 48,
              height: 4,
              margin: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: AppTheme.clay,
                borderRadius: BorderRadius.circular(99),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
