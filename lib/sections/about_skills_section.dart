import 'package:flutter/material.dart';
import 'package:personal_website/theme/app_theme.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:personal_website/widgets/magnetic_hover.dart';

/// About + Skills combined section matching JS version (two cards side by side).
class AboutSkillsSection extends StatelessWidget {
  final Key? aboutKey;
  final Key? skillsKey;

  const AboutSkillsSection({super.key, this.aboutKey, this.skillsKey});

  static const List<String> skills = [
    'React',
    'Next.js',
    'TypeScript',
    'Flutter',
    'Node.js',
    'Python',
    'Network Security',
    'Linux',
    'Docker',
    'Git',
    'Java',
    'C++',
    'Postgresql',
    'MariaDB',
    'Supabase',
    'Tailwind CSS',
    'Vite',
    'shadcn/ui',
    'Laravel',
    'HTML/CSS',
    'JavaScript',
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: 100,
      ),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  key: aboutKey,
                  child: _AboutCard(),
                ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.1, end: 0),
                const SizedBox(height: 32),
                Container(
                  key: skillsKey,
                  child: _SkillsCard(),
                )
                    .animate()
                    .fadeIn(delay: 200.ms, duration: 600.ms)
                    .slideY(begin: 0.1, end: 0),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    key: aboutKey,
                    child: _AboutCard(),
                  )
                      .animate()
                      .fadeIn(duration: 600.ms)
                      .slideY(begin: 0.1, end: 0),
                ),
                const SizedBox(width: 32),
                Expanded(
                  child: Container(
                    key: skillsKey,
                    child: _SkillsCard(),
                  )
                      .animate()
                      .fadeIn(delay: 200.ms, duration: 600.ms)
                      .slideY(begin: 0.1, end: 0),
                ),
              ],
            ),
    );
  }
}

class _AboutCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _SectionCard(
      title: 'About Me',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hi, I\'m Brian Sanaet Memusi, a Computer Science and Informatics student at Strathmore University with a strong interest in computer networks, cybersecurity, and emerging technologies. I enjoy building practical systems that solve real problems, from web applications to tech-driven platforms that connect people and ideas.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppTheme.textSecondary,
                  height: 1.6,
                ),
          ),
          const SizedBox(height: 16),
          Text(
            'Beyond the classroom, I spend time exploring networking technologies, learning through hands-on projects, and keeping up with developments in cybersecurity and AI. My goal is to grow into a skilled technologist who not only understands systems deeply but can also build solutions that make an impact.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppTheme.textSecondary,
                  height: 1.6,
                ),
          ),
        ],
      ),
    );
  }
}

class _SkillsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _SectionCard(
      title: 'Skills',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'A snapshot of the technologies and areas I\'m most comfortable with:',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppTheme.textSecondary,
                ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: AboutSkillsSection.skills.map((skill) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9999),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.15),
                  ),
                ),
                child: Text(
                  skill,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppTheme.textSecondary.withValues(alpha: 0.9),
                      ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  final String title;
  final Widget child;

  const _SectionCard({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return MagneticHover(
      strength: 10,
      scale: 1.03,
      child: Container(
        padding: const EdgeInsets.all(32),
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
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppTheme.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 16),
            child,
          ],
        ),
      ),
    );
  }
}
