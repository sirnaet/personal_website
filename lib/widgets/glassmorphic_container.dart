import 'dart:ui';
import 'package:flutter/material.dart';

class GlassmorphicContainer extends StatelessWidget {
  final Widget child;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry? padding;
  final double blur;
  final Color backgroundColor;
  final BoxBorder? border;

  const GlassmorphicContainer({
    super.key,
    required this.child,
    this.borderRadius = const BorderRadius.all(Radius.circular(24)),
    this.padding,
    this.blur = 10.0,
    this.backgroundColor = const Color(0x0DFFFFFF), // bg-white/5
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: borderRadius,
            border: border ?? Border.all(
              color: const Color(0x1AFFFFFF), // border-white/10
              width: 1.0,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
