import 'package:flutter/material.dart';

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
