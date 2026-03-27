import 'package:flutter/material.dart';

class AppTheme {
  // Colors
  static const Color backgroundColor = Color(0xFF0a0a0a);
  static const Color surfaceColor = Color(0xFF111111);
  static const Color accentColor = Color(0xFF00ffff); // Electric cyan
  static const Color textPrimary = Color(0xFFf5f5f5); // Off-white
  static const Color textSecondary = Color(0xFF888888); // Muted gray
  static const Color cardColor = Color(0xFF151515);
  static const Color borderColor = Color(0xFF222222);

  // Typography
  static const String headingFont = 'Inter';
  static const String bodyFont = 'Inter';
  static const String monoFont = 'JetBrains Mono';

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: backgroundColor,
      colorScheme: const ColorScheme.dark(
        primary: accentColor,
        surface: surfaceColor,
        onSurface: textPrimary,
        onSurfaceVariant: textSecondary,
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontFamily: headingFont,
          fontSize: 64,
          fontWeight: FontWeight.bold,
          color: textPrimary,
          letterSpacing: -1.5,
        ),
        displayMedium: TextStyle(
          fontFamily: headingFont,
          fontSize: 48,
          fontWeight: FontWeight.bold,
          color: textPrimary,
          letterSpacing: -1.0,
        ),
        displaySmall: TextStyle(
          fontFamily: headingFont,
          fontSize: 36,
          fontWeight: FontWeight.bold,
          color: textPrimary,
          letterSpacing: -0.5,
        ),
        headlineMedium: TextStyle(
          fontFamily: headingFont,
          fontSize: 28,
          fontWeight: FontWeight.w600,
          color: textPrimary,
        ),
        titleLarge: TextStyle(
          fontFamily: headingFont,
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: textPrimary,
        ),
        titleMedium: TextStyle(
          fontFamily: headingFont,
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: textPrimary,
        ),
        bodyLarge: TextStyle(
          fontFamily: bodyFont,
          fontSize: 16,
          color: textPrimary,
          height: 1.6,
        ),
        bodyMedium: TextStyle(
          fontFamily: bodyFont,
          fontSize: 14,
          color: textSecondary,
          height: 1.5,
        ),
        bodySmall: TextStyle(
          fontFamily: monoFont,
          fontSize: 12,
          color: textSecondary,
        ),
      ),
    );
  }
}
