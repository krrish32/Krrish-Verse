import 'dart:math';
import 'package:flutter/material.dart';

class BlueUniversePainter extends CustomPainter {
  final List<Offset> stars;
  final List<double> starSizes;
  final Paint starPaint;

  BlueUniversePainter(this.stars, this.starSizes)
      : starPaint = Paint()
    ..color = Colors.white
    ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint backgroundPaint = Paint()
      ..shader = LinearGradient(
        colors: [Color(0xFF00246B), Color(0xFF3B5BA5)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), backgroundPaint);

    for (int i = 0; i < stars.length; i++) {
      canvas.drawCircle(stars[i], starSizes[i], starPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
