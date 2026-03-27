import 'package:flutter/material.dart';
import 'package:personal_website/theme/app_theme.dart';
import 'package:personal_website/widgets/section_title.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

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
          const SectionTitle(
            title: 'Skills & Tech Stack',
            subtitle: 'Technologies and tools I work with',
          )
              .animate()
              .fadeIn(duration: 600.ms)
              .slideY(begin: -0.2, end: 0),
          const SizedBox(height: 60),
          // Skills grid
          LayoutBuilder(
            builder: (context, constraints) {
              final crossAxisCount = isMobile ? 1 : 2;
              final spacing = isMobile ? 24.0 : 32.0;

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: spacing,
                  mainAxisSpacing: spacing,
                  childAspectRatio: isMobile ? 1.2 : 1.5,
                ),
                itemCount: skillCategories.length,
                itemBuilder: (context, index) {
                  return SkillCategoryCard(
                    category: skillCategories[index],
                  )
                      .animate()
                      .fadeIn(
                        delay: (index * 100).ms,
                        duration: 600.ms,
                      )
                      .slideX(begin: 0.2, end: 0);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

// Skill category model
class SkillCategory {
  final String title;
  final List<String> skills;

  const SkillCategory({
    required this.title,
    required this.skills,
  });
}

// Sample skill categories
final List<SkillCategory> skillCategories = [
  const SkillCategory(
    title: 'Networking',
    skills: [
      'TCP/IP',
      'OSPF/BGP',
      'VPN',
      'Firewall',
      'SDN',
      'Wireshark',
    ],
  ),
  //const SkillCategory(
    //title: 'Cybersecurity',
    //skills: [
      //'Penetration Testing',
      //'Vulnerability Assessment',
      //'SIEM',
      //'IDS/IPS',
      //'Cryptography',
      //'Security Auditing',
   // ],
  //),
  const SkillCategory(
    title: 'Web Development',
    skills: [
      'Flutter',
      'React',
      'Node.js',
      'Python',
      'TypeScript',
      'REST APIs',
      'shadcn/ui',
      'Tailwind CSS',
      'Supabase',
      'PostgreSQL',
      'MySQL',
      'MongoDB',
      'Vite',
      'C++',
      'Java',
      'PHP',
    ],
  ),
  const SkillCategory(
    title: 'Tools & Platforms',
    skills: [
      'Docker',
      'Kubernetes',
      'AWS',
      'Git',
      'Linux',
      'CI/CD',
    ],
  ),
];

class SkillCategoryCard extends StatefulWidget {
  final SkillCategory category;

  const SkillCategoryCard({
    super.key,
    required this.category,
  });

  @override
  State<SkillCategoryCard> createState() => _SkillCategoryCardState();
}

class _SkillCategoryCardState extends State<SkillCategoryCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
        decoration: BoxDecoration(
          color: AppTheme.cardColor,
          border: Border.all(
            color: _isHovered
                ? AppTheme.accentColor.withValues(alpha: 0.5)
                : AppTheme.borderColor,
            width: 1.5,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: AppTheme.accentColor.withValues(alpha: 0.15),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                ]
              : null,
        ),
        transform: Matrix4.identity()
          ..translateByDouble(0.0, _isHovered ? -4.0 : 0.0, 0.0, 1.0),
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Category title
            Text(
              widget.category.title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppTheme.accentColor,
                  ),
            ),
            const SizedBox(height: 20),
            // Skills list
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: widget.category.skills.map((skill) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Row(
                        children: [
                          Container(
                            width: 4,
                            height: 4,
                            decoration: const BoxDecoration(
                              color: AppTheme.accentColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              skill,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
