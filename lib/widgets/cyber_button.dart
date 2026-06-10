import 'package:flutter/material.dart';
import 'package:personal_website/theme/app_theme.dart';
import 'package:personal_website/widgets/magnetic_hover.dart';

class CyberButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isPrimary;
  final IconData? icon;

  const CyberButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isPrimary = true,
    this.icon,
  });

  @override
  State<CyberButton> createState() => _CyberButtonState();
}

class _CyberButtonState extends State<CyberButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MagneticHover(
      strength: 10,
      scale: 1.03,
      onEnter: () {
        setState(() => _isHovered = true);
        _controller.forward();
      },
      onExit: () {
        setState(() => _isHovered = false);
        _controller.reverse();
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: widget.isPrimary
                    ? AppTheme.accentColor
                    : AppTheme.borderColor,
                width: 1.5,
              ),
              boxShadow: _isHovered
                  ? [
                      BoxShadow(
                        color: widget.isPrimary
                            ? AppTheme.accentColor.withValues(alpha: 0.3)
                            : Colors.transparent,
                        blurRadius: 12,
                        spreadRadius: 2,
                      ),
                    ]
                  : null,
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: widget.onPressed,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (widget.icon != null) ...[
                        Icon(
                          widget.icon,
                          color: widget.isPrimary
                              ? AppTheme.accentColor
                              : AppTheme.textPrimary,
                          size: 20,
                        ),
                        const SizedBox(width: 12),
                      ],
                      Flexible(
                        child: Text(
                          widget.text,
                          style: TextStyle(
                            fontFamily: AppTheme.headingFont,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: widget.isPrimary
                                ? AppTheme.accentColor
                                : AppTheme.textPrimary,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
