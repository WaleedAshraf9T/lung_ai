import 'package:flutter/material.dart';
import 'package:lung_ai/presentation/auth/login.dart';
import 'package:lung_ai/shared/theme_colors.dart';
import 'package:rive/rive.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // You can add a delay to automatically transition to the next screen
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, Login.route);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
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
