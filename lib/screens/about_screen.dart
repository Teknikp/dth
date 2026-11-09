import 'package:flutter/material.dart';

import '../data/catalog.dart';
import '../data/presented.dart';
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
    final links = <PresentedLink>[];
    final seen = <String>{};
    for (final j in allJurisdictions) {
      for (final link in PresentedJurisdiction.from(j, locale).sources) {
        if (seen.add(link.url)) links.add(link);
      }
    }
    return Column(
      children: [
        HeroHeader(title: s.aboutTitle, subtitle: s.aboutLead),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 18, 20, 32),
            children: [
              const DisclaimerBanner(),
              const SizedBox(height: 16),
              Text(s.aboutBody, style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 20),
              Text(s.language, style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 8),
              Text(s.languageBody),
              const SizedBox(height: 20),
              Text(s.whatItIs, style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 8),
              Text(s.whatItIsBody),
              const SizedBox(height: 20),
              Text(
                s.whatItIsNot,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(s.whatItIsNotBody),
              const SizedBox(height: 20),
              Text(
                s.officialSources,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(
                s.officialPageMayBeEn,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 12),
              SourceLinks(links: links),
            ],
          ),
        ),
      ],
    );
  }
}
