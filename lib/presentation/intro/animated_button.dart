import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lung_ai/shared/theme_colors.dart';
import 'package:rive/rive.dart';

class AnimatedButton extends StatefulWidget {
  final double customWidth;
  final double customHeight;
  final Widget buttonWidget;
  final VoidCallback? buttonAction;

  const AnimatedButton({
    super.key,
    this.customWidth = 120,
    this.customHeight = 60,
    required this.buttonWidget,
    required this.buttonAction,
  });

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.buttonAction,
      child: Container(
        height: widget.customHeight,
        width: widget.customWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
              color: whiteBG.withOpacity(0.25),
              width: 1.5,
              strokeAlign: BorderSide.strokeAlignCenter),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: SizedBox(
                height: widget.customHeight,
                width: widget.customWidth,
                child: const RiveAnimation.asset(
                  'assets/animations/button_bg_animation.riv',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: SizedBox(
                height: widget.customHeight,
                width: widget.customWidth,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 15, sigmaY: 20),
                  child: const SizedBox(),
                ),
              ),
            ),
            widget.buttonWidget,
          ],
        ),
      ),
    );
  }
}
