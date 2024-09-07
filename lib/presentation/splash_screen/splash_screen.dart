import 'package:flutter/material.dart';
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
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: const Color(0xFF180C21),
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
