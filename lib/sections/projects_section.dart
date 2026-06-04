import 'package:flutter/material.dart';
import 'package:personal_website/models/project.dart';
import 'package:personal_website/theme/app_theme.dart';
import 'package:personal_website/widgets/section_title.dart';
import 'package:personal_website/widgets/project_card.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 768;
    final isTablet = size.width >= 768 && size.width < 1024;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: 100,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Portfolio',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppTheme.textSecondary,
                      letterSpacing: 2.5,
                    ),
              ),
              const SizedBox(height: 8),
              const SectionTitle(
                title: 'Featured Projects',
                subtitle:
                    'A selection of work that reflects how I think about problem-solving, design, and implementation.',
              ),
            ],
          ).animate().fadeIn(duration: 600.ms).slideY(begin: -0.2, end: 0),
          const SizedBox(height: 60),
          LayoutBuilder(
            builder: (context, constraints) {
              final spacing = isMobile ? 24.0 : 32.0;

              if (isMobile) {
                return Column(
                  children: List.generate(projects.length, (index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: spacing),
                      child: ProjectCard(project: projects[index])
                          .animate()
                          .fadeIn(
                            delay: (index * 100).ms,
                            duration: 600.ms,
                          )
                          .slideY(begin: 0.2, end: 0),
                    );
                  }),
                );
              }

              final crossAxisCount = isTablet ? 2 : 3;
              final mainAxisExtent = isTablet ? 360.0 : 345.0;

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: spacing,
                  mainAxisSpacing: spacing,
                  mainAxisExtent: mainAxisExtent,
                ),
                itemCount: projects.length,
                itemBuilder: (context, index) {
                  return ProjectCard(project: projects[index])
                      .animate()
                      .fadeIn(
                        delay: (index * 100).ms,
                        duration: 600.ms,
                      )
                      .slideY(begin: 0.2, end: 0);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

// Projects data (matches JS version)
final List<Project> projects = [
  const Project(
    title: 'School Bloom',
    description:
      'A subscription based school management system tailored to the Kenyan CBE curriculum. It offers role based access to the different stakeholders in education (School Admins, Teachers, Parents) and staff (Bursar and Librarian)',
    techStack: [
      'TypeScript',
      'Tailwind CSS',
      'React',
      'Supabase',
      'nodeMailer',
      'Vite',
      'Safaricom Daraja API'
    ],
    duration: 'Jan 2026 - Present',
    githubUrl: '/',
    githubLabel: 'School Bloom',
  ),
  const Project(
    title: 'Love Notes',
    description:
      'A small static web app that displays random love notes, lets users filter by vibe, and download a styled shareable card image..',
    techStack: ['html', 'css', 'Laravel', 'JavaScript'],
    duration: 'Jan 2026 - Feb 2026',
    githubUrl: 'https://github.com/sirnaet/valentine',
    githubLabel: 'Love Notes',
  ),
  const Project(
    title: 'Personal Portfolio Website',
    description:
      'A responsive portfolio website showcasing my projects and skills.',
    techStack: ['React', 'TypeScript', 'Tailwind CSS', 'Flutter'],
    duration: 'Ongoing',
    demoUrl: '/',
    demoLabel: 'Deployed Project',
  ),
  const Project(
    title: 'FedhaSmart',
    description:
      'A financial system for individuals to track their income, expenses, budgets, and savings goals with a simple and intuitive interface.',
    techStack: [
      'React',
      'Tailwind CSS',
      'Supabase',
      'Vite',
      'TypeScript',
      'shadcn/ui'
    ],
    duration: 'August 2025 - November 2025',
    githubUrl: 'https://github.com/sirnaet/Fedha-Smart',
    githubLabel: 'FedhaSmart',
  ),
];
