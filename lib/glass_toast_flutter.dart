library glass_toast_flutter;

import 'dart:ui';
import 'package:flutter/material.dart';

/// The position where the toast should appear on the screen.
enum GlassToastPosition {
  /// Shows the toast at the top of the screen
  top,

  /// Shows the toast in the center of the screen
  center,

  /// Shows the toast at the bottom of the screen
  bottom,
}

/// A class that provides methods to show glass-morphism toast notifications.
class GlassToast {
  static OverlayEntry? _overlayEntry;
  static bool _isVisible = false;

  /// Shows a glass-morphism toast notification.
  ///
  /// [context] is the BuildContext of the current widget.
  /// [message] is the text to display in the toast.
  /// [duration] is how long the toast should be visible (default: 2 seconds).
  /// [position] is where the toast should appear (default: bottom).
  /// [backgroundColor] is the color of the toast background (default: black).
  /// [backgroundOpacity] is the opacity of the background (default: 0.5).
  static void show(
    BuildContext context,
    String message, {
    Duration duration = const Duration(seconds: 2),
    GlassToastPosition position = GlassToastPosition.bottom,
    Color backgroundColor = Colors.black,
    double backgroundOpacity = 0.5,
  }) {
    if (_isVisible) return;

    _isVisible = true;
    final overlay = Overlay.of(context);
    _overlayEntry = OverlayEntry(
      builder: (context) => _GlassToastWidget(
        message: message,
        position: position,
        backgroundColor: backgroundColor,
        backgroundOpacity: backgroundOpacity,
        onDismiss: () {
          _overlayEntry?.remove();
          _overlayEntry = null;
          _isVisible = false;
        },
      ),
    );

    overlay.insert(_overlayEntry!);
    Future.delayed(duration, () {
      _overlayEntry?.remove();
      _overlayEntry = null;
      _isVisible = false;
    });
  }
}

class _GlassToastWidget extends StatefulWidget {
  final String message;
  final GlassToastPosition position;
  final Color backgroundColor;
  final double backgroundOpacity;
  final VoidCallback onDismiss;

  const _GlassToastWidget({
    required this.message,
    required this.position,
    required this.backgroundColor,
    required this.backgroundOpacity,
    required this.onDismiss,
  });

  @override
  State<_GlassToastWidget> createState() => _GlassToastWidgetState();
}

class _GlassToastWidgetState extends State<_GlassToastWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: _getTopPosition(),
      left: 0,
      right: 0,
      child: FadeTransition(
        opacity: _animation,
        child: Material(
          color: Colors.transparent,
          child: Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                color: widget.backgroundColor
                    .withOpacity(widget.backgroundOpacity),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Text(
                    widget.message,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  double _getTopPosition() {
    final size = MediaQuery.of(context).size;
    switch (widget.position) {
      case GlassToastPosition.top:
        return size.height * 0.1;
      case GlassToastPosition.center:
        return size.height * 0.4;
      case GlassToastPosition.bottom:
        return size.height * 0.8;
    }
  }
}
