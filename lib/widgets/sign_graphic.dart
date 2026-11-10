import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../data/road_signs.dart';
import '../l10n/app_locale.dart';

class SignGraphic extends StatelessWidget {
  const SignGraphic({
    super.key,
    required this.sign,
    this.size = 168,
    this.showCaption = false,
    this.locale,
  });

  final RoadSign sign;
  final double size;
  final bool showCaption;
  final AppLocale? locale;

  @override
  Widget build(BuildContext context) {
    final caption = locale == null ? null : sign.nameOf(locale!);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Semantics(
          label: caption ?? sign.nameEn,
          child: Container(
            width: size,
            height: size,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: const Color(0xFFE4D9CC)),
            ),
            child: SvgPicture.asset(sign.asset, fit: BoxFit.contain),
          ),
        ),
        if (showCaption && caption != null) ...[
          const SizedBox(height: 8),
          SizedBox(
            width: size,
            child: Text(
              caption,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ],
      ],
    );
  }
}
