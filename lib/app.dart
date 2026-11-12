import 'package:flutter/material.dart';

import 'screens/shell_screen.dart';
import 'state/app_state.dart';
import 'theme/app_theme.dart';
import 'widgets/branded_splash.dart';

class LicencePrepApp extends StatefulWidget {
  const LicencePrepApp({
    super.key,
    this.state,
    this.minSplash = const Duration(milliseconds: 2500),
  });

  final AppState? state;

  /// Native splash is a flash; keep the branded screen this long.
  final Duration minSplash;

  @override
  State<LicencePrepApp> createState() => _LicencePrepAppState();
}

class _LicencePrepAppState extends State<LicencePrepApp> {
  AppState? _state;
  var _ready = false;

  @override
  void initState() {
    super.initState();
    final injected = widget.state;
    if (injected != null) {
      _state = injected;
      _ready = true;
      return;
    }
    final started = DateTime.now();
    AppState.load().then((state) async {
      final leftover = widget.minSplash - DateTime.now().difference(started);
      if (leftover > Duration.zero) {
        await Future<void>.delayed(leftover);
      }
      if (!mounted) return;
      setState(() {
        _state = state;
        _ready = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_ready || _state == null) {
      return const BrandedSplash();
    }
    return AppScope(
      state: _state!,
      child: ListenableBuilder(
        listenable: _state!,
        builder: (context, _) {
          return MaterialApp(
            title: _state!.s.appName,
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light(),
            home: const ShellScreen(),
          );
        },
      ),
    );
  }
}
