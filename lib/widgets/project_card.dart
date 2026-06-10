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
    final projectUrl = (project.githubUrl != null && project.githubUrl!.isNotEmpty)
        ? project.githubUrl
        : ((project.demoUrl != null && project.demoUrl!.isNotEmpty) ? project.demoUrl : null);
    final projectLabel = (project.githubUrl != null && project.githubUrl!.isNotEmpty)
        ? (project.githubLabel ?? 'GitHub')
        : (project.demoLabel ?? 'Live');

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
            if (projectUrl != null && projectUrl.isNotEmpty) ...[
              const SizedBox(height: 12),
              _ProjectButton(
                label: projectLabel,
                onTap: () => _openUrl(projectUrl),
              ),
            ],
            const SizedBox(height: 16),
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
          ],
        ),
      ),
    );
  }
}

class _ProjectButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;

  const _ProjectButton({
    required this.label,
    required this.onTap,
  });

  @override
  State<_ProjectButton> createState() => _ProjectButtonState();
}

class _ProjectButtonState extends State<_ProjectButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 150),
        opacity: _isHovered ? 0.9 : 1.0,
        child: Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          child: InkWell(
            onTap: widget.onTap,
            borderRadius: BorderRadius.circular(12),
            splashColor: Colors.black.withValues(alpha: 0.1),
            highlightColor: Colors.black.withValues(alpha: 0.05),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10),
              alignment: Alignment.center,
              child: Text(
                widget.label,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  fontFamily: AppTheme.headingFont,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
