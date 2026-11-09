import 'package:flutter/material.dart';

import '../models/jurisdiction.dart';
import '../widgets/disclaimer_banner.dart';
import '../widgets/source_links.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
        children: [
          Text(
            'About',
            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'A v1 study aid for people looking up how to get a passenger-vehicle licence in a Canadian province or territory, and practising knowledge-test topics.',
            style: theme.textTheme.bodyMedium?.copyWith(height: 1.4),
          ),
          const SizedBox(height: 16),
          const DisclaimerBanner(),
          const SizedBox(height: 20),
          Text(
            'What this app is',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Summaries of graduated licensing, tests, documents, medical/vision notes, and fees when a government or Crown insurer page published a number. Practice quizzes on signs, rules, impairment, and winter driving. No account is required.',
          ),
          const SizedBox(height: 16),
          Text(
            'What this app is not',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'It is not the official test, not legal advice, and not a complete copy of any handbook. If a fee or rule was not on the official page we reviewed, the app says so and points you to that page instead of inventing a number.',
          ),
          const SizedBox(height: 16),
          Text(
            'English first',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'This version is English only. Several jurisdictions offer tests and handbooks in French or other languages — use the official links.',
          ),
          const SizedBox(height: 20),
          const SourceLinks(
            links: [
              OfficialLink(
                label: 'Transport Canada — road safety',
                url: 'https://tc.canada.ca/en/road-safety',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
