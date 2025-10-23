import 'package:flutter/material.dart';

/// A container widget that paints a dashed border around its child.
class DashedBorderContainer extends StatelessWidget {
  final Widget? child;
  final Color color;
  final double dashWidth;
  final double gap; // gap between dashes
  final double strokeWidth;
  final BorderRadius borderRadius;
  final EdgeInsets padding;
  final Color? background;

  const DashedBorderContainer({
    super.key,
    this.child,
    this.color = Colors.black,
    this.dashWidth = 5.0,
    this.gap = 5.0,
    this.strokeWidth = 1.0,
    this.borderRadius = BorderRadius.zero,
    this.padding = const EdgeInsets.all(2.0),
    this.background,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DashedBorderPainter(
        color: color,
        dashWidth: dashWidth,
        gap: gap,
        strokeWidth: strokeWidth,
        borderRadius: borderRadius,
        background: background,
      ),
      child:
      Padding(
        padding: EdgeInsets.all(strokeWidth),
        child: child,
      ),
    );
  }
}

class _DashedBorderPainter extends CustomPainter {
  final Color color;
  final double dashWidth;
  final double gap;
  final double strokeWidth;
  final BorderRadius borderRadius;
  final Color? background;

  _DashedBorderPainter({
    required this.color,
    required this.dashWidth,
    required this.gap,
    required this.strokeWidth,
    required this.borderRadius,
    this.background,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..color = background ?? Colors.transparent;

    // draw background if provided
    if (background != null) {
      final bgRRect = RRect.fromRectAndCorners(
        Offset.zero & size,
        topLeft: borderRadius.topLeft,
        topRight: borderRadius.topRight,
        bottomLeft: borderRadius.bottomLeft,
        bottomRight: borderRadius.bottomRight,
      );
      canvas.drawRRect(bgRRect, paint);
    }

    // Prepare path for the border (inside the canvas)
    final inset = strokeWidth / 2;
    final rect = Rect.fromLTWH(inset, inset, size.width - inset * 2, size.height - inset * 2);
    if (rect.width <= 0 || rect.height <= 0) return;

    final rrect = RRect.fromRectAndCorners(
      rect,
      topLeft: borderRadius.topLeft,
      topRight: borderRadius.topRight,
      bottomLeft: borderRadius.bottomLeft,
      bottomRight: borderRadius.bottomRight,
    );
    final path = Path()..addRRect(rrect);

    final dashPaint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final metrics = path.computeMetrics(forceClosed: true);

    for (final metric in metrics) {
      double distance = 0.0;
      while (distance < metric.length) {
        final dashPath = metric.extractPath(distance, distance + dashWidth);
        canvas.drawPath(dashPath, dashPaint);
        distance += dashWidth + gap;
      }
    }
  }

  @override
  bool shouldRepaint(covariant _DashedBorderPainter old) {
    return old.color != color ||
        old.dashWidth != dashWidth ||
        old.gap != gap ||
        old.strokeWidth != strokeWidth ||
        old.borderRadius != borderRadius ||
        old.background != background;
  }
}
