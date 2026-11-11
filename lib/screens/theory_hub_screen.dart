import 'package:flutter/material.dart';

import '../data/catalog.dart';
import '../data/theory_content.dart';
import '../models/theory.dart';
import '../state/app_state.dart';
import '../theme/accents.dart';
import '../theme/app_theme.dart';
import '../widgets/disclaimer_banner.dart';
import '../widgets/hero_header.dart';
import 'theory_topic_screen.dart';

class TheoryHubScreen extends StatefulWidget {
  const TheoryHubScreen({super.key});

  @override
  State<TheoryHubScreen> createState() => _TheoryHubScreenState();
}

class _TheoryHubScreenState extends State<TheoryHubScreen> {
  String? _code;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _code ??= AppScope.of(context).progress.activeGoal?.jurisdictionCode;
  }

  @override
  Widget build(BuildContext context) {
    final s = AppScope.s(context);
    final locale = AppScope.of(context).locale;
    return Column(
      children: [
        HeroHeader(title: s.theoryTitle, subtitle: s.theoryLead),
        Expanded(
          child: ListView(
            key: const Key('theory-list'),
            padding: const EdgeInsets.fromLTRB(20, 18, 20, 32),
            children: [
              const DisclaimerBanner(practice: true),
              const SizedBox(height: 16),
              Text(s.theoryBody, style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 18),
              Text(
                s.studyPlace,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _PlaceChip(
                      keyName: 'CA',
                      label: s.canadaWide,
                      selected: _code == null,
                      onTap: () => setState(() => _code = null),
                    ),
                    const SizedBox(width: 8),
                    for (final j in allJurisdictions) ...[
                      _PlaceChip(
                        keyName: j.code,
                        label: j.code,
                        selected: _code == j.code,
                        color: accentFor(j.code),
                        onTap: () => setState(() => _code = j.code),
                      ),
                      const SizedBox(width: 8),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 20),
              _SavedTopics(jurisdictionCode: _code),
              for (final topic in allTheoryTopics) ...[
                _TopicCard(
                  topic: topic,
                  jurisdictionCode: _code,
                  title: topic.title.of(locale),
                  subtitle: topic.subtitle.of(locale),
                ),
                const SizedBox(height: 10),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _SavedTopics extends StatelessWidget {
  const _SavedTopics({this.jurisdictionCode});

  final String? jurisdictionCode;

  @override
  Widget build(BuildContext context) {
    final s = AppScope.s(context);
    final locale = AppScope.of(context).locale;
    final study = AppScope.of(context).study;
    final ids = study.savedTopicIds
        .where((id) => theoryTopicById(id) != null)
        .toList();
    if (ids.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(s.savedTopics, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final id in ids)
                ActionChip(
                  key: Key('saved-topic-$id'),
                  avatar: Icon(
                    study.isBookmarked(id)
                        ? Icons.bookmark
                        : Icons.flag_outlined,
                    size: 18,
                  ),
                  label: Text(theoryTopicById(id)!.title.of(locale)),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (_) => TheoryTopicScreen(
                          topic: theoryTopicById(id)!,
                          jurisdictionCode: jurisdictionCode,
                        ),
                      ),
                    );
                  },
                ),
            ],
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class _PlaceChip extends StatelessWidget {
  const _PlaceChip({
    required this.keyName,
    required this.label,
    required this.selected,
    required this.onTap,
    this.color,
  });

  final String keyName;
  final String label;
  final bool selected;
  final VoidCallback onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final seed = color ?? AppTheme.seed;
    return FilterChip(
      key: Key('theory-place-$keyName'),
      label: Text(label),
      selected: selected,
      onSelected: (_) => onTap(),
      selectedColor: seed.withValues(alpha: 0.22),
      checkmarkColor: seed,
    );
  }
}

class _TopicCard extends StatelessWidget {
  const _TopicCard({
    required this.topic,
    required this.jurisdictionCode,
    required this.title,
    required this.subtitle,
  });

  final TheoryTopic topic;
  final String? jurisdictionCode;
  final String title;
  final String subtitle;

  IconData get _icon {
    switch (topic.id) {
      case 'signs':
        return Icons.traffic_outlined;
      case 'rules':
        return Icons.alt_route;
      case 'impairment':
        return Icons.no_drinks_outlined;
      case 'winter':
        return Icons.ac_unit;
      case 'gdl':
        return Icons.school_outlined;
      case 'points':
        return Icons.gavel_outlined;
      default:
        return Icons.menu_book_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final s = AppScope.s(context);
    void open() {
      Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (_) => TheoryTopicScreen(
            topic: topic,
            jurisdictionCode: jurisdictionCode,
          ),
        ),
      );
    }

    return Card(
      key: Key('theory-${topic.id}'),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: open,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(_icon, color: AppTheme.deep),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(title, style: theme.textTheme.titleMedium),
                        ),
                        if (AppScope.of(context).study.isBookmarked(topic.id))
                          Icon(
                            Icons.bookmark,
                            key: Key('hub-bookmark-${topic.id}'),
                            color: theme.colorScheme.primary,
                          ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(subtitle),
                    const SizedBox(height: 12),
                    FilledButton(onPressed: open, child: Text(s.openLesson)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
