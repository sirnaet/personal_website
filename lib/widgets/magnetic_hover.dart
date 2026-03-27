import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MagneticHover extends StatefulWidget {
  final Widget child;
  final double strength;
  final double scale;
  final Duration duration;
  final Curve curve;
  final bool enabled;
  final VoidCallback? onEnter;
  final VoidCallback? onExit;

  const MagneticHover({
    super.key,
    required this.child,
    this.strength = 14.0,
    this.scale = 1.02,
    this.duration = const Duration(milliseconds: 120),
    this.curve = Curves.easeOutCubic,
    this.enabled = true,
    this.onEnter,
    this.onExit,
  });

  @override
  State<MagneticHover> createState() => _MagneticHoverState();
}

class _MagneticHoverState extends State<MagneticHover> {
  Offset _offset = Offset.zero;
  bool _hovered = false;

  void _handleHover(PointerHoverEvent event) {
    if (!widget.enabled) {
      return;
    }

    final box = context.findRenderObject() as RenderBox?;
    if (box == null || !box.hasSize) {
      return;
    }

    final local = box.globalToLocal(event.position);
    final size = box.size;
    if (size.width == 0 || size.height == 0) {
      return;
    }

    final dx = (local.dx - size.width / 2) / (size.width / 2);
    final dy = (local.dy - size.height / 2) / (size.height / 2);
    final offset = Offset(dx * widget.strength, dy * widget.strength);

    if ((_offset - offset).distanceSquared < 0.01) {
      return;
    }

    setState(() => _offset = offset);
  }

  void _handleExit() {
    if (!_hovered && _offset == Offset.zero) {
      return;
    }

    setState(() {
      _hovered = false;
      _offset = Offset.zero;
    });
    widget.onExit?.call();
  }

  void _handleEnter() {
    if (_hovered) {
      return;
    }

    setState(() => _hovered = true);
    widget.onEnter?.call();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.enabled) {
      return widget.child;
    }

    return MouseRegion(
      onEnter: (_) => _handleEnter(),
      onExit: (_) => _handleExit(),
      onHover: _handleHover,
      child: AnimatedContainer(
        duration: widget.duration,
        curve: widget.curve,
        transformAlignment: Alignment.center,
        transform: Matrix4.identity()
          ..translate(_offset.dx, _offset.dy)
          ..scale(_hovered ? widget.scale : 1.0),
        child: widget.child,
      ),
    );
  }
}
