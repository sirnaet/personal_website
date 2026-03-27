import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:personal_website/theme/app_theme.dart';
import 'package:personal_website/widgets/cyber_button.dart';
import 'package:personal_website/widgets/magnetic_hover.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:personal_website/utils/file_downloader.dart';

/// CV/Resume section matching JS version.
class CvSection extends StatelessWidget {
  const CvSection({super.key});

  Future<void> _downloadCv(BuildContext context) async {
    const url = '/cv/MemusiSanaetCV.pdf';
    await downloadFile(
      url,
      filename: kIsWeb ? 'MemusiSanaetCV.pdf' : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: 100,
      ),
      child: MagneticHover(
        strength: 10,
        scale: 1.03,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 24 : 40,
            vertical: 40,
          ),
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
                'CV / Resume',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppTheme.textPrimary,
                    ),
              ),
              const SizedBox(height: 16),
              Text(
                'Want a quick overview of my background, skills, and experience? You can download my CV and keep it on hand for future roles, collaborations, or referrals.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppTheme.textSecondary,
                      height: 1.6,
                    ),
              ),
              const SizedBox(height: 24),
              CyberButton(
                text: 'Download CV',
                isPrimary: true,
                onPressed: () => _downloadCv(context),
              ),
            ],
          ),
        ),
      ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.1, end: 0),
    );
  }
}
