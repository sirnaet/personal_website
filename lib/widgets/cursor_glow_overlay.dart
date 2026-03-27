import 'package:flutter/material.dart';
import 'package:personal_website/theme/app_theme.dart';

class CursorGlowOverlay extends StatelessWidget {
  final Offset position;
  final bool visible;
  final double pulse;

  const CursorGlowOverlay({
    super.key,
    required this.position,
    required this.visible,
    required this.pulse,
  });

  @override
  Widget build(BuildContext context) {
    final baseSize = 220.0;
    final glowSize = baseSize + (pulse * 120.0);
    final glowOpacity = (0.25 + (pulse * 0.25)).clamp(0.0, 0.6);
    final trailSize = glowSize * 1.35;

    return IgnorePointer(
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 200),
        opacity: visible ? 1.0 : 0.0,
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 260),
              curve: Curves.easeOutCubic,
              left: position.dx - trailSize / 2,
              top: position.dy - trailSize / 2,
              child: Container(
                width: trailSize,
                height: trailSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      AppTheme.accentColor
                          .withValues(alpha: glowOpacity * 0.25),
                      Colors.transparent,
                    ],
                    stops: const [0.0, 1.0],
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 140),
              curve: Curves.easeOutCubic,
              left: position.dx - glowSize / 2,
              top: position.dy - glowSize / 2,
              child: Container(
                width: glowSize,
                height: glowSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      AppTheme.accentColor.withValues(alpha: glowOpacity),
                      AppTheme.accentColor.withValues(alpha: glowOpacity * 0.3),
                      Colors.transparent,
                    ],
                    stops: const [0.0, 0.4, 1.0],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
