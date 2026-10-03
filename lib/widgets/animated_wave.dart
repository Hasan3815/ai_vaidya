import 'dart:math';
import 'package:flutter/material.dart';

class AnimatedWave extends StatefulWidget {
  final Color color;
  final double height;
  final double speed;
  final double waveHeight;

  const AnimatedWave({
    super.key,
    required this.color,
    this.height = 120,
    this.speed = 1,
    this.waveHeight = 18,
  });

  @override
  State<AnimatedWave> createState() => _AnimatedWaveState();
}

class _AnimatedWaveState extends State<AnimatedWave>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: (5000 / widget.speed).round()),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: double.infinity,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, __) {
          return CustomPaint(
            painter: WavePainter(
              progress: _controller.value,
              color: widget.color,
              waveHeight: widget.waveHeight,
            ),
          );
        },
      ),
    );
  }
}

class WavePainter extends CustomPainter {
  final double progress;
  final Color color;
  final double waveHeight;

  WavePainter({
    required this.progress,
    required this.color,
    required this.waveHeight,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final path = Path();

    path.moveTo(0, size.height);

    for (double x = 0; x <= size.width; x++) {
      final y = size.height -
          sin((x / size.width * 2 * pi) + progress * 2 * pi) *
              waveHeight -
          35;

      path.lineTo(x, y);
    }

    path.lineTo(size.width, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant WavePainter oldDelegate) => true;
}