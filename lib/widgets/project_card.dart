import 'package:flutter/material.dart';
import 'package:personal_website/theme/app_theme.dart';
import 'package:personal_website/models/project.dart';
import 'package:personal_website/widgets/magnetic_hover.dart';
import 'package:url_launcher/url_launcher.dart';

/// Project card matching JS version: rounded-3xl, top placeholder, title, description, tech pills.
class ProjectCard extends StatelessWidget {
  final Project project;

  const ProjectCard({
    super.key,
    required this.project,
  });

  Future<void> _openUrl(String url) async {
    final uri = Uri.parse(url);
    if (url.startsWith('/')) {
      await launchUrl(uri, webOnlyWindowName: '_self');
      return;
    }
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final hasLinks =
        project.githubUrl != null && project.githubUrl!.isNotEmpty ||
            project.demoUrl != null && project.demoUrl!.isNotEmpty;

    return MagneticHover(
      strength: 10,
      scale: 1.02,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppTheme.cardColor,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: AppTheme.borderColor.withValues(alpha: 0.6),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Top placeholder (matches JS: h-40 rounded-2xl bg-white/10)
            Container(
              height: 92,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.06),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            const SizedBox(height: 12),
            // Title
            Text(
              project.title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppTheme.textPrimary,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 6),
            // Description
            Text(
              project.description,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppTheme.textSecondary,
                    height: 1.35,
                    fontSize: 13,
                  ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppTheme.textSecondary,
                      fontSize: 11,
                    ),
                children: [
                  const TextSpan(text: 'Duration: '),
                  TextSpan(
                    text: project.duration,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppTheme.textPrimary,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            // Tech tags as pills (matches JS: rounded-full border-white/15)
            Wrap(
              spacing: 4,
              runSpacing: 4,
              children: project.techStack.map((tech) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9999),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.15),
                    ),
                  ),
                  child: Text(
                    tech,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppTheme.textSecondary,
                          fontSize: 10,
                        ),
                  ),
                );
              }).toList(),
            ),
            if (hasLinks) ...[
              const SizedBox(height: 10),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: [
                  if (project.githubUrl != null &&
                      project.githubUrl!.isNotEmpty)
                    _ProjectLinkButton(
                      label: project.githubLabel ?? 'GitHub',
                      icon: Icons.code_rounded,
                      onTap: () => _openUrl(project.githubUrl!),
                    ),
                  if (project.demoUrl != null && project.demoUrl!.isNotEmpty)
                    _ProjectLinkButton(
                      label: project.demoLabel ?? 'Live',
                      icon: Icons.open_in_new_rounded,
                      onTap: () => _openUrl(project.demoUrl!),
                    ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _ProjectLinkButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const _ProjectLinkButton({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(9999),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9999),
            border: Border.all(
              color: AppTheme.borderColor.withValues(alpha: 0.8),
            ),
            color: AppTheme.surfaceColor.withValues(alpha: 0.55),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 12,
                color: AppTheme.textPrimary,
              ),
              const SizedBox(width: 4),
              Text(
                label,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppTheme.textPrimary,
                      fontWeight: FontWeight.w600,
                      fontSize: 10,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
