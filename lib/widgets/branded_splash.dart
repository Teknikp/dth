import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

/// Full-screen brand while prefs load. Held 2–3s by [LicencePrepApp].
class BrandedSplash extends StatelessWidget {
  const BrandedSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: Key('branded-splash'),
        body: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF083F3A), Color(0xFF0B6E63), Color(0xFF1D6F8A)],
            ),
          ),
          child: SafeArea(
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 28),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomPaint(
                      size: Size(168, 168),
                      painter: SplashMarkPainter(),
                    ),
                    SizedBox(height: 28),
                    Text(
                      'Licence Prep',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFF4EFE6),
                        fontSize: 32,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.6,
                        height: 1.1,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Prépa Permis',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFF7E4B8),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Unofficial Canadian licence study',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xCCF4EFE6),
                        fontSize: 13,
                        height: 1.3,
                      ),
                    ),
                    SizedBox(height: 28),
                    SizedBox(
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
          ),
        ),
      ),
    );
  }
}

class SplashMarkPainter extends CustomPainter {
  const SplashMarkPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final c = Offset(w / 2, h / 2);

    canvas.drawCircle(c, w * 0.48, Paint()..color = const Color(0xFF062E2B));
    canvas.drawCircle(c, w * 0.42, Paint()..color = AppTheme.deep);

    final island = Path()
      ..addOval(Rect.fromCenter(center: c, width: w * 0.72, height: h * 0.58));
    canvas.drawPath(island, Paint()..color = const Color(0xFFE7D7B8));
    canvas.drawPath(
      island,
      Paint()
        ..color = const Color(0xFFC4A574)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2,
    );

    final path = Path()
      ..moveTo(w * 0.22, h * 0.58)
      ..quadraticBezierTo(w * 0.40, h * 0.38, w * 0.55, h * 0.50)
      ..quadraticBezierTo(w * 0.70, h * 0.62, w * 0.78, h * 0.44);
    canvas.drawPath(
      path,
      Paint()
        ..color = AppTheme.clay
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3
        ..strokeCap = StrokeCap.round,
    );

    final car = RRect.fromRectAndRadius(
      Rect.fromCenter(
        center: Offset(w * 0.50, h * 0.55),
        width: w * 0.34,
        height: h * 0.16,
      ),
      const Radius.circular(7),
    );
    canvas.drawRRect(car, Paint()..color = const Color(0xFFF4EFE6));
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(w * 0.36, h * 0.57, w * 0.28, h * 0.07),
        const Radius.circular(4),
      ),
      Paint()..color = AppTheme.clay,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(w * 0.38, h * 0.49, w * 0.12, h * 0.07),
        const Radius.circular(3),
      ),
      Paint()..color = AppTheme.lake,
    );
    canvas.drawCircle(
      Offset(w * 0.40, h * 0.66),
      w * 0.035,
      Paint()..color = const Color(0xFF1A1A1A),
    );
    canvas.drawCircle(
      Offset(w * 0.60, h * 0.66),
      w * 0.035,
      Paint()..color = const Color(0xFF1A1A1A),
    );

    _star(canvas, Offset(w * 0.50, h * 0.30), w * 0.085);
  }

  void _star(Canvas canvas, Offset c, double r) {
    const n = 5;
    final path = Path();
    for (var i = 0; i < n * 2; i++) {
      final ang = -1.5708 + i * 3.14159 / n;
      final rad = i.isEven ? r : r * 0.42;
      final p = Offset(c.dx + rad * _cos(ang), c.dy + rad * _sin(ang));
      if (i == 0) {
        path.moveTo(p.dx, p.dy);
      } else {
        path.lineTo(p.dx, p.dy);
      }
    }
    path.close();
    canvas.drawPath(path, Paint()..color = const Color(0xFFF1C40F));
  }

  double _cos(double a) {
    // Avoid dart:math import churn in this painter; use Flutter's.
    return Offset.fromDirection(a).dx;
  }

  double _sin(double a) => Offset.fromDirection(a).dy;

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
