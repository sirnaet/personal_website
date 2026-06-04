import 'package:flutter/material.dart';
import 'package:personal_website/theme/app_theme.dart';

class MobileDrawer extends StatelessWidget {
  final ValueChanged<String> onSectionTap;

  const MobileDrawer({super.key, required this.onSectionTap});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppTheme.backgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          bottomLeft: Radius.circular(24),
        ),
      ),
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            left: BorderSide(
              color: AppTheme.borderColor,
              width: 1.5,
            ),
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'NAVIGATION',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppTheme.accentColor,
                            letterSpacing: 3.5,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, color: AppTheme.textSecondary),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
              ),
              const Divider(color: AppTheme.borderColor, height: 1),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  children: [
                    _DrawerLink(
                      label: 'About',
                      icon: Icons.person_outline,
                      onTap: () {
                        Navigator.of(context).pop();
                        onSectionTap('about');
                      },
                    ),
                    _DrawerLink(
                      label: 'Skills',
                      icon: Icons.code_rounded,
                      onTap: () {
                        Navigator.of(context).pop();
                        onSectionTap('skills');
                      },
                    ),
                    _DrawerLink(
                      label: 'Projects',
                      icon: Icons.folder_open_rounded,
                      onTap: () {
                        Navigator.of(context).pop();
                        onSectionTap('projects');
                      },
                    ),
                    _DrawerLink(
                      label: 'Experience',
                      icon: Icons.work_outline,
                      onTap: () {
                        Navigator.of(context).pop();
                        onSectionTap('experience');
                      },
                    ),
                    _DrawerLink(
                      label: 'CV',
                      icon: Icons.description_outlined,
                      onTap: () {
                        Navigator.of(context).pop();
                        onSectionTap('cv');
                      },
                    ),
                    _DrawerLink(
                      label: 'Contact',
                      icon: Icons.mail_outline_rounded,
                      onTap: () {
                        Navigator.of(context).pop();
                        onSectionTap('contact');
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(
                  '© ${DateTime.now().year} Brian Sanaet Memusi',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppTheme.textSecondary.withValues(alpha: 0.6),
                        fontSize: 10,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DrawerLink extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const _DrawerLink({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppTheme.textSecondary, size: 20),
      title: Text(
        label,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppTheme.textPrimary,
              fontWeight: FontWeight.w500,
            ),
      ),
      trailing: const Icon(
        Icons.chevron_right_rounded,
        color: AppTheme.borderColor,
        size: 16,
      ),
      onTap: onTap,
      hoverColor: AppTheme.surfaceColor,
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
    );
  }
}
