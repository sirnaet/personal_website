import 'package:flutter/material.dart';
import 'package:personal_website/theme/app_theme.dart';
import 'package:personal_website/widgets/cyber_button.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HeroSection extends StatelessWidget {
  final ValueChanged<String> onSectionTap;

  const HeroSection({
    super.key,
    required this.onSectionTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 768;

    return Container(
      constraints: BoxConstraints(minHeight: size.height * 0.9),
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: 60,
      ),
      child: isMobile
          ? _buildMobileLayout(context, isMobile)
          : _buildDesktopLayout(context, isMobile),
    );
  }

  Widget _buildDesktopLayout(BuildContext context, bool isMobile) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 2,
          child: _buildContent(context, isMobile),
        ),
        const SizedBox(width: 48),
        Expanded(
          flex: 1,
          child: _buildProfilePhoto(context, isMobile),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context, bool isMobile) {
    return Column(
      children: [
        _buildProfilePhoto(context, isMobile),
        const SizedBox(height: 32),
        _buildContent(context, isMobile),
      ],
    );
  }

  Widget _buildContent(BuildContext context, bool isMobile) {
    return Column(
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Personal Website',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppTheme.textSecondary,
                letterSpacing: 3,
              ),
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        )
            .animate()
            .fadeIn(duration: 600.ms),
        const SizedBox(height: 16),
        Text(
          'Hi, I\'m Brian Sanaet Memusi.',
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontSize: isMobile ? 32 : 60,
                fontWeight: FontWeight.w600,
              ),
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        )
            .animate()
            .fadeIn(delay: 200.ms, duration: 600.ms)
            .slideX(begin: isMobile ? 0 : -0.1, end: 0)
            .slideY(begin: isMobile ? 0.1 : 0, end: 0),
        const SizedBox(height: 8),
        Text(
          'Developer - Cybersecurity Enthusiast - Student',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: AppTheme.textSecondary,
                fontSize: isMobile ? 16 : 22,
              ),
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        )
            .animate()
            .fadeIn(delay: 400.ms, duration: 600.ms)
            .slideX(begin: isMobile ? 0 : -0.1, end: 0)
            .slideY(begin: isMobile ? 0.1 : 0, end: 0),
        const SizedBox(height: 24),
        Text(
          'I build clean digital experiences, explore new technologies, and create products that solve real problems - with a focus on security, performance, and thoughtful user experience.',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppTheme.textSecondary,
                fontSize: isMobile ? 15 : 17,
                height: 1.6,
              ),
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        )
            .animate()
            .fadeIn(delay: 600.ms, duration: 600.ms)
            .slideX(begin: isMobile ? 0 : -0.1, end: 0)
            .slideY(begin: isMobile ? 0.1 : 0, end: 0),
        const SizedBox(height: 32),
        Wrap(
          spacing: 16,
          runSpacing: 12,
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          children: [
            CyberButton(
              text: 'View Projects',
              isPrimary: true,
              onPressed: () => onSectionTap('projects'),
            )
                .animate()
                .fadeIn(delay: 800.ms, duration: 600.ms)
                .slideY(begin: 0.2, end: 0),
            CyberButton(
              text: 'Contact Me',
              isPrimary: false,
              onPressed: () => onSectionTap('contact'),
            )
                .animate()
                .fadeIn(delay: 900.ms, duration: 600.ms)
                .slideY(begin: 0.2, end: 0),
            CyberButton(
              text: 'View CV',
              isPrimary: false,
              onPressed: () => onSectionTap('cv'),
            )
                .animate()
                .fadeIn(delay: 1000.ms, duration: 600.ms)
                .slideY(begin: 0.2, end: 0),
          ],
        ),
        const SizedBox(height: 24),
        Text(
          'Based in Nairobi - Available for remote work & collaborations',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppTheme.textSecondary.withValues(alpha: 0.7),
                letterSpacing: isMobile ? 1.5 : 3,
              ),
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        )
            .animate()
            .fadeIn(delay: 1100.ms, duration: 600.ms),
      ],
    );
  }

  Widget _buildProfilePhoto(BuildContext context, bool isMobile) {
    return Center(
      child: Container(
        width: isMobile ? 160 : 224,
        height: isMobile ? 160 : 224,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.2),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.5),
              blurRadius: 40,
              spreadRadius: 0,
            ),
          ],
        ),
        child: ClipOval(
          child: _ProfileImage(),
        ),
      ),
    )
        .animate()
        .fadeIn(delay: 300.ms, duration: 600.ms)
        .scale(delay: 200.ms, duration: 600.ms, begin: const Offset(0.9, 0.9));
  }
}

class _ProfileImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/sanaet.jpg',
      fit: BoxFit.cover,
      errorBuilder: (_, __, ___) => Container(
        color: AppTheme.surfaceColor,
        child: const Icon(
          Icons.person,
          size: 80,
          color: AppTheme.textSecondary,
        ),
      ),
    );
  }
}
