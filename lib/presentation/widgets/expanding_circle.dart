import 'package:flutter/material.dart';
import 'package:lung_ai/shared/custom_route_transistions.dart';
import 'package:lung_ai/shared/theme_colors.dart';

class ExpandingCircle extends StatefulWidget {
  final Color color;
  final Offset? startPosition;
  final Duration duration;
  final Widget nextPage;
  static const String route = 'expanding-circle';

  const ExpandingCircle({
    super.key,
    this.color = whiteBG,
    this.startPosition = const Offset(0, 0),
    this.duration = const Duration(seconds: 3),
    this.nextPage = const Scaffold(),
  });

  @override
  ExpandingCircleState createState() => ExpandingCircleState();
}

class ExpandingCircleState extends State<ExpandingCircle>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    )..addListener(() {
        if (_animation.isCompleted) {
          // Ensure widget is removed from the tree when animation completes
          Future.delayed(Duration.zero, () {
            if (mounted) {
              setState(() {
                // Remove the circle after the animation completes
              });
            }
          });
        }
      });

    _controller.forward(); // Start animation

    Future.delayed(Duration(milliseconds: widget.duration.inMilliseconds + 300),
        () {
      Navigator.of(context).pushReplacement(FadeRoute(page: widget.nextPage));
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return CustomPaint(
          painter: CirclePainter(
            color: widget.color,
            progress: _animation.value,
            startPosition: widget.startPosition ?? const Offset(0, 0),
          ),
          child: const SizedBox
              .expand(), // Ensures the CustomPaint covers the entire screen
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class CirclePainter extends CustomPainter {
  final Color color;
  final double progress;
  final Offset startPosition;

  CirclePainter({
    required this.color,
    required this.progress,
    required this.startPosition,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final double radius =
        (size.width > size.height ? size.width : size.height) * progress;
    final Offset center = startPosition;

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
