import 'package:flutter/material.dart';

class CustomAnimatedBubble extends StatefulWidget {
  final double size;
  final double left;
  final double top;
  final Color color;
  final Duration duration;

  const CustomAnimatedBubble({
    super.key,
    required this.size,
    required this.left,
    required this.top,
    required this.color,
    required this.duration,
  });

  @override
  State<CustomAnimatedBubble> createState() => _CustomAnimatedBubbleState();
}

class _CustomAnimatedBubbleState extends State<CustomAnimatedBubble>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: -12, end: 12).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: widget.left,
      top: widget.top,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (_, child) {
          return Transform.translate(
            offset: Offset(0, _animation.value),
            child: child,
          );
        },
        child: Container(
          height: widget.size,
          width: widget.size,
          decoration: BoxDecoration(
            color: widget.color,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}