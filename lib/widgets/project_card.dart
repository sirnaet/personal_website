import 'package:flutter/material.dart';
import 'package:personal_website/theme/app_theme.dart';
import 'package:personal_website/models/project.dart';
import 'package:personal_website/widgets/magnetic_hover.dart';
import 'package:personal_website/widgets/glassmorphic_container.dart';
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

  LinearGradient _getProjectGradient(String title) {
    switch (title) {
      case 'School Bloom':
        return const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0x4C059669), // emerald-600/30
            Color(0x1A134E4A), // teal-900/10
          ],
        );
      case 'Love Notes':
        return const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0x4CDB2777), // pink-600/30
            Color(0x1A4C0519), // rose-900/10
          ],
        );
      case 'Personal Portfolio Website':
        return const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0x4C4F46E5), // indigo-600/30
            Color(0x1A4C1D95), // violet-900/10
          ],
        );
      default: // e.g. FedhaSmart
        return const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0x4CD97706), // amber-600/30
            Color(0x1A7C2D12), // orange-900/10
          ],
        );
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
      child: GlassmorphicContainer(
        padding: const EdgeInsets.all(16),
        borderRadius: BorderRadius.circular(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Top placeholder (matches JS: h-40 rounded-2xl bg-white/10 with gradient and initials)
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: _getProjectGradient(project.title),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.05),
                  width: 1,
                ),
              ),
              child: Center(
                child: Text(
                  project.title
                      .split(' ')
                      .where((w) => w.isNotEmpty)
                      .map((w) => w[0])
                      .join('')
                      .toUpperCase(),
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                    color: Color(0x4DFFFFFF), // white/30
                    letterSpacing: 2.0,
                  ),
                ),
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
