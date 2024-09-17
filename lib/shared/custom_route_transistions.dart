import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lung_ai/shared/theme_colors.dart';

class CircularFadeRoute extends PageRouteBuilder {
  final Widget page;
  final Offset position;
  final Duration duration;
  final Color color;

  CircularFadeRoute({
    required this.page,
    required this.position,
    this.duration = const Duration(milliseconds: 700),
    this.color = primaryColor,
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionDuration: duration,
        );

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return Stack(
      children: [
        FadeTransition(
          opacity: animation,
          child: child, // Destination screen fades in
        ),
        Positioned.fill(
          child: AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              return ClipPath(
                clipper: CircularRevealClipper(
                  fraction: animation.value,
                  center: position,
                ),
                child: Container(
                  color: color, // Color of the growing circle
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class CircularRevealClipper extends CustomClipper<Path> {
  final double fraction;
  final Offset center;

  CircularRevealClipper({required this.fraction, required this.center});

  @override
  Path getClip(Size size) {
    final radius =
        fraction * sqrt(size.width * size.width + size.height * size.height);
    return Path()
      ..addOval(Rect.fromCircle(center: center, radius: radius))
      ..close();
  }

  @override
  bool shouldReclip(CircularRevealClipper oldClipper) {
    return fraction != oldClipper.fraction || center != oldClipper.center;
  }
}

// Custom Fade Transition Route with duration
class FadeRoute extends PageRouteBuilder {
  final Widget page;
  final Duration duration; // Add custom duration

  FadeRoute(
      {required this.page,
      this.duration = const Duration(
          milliseconds: 1000)}) // Default duration if not provided
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionDuration: duration, // Use the custom duration here
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation.drive(CurveTween(curve: Curves.easeIn)),
              child: child,
            );
          },
        );
}
