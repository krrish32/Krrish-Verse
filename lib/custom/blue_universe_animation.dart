import 'dart:math';
import 'package:flutter/material.dart';
import 'package:portfolio_app/custom/blue_universe_painter.dart';

class BlueUniverseAnimation extends StatefulWidget {
  const BlueUniverseAnimation({super.key});

  @override
  BlueUniverseAnimationState createState() => BlueUniverseAnimationState();
}

class BlueUniverseAnimationState extends State<BlueUniverseAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Offset> _stars;
  late List<double> _starSizes;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();

    _stars = List.generate(100, (index) {
      final random = Random();
      return Offset(random.nextDouble() * 800, random.nextDouble() * 600);
    });

    _starSizes = List.generate(100, (index) => 1.0);

    _controller.addListener(() {
      setState(() {
        for (int i = 0; i < _stars.length; i++) {
          final dx = _stars[i].dx + (1 - 2 * Random().nextDouble());
          final dy = _stars[i].dy + (1 - 2 * Random().nextDouble());
          _stars[i] = Offset(dx % 800, dy % 600);

          _starSizes[i] += 0.05;
          if (_starSizes[i] > 4.0) {
            _starSizes[i] = 1.0;
            _stars[i] = Offset(Random().nextDouble() * 800, Random().nextDouble() * 600);
          }
        }
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: BlueUniversePainter(_stars, _starSizes),
      child: Container(),
    );
  }
}
