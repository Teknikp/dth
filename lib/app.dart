import 'package:flutter/material.dart';

import 'screens/shell_screen.dart';
import 'theme/app_theme.dart';

class LicencePrepApp extends StatelessWidget {
  const LicencePrepApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Licence Prep',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      home: const ShellScreen(),
    );
  }
}
