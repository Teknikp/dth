import 'package:flutter/material.dart';

import '../l10n/app_locale.dart';
import '../state/app_state.dart';
import '../theme/app_theme.dart';

class LanguageToggle extends StatelessWidget {
  const LanguageToggle({super.key});

  @override
  Widget build(BuildContext context) {
    final state = AppScope.of(context);
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: const Color(0xFFE4D9CC)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _Chip(
            key: const Key('lang-en'),
            label: 'EN',
            selected: state.locale == AppLocale.en,
            onTap: () => state.setLocale(AppLocale.en),
          ),
          _Chip(
            key: const Key('lang-fr'),
            label: 'FR',
            selected: state.locale == AppLocale.fr,
            onTap: () => state.setLocale(AppLocale.fr),
          ),
        ],
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(999),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: selected ? AppTheme.seed : Colors.transparent,
          borderRadius: BorderRadius.circular(999),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 12,
            color: selected ? Colors.white : AppTheme.ink,
          ),
        ),
      ),
    );
  }
}
