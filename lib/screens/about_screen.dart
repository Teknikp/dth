import 'package:flutter/material.dart';

import '../data/catalog.dart';
import '../data/french/catalog_fr.dart';
import '../data/presented.dart';
import '../l10n/app_locale.dart';
import '../models/jurisdiction.dart';
import '../state/app_state.dart';
import '../widgets/disclaimer_banner.dart';
import '../widgets/hero_header.dart';
import '../widgets/source_links.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final s = AppScope.s(context);
    final locale = AppScope.of(context).locale;
    final theme = Theme.of(context);
    return Column(
      children: [
        HeroHeader(title: s.aboutTitle, subtitle: s.aboutLead),
        Expanded(
          child: ListView(
            key: const Key('about-list'),
            padding: const EdgeInsets.fromLTRB(20, 18, 20, 32),
            children: [
              const DisclaimerBanner(),
              const SizedBox(height: 16),
              Text(s.aboutBody, style: theme.textTheme.bodyLarge),
              const SizedBox(height: 20),
              Text(s.language, style: theme.textTheme.titleLarge),
              const SizedBox(height: 8),
              Text(s.languageBody),
              const SizedBox(height: 20),
              Text(s.whatItIs, style: theme.textTheme.titleLarge),
              const SizedBox(height: 8),
              Text(s.whatItIsBody),
              const SizedBox(height: 20),
              Text(s.whatItIsNot, style: theme.textTheme.titleLarge),
              const SizedBox(height: 8),
              Text(s.whatItIsNotBody),
              const SizedBox(height: 20),
              Text(s.officialSources, style: theme.textTheme.titleLarge),
              const SizedBox(height: 8),
              Text(
                s.sourcesByPlace,
                key: const Key('about-sources-lead'),
                style: theme.textTheme.bodyLarge,
              ),
              const SizedBox(height: 8),
              Text(s.officialPageMayBeEn, style: theme.textTheme.bodySmall),
              const SizedBox(height: 16),
              Text(s.provincesHeading, style: theme.textTheme.titleMedium),
              const SizedBox(height: 12),
              for (var i = 0; i < allJurisdictions.length; i++) ...[
                if (i > 0 &&
                    !allJurisdictions[i - 1].isTerritory &&
                    allJurisdictions[i].isTerritory) ...[
                  const SizedBox(height: 8),
                  Text(
                    s.territoriesHeading,
                    style: theme.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 12),
                ],
                _AboutPlaceSources(
                  jurisdiction: allJurisdictions[i],
                  locale: locale,
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _AboutPlaceSources extends StatelessWidget {
  const _AboutPlaceSources({required this.jurisdiction, required this.locale});

  final Jurisdiction jurisdiction;
  final AppLocale locale;

  @override
  Widget build(BuildContext context) {
    final view = PresentedJurisdiction.from(jurisdiction, locale);
    return Padding(
      key: Key('about-sources-${jurisdiction.code}'),
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            jurisdictionName(jurisdiction, french: locale.isFr),
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 8),
          SourceLinks(links: view.sources),
        ],
      ),
    );
  }
}
