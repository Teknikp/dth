import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/jurisdiction.dart';

class SourceLinks extends StatelessWidget {
  const SourceLinks({super.key, required this.links});

  final List<OfficialLink> links;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final link in links) ...[
          OutlinedButton.icon(
            onPressed: () => openOfficialUrl(context, link.url),
            icon: const Icon(Icons.open_in_new, size: 18),
            label: Text(link.label, textAlign: TextAlign.left),
            style: OutlinedButton.styleFrom(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
