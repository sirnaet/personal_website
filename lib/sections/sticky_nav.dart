import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:personal_website/theme/app_theme.dart';

/// Sticky navigation header matching JS version.
class StickyNav extends StatelessWidget {
  final ValueChanged<String> onSectionTap;

  const StickyNav({super.key, required this.onSectionTap});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 20 : 40,
            vertical: isMobile ? 12 : 16,
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
              isMobile ? 'B. SANAET MEMUSI' : 'BRIAN SANAET MEMUSI',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppTheme.textSecondary,
                    fontWeight: FontWeight.w600,
                    letterSpacing: isMobile ? 2 : 4,
                  ),
            ),
          ),
          if (isMobile)
            Builder(
              builder: (context) => IconButton(
                icon: const Icon(
                  Icons.menu_rounded,
                  color: AppTheme.accentColor,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            )
          else
            Wrap(
              spacing: 24,
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
    ),
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
