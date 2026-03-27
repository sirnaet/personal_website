import 'package:flutter/material.dart';
import 'package:personal_website/theme/app_theme.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:personal_website/widgets/magnetic_hover.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 768;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: 100,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Experience',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppTheme.textSecondary,
                  letterSpacing: 2.5,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'What I\'ve been working on',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: AppTheme.textPrimary,
                ),
          ),
          const SizedBox(height: 60),
          ...experiences.asMap().entries.map((entry) {
            final index = entry.key;
            final experience = entry.value;
            return ExperienceTimelineItem(
              experience: experience,
              isLast: index == experiences.length - 1,
            )
                .animate()
                .fadeIn(
                  delay: (index * 150).ms,
                  duration: 600.ms,
                )
                .slideX(begin: -0.2, end: 0);
          }),
        ],
      ),
    );
  }
}

// Experience model
class Experience {
  final String title;
  final String organization;
  final String period;
  final String? description;
  final List<String>? achievements;
  final ExperienceType type;

  const Experience({
    required this.title,
    required this.organization,
    required this.period,
    this.description,
    this.achievements,
    required this.type,
  });
}

enum ExperienceType {
  work,
  education,
  certification,
  leadership,
  service,
}

// Sample experiences
final List<Experience> experiences = [
  const Experience(
    title: 'Engineering Collaborator',
    organization: 'Finesy Enterprises - Hackeric Labs',
    period: '2026 – Present',
    description: 'Contributing to engineering-focused projects within a collaborative R&D environment, supporting the design, development, and testing of innovative technology solutions.',
    type: ExperienceType.work,
  ),
  const Experience(
    title: 'Teaching Assistant',
    organization: 'Entarara Mixed Secondary School',
    period: 'Jan 2026 – March 2026',
    description: 'Helping in teaching Computer Studies and Mathematics to high school students, assisting with lesson planning, grading, and providing support during class activities.',
    type: ExperienceType.service,
  ),
  const Experience(
    title: 'Informatics & Computer Science Student',
    organization: 'Strathmore University',
    period: '2024 – 2028 (expected)',
    description: 'Developing strong foundations in software engineering, cybersecurity, and computer systems through hands-on projects, technical problem-solving, and applied coursework.',
    type: ExperienceType.education,
  ),
];

class ExperienceTimelineItem extends StatelessWidget {
  final Experience experience;
  final bool isLast;

  const ExperienceTimelineItem({
    super.key,
    required this.experience,
    required this.isLast,
  });

  String _getTypeLabel() {
    switch (experience.type) {
      case ExperienceType.work:
        return 'Work';
      case ExperienceType.education:
        return 'Education';
      case ExperienceType.certification:
        return 'Certification';
      case ExperienceType.leadership:
        return 'Leadership';
      case ExperienceType.service:
        return 'Service';
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: isMobile ? 40 : 80,
            child: Column(
              children: [
                Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppTheme.accentColor,
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.accentColor.withValues(alpha: 0.5),
                        blurRadius: 8,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      color: AppTheme.borderColor,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: isMobile ? 16 : 32,
                bottom: isLast ? 0 : 40,
              ),
              child: MagneticHover(
                strength: 10,
                scale: 1.03,
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: AppTheme.cardColor,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: AppTheme.borderColor,
                      width: 1.5,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppTheme.surfaceColor,
                          border: Border.all(
                            color: AppTheme.accentColor.withValues(alpha: 0.3),
                            width: 1,
                          ),
                        ),
                        child: Text(
                          _getTypeLabel(),
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: AppTheme.accentColor,
                                  ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        experience.title,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: AppTheme.textPrimary,
                            ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            experience.organization,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(width: 16),
                          Text(
                            '-',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(width: 16),
                          Text(
                            experience.period,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: AppTheme.textSecondary,
                                ),
                          ),
                        ],
                      ),
                      if (experience.description != null) ...[
                        const SizedBox(height: 16),
                        Text(
                          experience.description!,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                      if (experience.achievements != null &&
                          experience.achievements!.isNotEmpty) ...[
                        const SizedBox(height: 16),
                        ...experience.achievements!.map((achievement) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.only(top: 6, right: 12),
                                  width: 6,
                                  height: 6,
                                  decoration: const BoxDecoration(
                                    color: AppTheme.accentColor,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    achievement,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
