import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../l10n/app_locale.dart';
import '../l10n/strings.dart';
import '../models/progress.dart';
import '../theme/app_theme.dart';

/// Original parchment island trail. Not copied from any game screenshot.
class JourneyMap extends StatefulWidget {
  const JourneyMap({
    super.key,
    required this.items,
    required this.done,
    required this.locale,
    required this.strings,
    required this.onSelect,
  });

  final List<ProgressItemDef> items;
  final Set<String> done;
  final AppLocale locale;
  final S strings;
  final void Function(ProgressItemDef item) onSelect;

  @override
  State<JourneyMap> createState() => _JourneyMapState();
}

class _JourneyMapState extends State<JourneyMap>
    with SingleTickerProviderStateMixin {
  late final AnimationController _car;
  late Animation<double> _tAnim;
  var _t = 0.0;

  @override
  void initState() {
    super.initState();
    _t = _targetT();
    _car = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _tAnim = AlwaysStoppedAnimation(_t);
    _car.addListener(() => setState(() => _t = _tAnim.value));
  }

  @override
  void didUpdateWidget(covariant JourneyMap oldWidget) {
    super.didUpdateWidget(oldWidget);
    final next = _targetT();
    if ((next - _t).abs() < 0.001) return;
    _tAnim = Tween<double>(begin: _t, end: next).animate(
      CurvedAnimation(parent: _car, curve: Curves.easeInOutCubic),
    );
    _car.forward(from: 0);
  }

  @override
  void dispose() {
    _car.dispose();
    super.dispose();
  }

  double _targetT() {
    final n = widget.items.length;
    if (n == 0) return 0;
    var furthest = -1;
    for (var i = 0; i < n; i++) {
      if (widget.done.contains(widget.items[i].id)) furthest = i;
    }
    // Start dock is t=0; stations sit at (i+1)/n.
    return (furthest + 1) / n;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = Size(
          constraints.maxWidth,
          math.max(constraints.maxHeight, 520),
        );
        final geo = TrailGeometry.forCount(widget.items.length, size);
        final carPos = geo.along(_t);
        return ClipRRect(
          borderRadius: BorderRadius.circular(22),
          child: SizedBox(
            width: size.width,
            height: size.height,
            child: Stack(
              clipBehavior: Clip.hardEdge,
              children: [
                CustomPaint(
                  size: size,
                  painter: _IslandPainter(
                    geometry: geo,
                    progressT: _t,
                  ),
                ),
                for (var i = 0; i < widget.items.length; i++)
                  _StopNode(
                    item: widget.items[i],
                    offset: geo.stations[i],
                    done: widget.done.contains(widget.items[i].id),
                    next: _isNext(i),
                    label: widget.items[i].shortLabel(widget.locale),
                    onTap: () => widget.onSelect(widget.items[i]),
                  ),
                _StartBadge(
                  offset: geo.start,
                  label: widget.strings.mapStart,
                ),
                _FinishBadge(
                  offset: geo.finish,
                  label: widget.strings.mapFinish,
                ),
                _CarToken(pose: carPos),
              ],
            ),
          ),
        );
      },
    );
  }

  bool _isNext(int i) {
    for (var k = 0; k < i; k++) {
      if (!widget.done.contains(widget.items[k].id)) return false;
    }
    return !widget.done.contains(widget.items[i].id);
  }
}

class TrailPose {
  const TrailPose(this.offset, this.angle);
  final Offset offset;
  final double angle;
}

class TrailGeometry {
  TrailGeometry._({
    required this.size,
    required this.path,
    required this.start,
    required this.finish,
    required this.stations,
  });

  final Size size;
  final Path path;
  final Offset start;
  final Offset finish;
  final List<Offset> stations;

