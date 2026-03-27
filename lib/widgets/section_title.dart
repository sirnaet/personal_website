import 'package:flutter/material.dart';
import 'package:personal_website/theme/app_theme.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final String? subtitle;

  const SectionTitle({
    super.key,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                color: AppTheme.accentColor,
              ),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 12),
          Text(
            subtitle!,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ],
    );
  }
}
