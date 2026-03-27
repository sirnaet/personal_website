import 'package:flutter/material.dart';
import 'package:personal_website/theme/app_theme.dart';

/// Sticky navigation header matching JS version.
class StickyNav extends StatelessWidget {
  final ValueChanged<String> onSectionTap;

  const StickyNav({super.key, required this.onSectionTap});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 40,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.8),
        border: Border(
          bottom: BorderSide(
            color: Colors.white.withValues(alpha: 0.1),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => onSectionTap('top'),
            child: Text(
              'BRIAN SANAET MEMUSI',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppTheme.textSecondary,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 4,
                  ),
            ),
          ),
          Wrap(
            spacing: isMobile ? 12 : 24,
            runSpacing: 8,
            alignment: WrapAlignment.end,
            children: [
              _NavLink(label: 'About', onTap: () => onSectionTap('about')),
              _NavLink(label: 'Skills', onTap: () => onSectionTap('skills')),
              _NavLink(label: 'Projects', onTap: () => onSectionTap('projects')),
              _NavLink(
                label: 'Experience',
                onTap: () => onSectionTap('experience'),
              ),
              _NavLink(label: 'CV', onTap: () => onSectionTap('cv')),
              _NavLink(label: 'Contact', onTap: () => onSectionTap('contact')),
            ],
          ),
        ],
      ),
    );
  }
}

class _NavLink extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _NavLink({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppTheme.textSecondary,
              ),
        ),
      ),
    );
  }
}