  factory TrailGeometry.forCount(int n, Size size) {
    final w = size.width;
    final h = size.height;
    final waypoints = <Offset>[
      Offset(w * 0.22, h * 0.84),
      Offset(w * 0.42, h * 0.74),
      Offset(w * 0.70, h * 0.64),
      Offset(w * 0.78, h * 0.50),
      Offset(w * 0.48, h * 0.42),
      Offset(w * 0.24, h * 0.32),
      Offset(w * 0.38, h * 0.22),
      Offset(w * 0.66, h * 0.15),
      Offset(w * 0.80, h * 0.10),
    ];
    final path = Path()..moveTo(waypoints.first.dx, waypoints.first.dy);
    for (var i = 1; i < waypoints.length; i++) {
      final prev = waypoints[i - 1];
      final cur = waypoints[i];
      final mid = Offset((prev.dx + cur.dx) / 2, (prev.dy + cur.dy) / 2);
      path.quadraticBezierTo(prev.dx, prev.dy, mid.dx, mid.dy);
    }
    path.lineTo(waypoints.last.dx, waypoints.last.dy);

    final metrics = path.computeMetrics().toList();
    Offset at(double t) {
      if (metrics.isEmpty) return waypoints.first;
      final total = metrics.fold<double>(0, (s, m) => s + m.length);
      var d = (t.clamp(0.0, 1.0)) * total;
      for (final m in metrics) {
        if (d <= m.length) {
          return m.getTangentForOffset(d)?.position ?? waypoints.first;
        }
        d -= m.length;
      }
      return waypoints.last;
    }

    final stations = n <= 0
        ? const <Offset>[]
        : [
            for (var i = 0; i < n; i++) at((i + 0.55) / (n + 0.6)),
          ];
    return TrailGeometry._(
      size: size,
      path: path,
      start: at(0.02),
      finish: at(0.98),
      stations: stations,
    );
  }

  TrailPose along(double t) {
    final metrics = path.computeMetrics().toList();
    if (metrics.isEmpty) return TrailPose(start, 0);
    final total = metrics.fold<double>(0, (s, m) => s + m.length);
    var d = t.clamp(0.0, 1.0) * total;
    for (final m in metrics) {
      if (d <= m.length) {
        final tan = m.getTangentForOffset(d);
        if (tan == null) break;
        return TrailPose(tan.position, tan.angle);
      }
      d -= m.length;
    }
    return TrailPose(finish, 0);
  }
}

class _IslandPainter extends CustomPainter {
  _IslandPainter({required this.geometry, required this.progressT});

  final TrailGeometry geometry;
  final double progressT;

  @override
  void paint(Canvas canvas, Size size) {
    _paintWater(canvas, size);
    _paintIslands(canvas, size);
    _paintTrees(canvas, size);
    _paintPath(canvas);
    _paintCompass(canvas, size);
  }

  void _paintWater(Canvas canvas, Size size) {
    final water = Paint()
      ..shader = ui.Gradient.linear(
        Offset(0, 0),
        Offset(size.width, size.height),
        const [Color(0xFF1A6A86), Color(0xFF2F6FA8), Color(0xFF0B6E63)],
        [0, 0.55, 1],
      );
    canvas.drawRect(Offset.zero & size, water);
    final wave = Paint()
      ..color = Colors.white.withValues(alpha: 0.10)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.4;
    for (var i = 0; i < 7; i++) {
      final y = size.height * (0.12 + i * 0.13);
      final path = Path();
      path.moveTo(0, y);
      for (var x = 0.0; x <= size.width; x += 18) {
        path.quadraticBezierTo(
          x + 9,
          y + ((i.isEven ? 5 : -5) * math.sin(x / 40)),
          x + 18,
          y,
        );
      }
      canvas.drawPath(path, wave);
    }
  }

  void _paintIslands(Canvas canvas, Size size) {
    final island = Path()
      ..moveTo(size.width * 0.08, size.height * 0.72)
      ..cubicTo(
        size.width * 0.02,
        size.height * 0.42,
        size.width * 0.18,
        size.height * 0.08,
        size.width * 0.48,
        size.height * 0.06,
      )
      ..cubicTo(
        size.width * 0.82,
        size.height * 0.04,
        size.width * 0.98,
        size.height * 0.28,
        size.width * 0.94,
        size.height * 0.52,
      )
      ..cubicTo(
        size.width * 0.90,
        size.height * 0.78,
        size.width * 0.62,
        size.height * 0.98,
        size.width * 0.32,
        size.height * 0.94,
      )
      ..cubicTo(
        size.width * 0.14,
        size.height * 0.92,
        size.width * 0.10,
        size.height * 0.82,
        size.width * 0.08,
        size.height * 0.72,
      )
      ..close();

    canvas.drawPath(
      island.shift(const Offset(3, 6)),
      Paint()..color = const Color(0xFF0A3D48).withValues(alpha: 0.28),
    );
    canvas.drawPath(
      island,
      Paint()
        ..shader = ui.Gradient.linear(
          Offset(size.width * 0.2, size.height * 0.1),
          Offset(size.width * 0.8, size.height * 0.9),
          const [Color(0xFFF7E4B8), Color(0xFFE7C98A), Color(0xFFD9B56A)],
          [0, 0.5, 1],
        ),
    );
    canvas.drawPath(
      island,
      Paint()
        ..color = const Color(0xFFB8883A)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3,
    );

    final inner = Paint()
      ..color = const Color(0xFFFFF6DC).withValues(alpha: 0.35);
    canvas.save();
    canvas.clipPath(island);
    canvas.drawCircle(
      Offset(size.width * 0.45, size.height * 0.42),
      size.width * 0.42,
      inner,
    );
    final speckle = Paint()..color = const Color(0xFFC4A05A).withValues(alpha: 0.28);
    final rng = math.Random(7);
    for (var i = 0; i < 48; i++) {
      canvas.drawCircle(
        Offset(rng.nextDouble() * size.width, rng.nextDouble() * size.height),
        rng.nextDouble() * 1.8 + 0.4,
        speckle,
      );
    }
    canvas.restore();

    _blob(
      canvas,
      Offset(size.width * 0.12, size.height * 0.18),
      28,
      18,
      const Color(0xFFE8D09A),
    );
    _blob(
      canvas,
      Offset(size.width * 0.88, size.height * 0.82),
      34,
      20,
      const Color(0xFFE4C98A),
    );
  }

