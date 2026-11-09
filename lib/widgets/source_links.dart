import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/presented.dart';
import '../state/app_state.dart';

class SourceLinks extends StatelessWidget {
  const SourceLinks({super.key, required this.links});

  final List<PresentedLink> links;

  @override
  Widget build(BuildContext context) {
    final s = AppScope.s(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final link in links) ...[
          OutlinedButton.icon(
            onPressed: () => openOfficialUrl(context, link.url),
            icon: const Icon(Icons.open_in_new, size: 18),
            label: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                link.englishOnly && s.isFr
                    ? '${link.label} (${s.english})'
                    : link.label,
                textAlign: TextAlign.left,
              ),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ],
    );
  }
}

Future<void> openOfficialUrl(BuildContext context, String url) async {
  final uri = Uri.parse(url);
  final ok = await launchUrl(uri, mode: LaunchMode.externalApplication);
  if (!ok && context.mounted) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Could not open $url')));
  }
}
