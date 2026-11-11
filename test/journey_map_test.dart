import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:licence_prep/widgets/journey_map.dart';

void main() {
  test('trail stations and car stay inside a phone-sized map', () {
    const size = Size(390, 420);
    final geo = TrailGeometry.forCount(8, size);
    const inset = 18.0;
    void inside(Offset o, String label) {
      expect(o.dx, inInclusiveRange(inset, size.width - inset), reason: label);
      expect(o.dy, inInclusiveRange(inset, size.height - inset), reason: label);
    }

    inside(geo.start, 'start');
    inside(geo.finish, 'finish');
    for (var i = 0; i < geo.stations.length; i++) {
      inside(geo.stations[i], 'station $i');
    }
    for (var t = 0.0; t <= 1.0 + 1e-9; t += 0.05) {
      inside(geo.along(t).offset, 't=$t');
    }
  });
}