  void _blob(Canvas canvas, Offset c, double rx, double ry, Color color) {
    final path = Path()
      ..addOval(Rect.fromCenter(center: c, width: rx * 2, height: ry * 2));
    canvas.drawPath(path, Paint()..color = const Color(0xFF0A3D48).withValues(alpha: 0.2));
    canvas.drawPath(path, Paint()..color = color);
    canvas.drawPath(
      path,
      Paint()
        ..color = const Color(0xFFB8883A)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2,
    );
  }

  void _paintTrees(Canvas canvas, Size size) {
    void pine(Offset p, double h) {
      final trunk = Paint()..color = const Color(0xFF6B3F1F);
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromCenter(center: p, width: 4, height: h * 0.28),
          const Radius.circular(1),
        ),
        trunk,
      );
      final leaf = Paint()..color = const Color(0xFF2E7D57);
      canvas.drawPath(
        Path()
          ..moveTo(p.dx, p.dy - h)
          ..lineTo(p.dx + h * 0.38, p.dy - h * 0.28)
          ..lineTo(p.dx - h * 0.38, p.dy - h * 0.28)
          ..close(),
        leaf,
      );
      canvas.drawPath(
        Path()
          ..moveTo(p.dx, p.dy - h * 0.72)
          ..lineTo(p.dx + h * 0.46, p.dy - h * 0.08)
          ..lineTo(p.dx - h * 0.46, p.dy - h * 0.08)
          ..close(),
        Paint()..color = const Color(0xFF246B4A),
      );
    }

    pine(Offset(size.width * 0.30, size.height * 0.20), 28);
    pine(Offset(size.width * 0.86, size.height * 0.28), 22);
    pine(Offset(size.width * 0.16, size.height * 0.58), 24);
    pine(Offset(size.width * 0.58, size.height * 0.84), 26);
  }

  void _paintPath(Canvas canvas) {
    final remaining = Paint()
      ..color = const Color(0xFF5C3A1E)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;
    _dash(canvas, geometry.path, remaining, 7, 8);

    final metrics = geometry.path.computeMetrics();
    for (final m in metrics) {
      final done = m.extractPath(0, m.length * progressT.clamp(0.0, 1.0));
      canvas.drawPath(
        done,
        Paint()
          ..color = const Color(0xFF0B6E63)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 5.5
          ..strokeCap = StrokeCap.round,
      );
      canvas.drawPath(
        done,
        Paint()
          ..color = const Color(0xFFF1C40F)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2.2
          ..strokeCap = StrokeCap.round,
      );
    }
  }

  void _dash(Canvas canvas, Path path, Paint paint, double on, double off) {
    for (final metric in path.computeMetrics()) {
      var d = 0.0;
      var draw = true;
      while (d < metric.length) {
        final next = math.min(d + (draw ? on : off), metric.length);
        if (draw) {
          canvas.drawPath(metric.extractPath(d, next), paint);
        }
        d = next;
        draw = !draw;
      }
    }
  }

  void _paintCompass(Canvas canvas, Size size) {
    final c = Offset(size.width - 28, 28);
    canvas.drawCircle(c, 16, Paint()..color = const Color(0xFFFFF6DC));
    canvas.drawCircle(
      c,
      16,
      Paint()
        ..color = const Color(0xFFB8883A)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.6,
    );
    final n = Path()
      ..moveTo(c.dx, c.dy - 12)
      ..lineTo(c.dx + 5, c.dy)
      ..lineTo(c.dx, c.dy + 4)
      ..lineTo(c.dx - 5, c.dy)
      ..close();
    canvas.drawPath(n, Paint()..color = AppTheme.clay);
    final tp = TextPainter(
      text: const TextSpan(
        text: 'N',
        style: TextStyle(
          fontSize: 8,
          fontWeight: FontWeight.w800,
          color: Color(0xFF5C3A1E),
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    tp.paint(canvas, Offset(c.dx - tp.width / 2, c.dy + 6));
  }

  @override
  bool shouldRepaint(covariant _IslandPainter oldDelegate) =>
      oldDelegate.progressT != progressT ||
      oldDelegate.geometry.size != geometry.size;
}

class _StopNode extends StatelessWidget {
  const _StopNode({
    required this.item,
    required this.offset,
    required this.done,
    required this.next,
    required this.label,
    required this.onTap,
  });

  final ProgressItemDef item;
  final Offset offset;
  final bool done;
  final bool next;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: offset.dx - 28,
      top: offset.dy - 28,
      child: GestureDetector(
        key: Key('check-${item.id}'),
        onTap: onTap,
        child: SizedBox(
          width: 56,
          height: 70,
          child: Column(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 280),
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: done ? const Color(0xFFF1C40F) : Colors.white,
                  border: Border.all(
                    color: next ? AppTheme.clay : const Color(0xFF0B6E63),
                    width: next ? 3 : 2.4,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.18),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: done
                      ? const CustomPaint(
                          size: Size(16, 16),
                          painter: _StarPainter(),
                        )
                      : Icon(
                          _iconFor(item.kind),
                          size: 16,
                          color: AppTheme.deep,
                        ),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF3A2410),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _iconFor(ProgressItemKind kind) {
    return switch (kind) {
      ProgressItemKind.knowledge => Icons.menu_book,
      ProgressItemKind.vision => Icons.visibility,
      ProgressItemKind.road => Icons.directions_car,
      ProgressItemKind.wait => Icons.flag,
      ProgressItemKind.admin => Icons.badge,
    };
  }
}

class _StarPainter extends CustomPainter {
  const _StarPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final c = Offset(size.width / 2, size.height / 2);
    final r = size.width / 2;
    final path = Path();
    for (var i = 0; i < 5; i++) {
      final a = -math.pi / 2 + i * 2 * math.pi / 5;
      final p = Offset(c.dx + r * math.cos(a), c.dy + r * math.sin(a));
      if (i == 0) {
        path.moveTo(p.dx, p.dy);
      } else {
        path.lineTo(p.dx, p.dy);
      }
      final a2 = a + math.pi / 5;
      path.lineTo(
        c.dx + r * 0.42 * math.cos(a2),
        c.dy + r * 0.42 * math.sin(a2),
      );
    }
    path.close();
    canvas.drawPath(path, Paint()..color = const Color(0xFF7A4A00));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _StartBadge extends StatelessWidget {
  const _StartBadge({required this.offset, required this.label});

  final Offset offset;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: offset.dx - 28,
      top: offset.dy + 10,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        decoration: BoxDecoration(
          color: const Color(0xFF5C3A1E),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Color(0xFFF7E4B8),
            fontSize: 10,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}

class _FinishBadge extends StatelessWidget {
  const _FinishBadge({required this.offset, required this.label});

  final Offset offset;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: offset.dx - 22,
      top: offset.dy - 40,
      child: Column(
        children: [
          const CustomPaint(size: Size(22, 22), painter: _StarPainter()),
          Text(
            label,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w800,
              color: Color(0xFF7A4A00),
            ),
          ),
        ],
      ),
    );
  }
}

class _CarToken extends StatelessWidget {
  const _CarToken({required this.pose});

  final TrailPose pose;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: pose.offset.dx - 18,
      top: pose.offset.dy - 28,
      child: Transform.rotate(
        angle: pose.angle + math.pi / 2,
        child: const CustomPaint(
          key: Key('progress-car'),
          size: Size(36, 22),
          painter: _CarPainter(),
        ),
      ),
    );
  }
}

class _CarPainter extends CustomPainter {
  const _CarPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final body = RRect.fromRectAndRadius(
      Rect.fromLTWH(2, 6, size.width - 4, size.height - 10),
      const Radius.circular(6),
    );
    canvas.drawRRect(body, Paint()..color = const Color(0xFFD9773A));
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(8, 2, size.width - 16, 10),
        const Radius.circular(4),
      ),
      Paint()..color = const Color(0xFF0B6E63),
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(11, 3.5, size.width - 22, 6),
        const Radius.circular(2),
      ),
      Paint()..color = const Color(0xFFD3E4F5),
    );
    final wheel = Paint()..color = const Color(0xFF1A1A1A);
    canvas.drawCircle(Offset(10, size.height - 3), 3.2, wheel);
    canvas.drawCircle(Offset(size.width - 10, size.height - 3), 3.2, wheel);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
