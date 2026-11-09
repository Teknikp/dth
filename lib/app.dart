import 'package:flutter/material.dart';

import 'screens/shell_screen.dart';
import 'state/app_state.dart';
import 'theme/app_theme.dart';

class LicencePrepApp extends StatelessWidget {
  const LicencePrepApp({super.key, this.state});

  final AppState? state;

  @override
  Widget build(BuildContext context) {
    final injected = state;
    if (injected != null) return _BoundApp(state: injected);
    return FutureBuilder<AppState>(
      future: AppState.load(),
      builder: (context, snap) {
        if (!snap.hasData) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light(),
            home: const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ),
          );
        }
        return _BoundApp(state: snap.data!);
      },
    );
  }
}

class _BoundApp extends StatelessWidget {
  const _BoundApp({required this.state});

  final AppState state;

  @override
  Widget build(BuildContext context) {
    return AppScope(
      state: state,
      child: ListenableBuilder(
        listenable: state,
        builder: (context, _) {
          return MaterialApp(
            title: state.s.appName,
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light(),
            home: const ShellScreen(),
          );
        },
      ),
    );
  }
}
