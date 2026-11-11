import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

/// In-app branded loader while [AppState] hydrates. Matches the native splash.
class BrandedSplash extends StatelessWidget {
  const BrandedSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppTheme.seed,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CustomPaint(
                size: Size(88, 88),
                painter: _SplashMarkPainter(),
              ),
              const SizedBox(height: 20),
              const Text(
                'Licence Prep',
                style: TextStyle(
                  color: Color(0xFFF7E4B8),
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.4,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Prépa Permis',
                style: TextStyle(
                  color: const Color(0xFFF7E4B8).withValues(alpha: 0.85),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 28),
              const SizedBox(
                width: 22,
                height: 22,
                child: CircularProgressIndicator(
                  strokeWidth: 2.4,
                  color: Color(0xFFF7E4B8),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SplashMarkPainter extends CustomPainter {
  const _SplashMarkPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final c = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(c, size.width / 2, Paint()..color = AppTheme.deep);
    final body = RRect.fromRectAndRadius(
      Rect.fromLTWH(
        size.width * 0.16,
        size.height * 0.52,
        size.width * 0.68,
        size.height * 0.26,
      ),
      const Radius.circular(8),
    );
    canvas.drawRRect(body, Paint()..color = AppTheme.clay);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          size.width * 0.24,
          size.height * 0.34,
          size.width * 0.52,
          size.height * 0.22,
        ),
        const Radius.circular(6),
      ),
      Paint()..color = AppTheme.paper,
    );
    canvas.drawCircle(
      Offset(size.width * 0.32, size.height * 0.82),
      5,
      Paint()..color = const Color(0xFF1A1A1A),
    );
    canvas.drawCircle(
      Offset(size.width * 0.68, size.height * 0.82),
      5,
      Paint()..color = const Color(0xFF1A1A1A),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
