import 'package:flutter/material.dart';
import 'package:lung_ai/presentation/intro/intro_pages.dart';
import 'package:lung_ai/shared/theme_colors.dart';
import 'package:rive/rive.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, IntroPages.route);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: primaryColor,
      body: Center(
        child: AspectRatio(
          aspectRatio: 1 / 1,
          child: RiveAnimation.asset(
            'assets/animations/splash_screen.riv',
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
