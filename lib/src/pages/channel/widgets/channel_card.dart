import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ChannelCard extends StatelessWidget {
  final IconData? icon;
  final String? iconImagePath;
  final String title;
  final String url;
  final Color color;

  const ChannelCard({
    super.key,
    this.icon,
    this.iconImagePath,
    required this.title,
    required this.url,
    required this.color,
  });

  void _openUrl() async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      launchUrl(uri);
    } else {
      // Tratar erro depois
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
        border: Border.all(color: color.withValues(alpha: 0.4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (icon != null)
            FaIcon(icon, size: 36, color: color)
          else if (iconImagePath != null)
            SizedBox(
              height: 50,
              child: Image.asset(iconImagePath!),
            ),
          const SizedBox(height: 12),
          Text(title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: color,
                  )),
          const SizedBox(height: 8),
          ElevatedButton.icon(
            onPressed: _openUrl,
            icon: const Icon(Icons.open_in_new),
            label: const Text('Acessar'),
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
              foregroundColor: Theme.of(context).cardColor,
            ),
          ),
          const SizedBox(height: 8),
          ElevatedButton.icon(
            onPressed: _openUrl,
            icon: const Icon(Icons.copy),
            label: const Text(
              'Copiar Link',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
              foregroundColor: Theme.of(context).cardColor,
            ),
          ),
        ],
      ),
    );
  }
}
