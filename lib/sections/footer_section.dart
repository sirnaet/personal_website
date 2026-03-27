import 'package:flutter/material.dart';
import 'package:personal_website/theme/app_theme.dart';

/// Footer matching JS version.
class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    final year = DateTime.now().year;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: 24,
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: AppTheme.borderColor.withValues(alpha: 0.6),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '(c) $year Brian Sanaet Memusi. All rights reserved.',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppTheme.textSecondary,
                ),
          ),
          Text(
            'Built with Flutter Web.',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppTheme.textSecondary.withValues(alpha: 0.8),
                ),
          ),
        ],
      ),
    );
  }
}
