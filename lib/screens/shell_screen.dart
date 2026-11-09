import 'package:flutter/material.dart';

import '../state/app_state.dart';
import 'about_screen.dart';
import 'jurisdiction_list_screen.dart';
import 'progress_screen.dart';
import 'quiz_hub_screen.dart';

class ShellScreen extends StatefulWidget {
  const ShellScreen({super.key});

  @override
  State<ShellScreen> createState() => _ShellScreenState();
}

class _ShellScreenState extends State<ShellScreen> {
  var index = 0;

  @override
  Widget build(BuildContext context) {
    final s = AppScope.s(context);
    final locale = AppScope.of(context).locale;
    return Scaffold(
      body: IndexedStack(
        index: index,
        children: [
          JurisdictionListScreen(key: ValueKey('licences-$locale')),
          ProgressScreen(key: ValueKey('progress-$locale')),
          QuizHubScreen(key: ValueKey('practice-$locale')),
          AboutScreen(key: ValueKey('about-$locale')),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (value) => setState(() => index = value),
        destinations: [
          NavigationDestination(
            key: const Key('nav-licences'),
            icon: const Icon(Icons.map_outlined),
            selectedIcon: const Icon(Icons.map),
            label: s.navLicences,
          ),
          NavigationDestination(
            key: const Key('nav-progress'),
            icon: const Icon(Icons.flag_outlined),
            selectedIcon: const Icon(Icons.flag),
            label: s.navProgress,
          ),
          NavigationDestination(
            key: const Key('nav-practice'),
            icon: const Icon(Icons.quiz_outlined),
            selectedIcon: const Icon(Icons.quiz),
            label: s.navPractice,
          ),
          NavigationDestination(
            key: const Key('nav-about'),
            icon: const Icon(Icons.info_outline),
            selectedIcon: const Icon(Icons.info),
            label: s.navAbout,
          ),
        ],
      ),
    );
  }
}
