import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lung_ai/presentation/auth/forgot_password.dart';
import 'package:lung_ai/presentation/auth/login.dart';
import 'package:lung_ai/presentation/auth/register.dart';
import 'package:lung_ai/presentation/home/home.dart';
import 'package:lung_ai/presentation/intro/intro_pages.dart';
import 'package:lung_ai/presentation/splash_screen/splash_screen.dart';
import 'package:lung_ai/providers/auth.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    // Move the setSystemUIOverlayStyle inside the callback to ensure it's set after orientation is locked
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor:
          Colors.transparent, // Navigation bar color set to transparent
      systemNavigationBarIconBrightness:
          Brightness.light, // Navigation bar icons set to light
    ));

    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (ctx) => Auth())],
      child: MaterialApp(
        theme: ThemeData(fontFamily: "Poppins"),
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashScreen(),
          Home.route: (context) => const Home(),
          IntroPages.route: (context) => const IntroPages(),
          Login.route: (context) => const Login(),
          Register.route: (context) => const Register(),
          ForgotPassword.route: (context) => const ForgotPassword(),
        },
      ),
    );
  }
}
