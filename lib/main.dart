import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lung_ai/presentation/auth/forgot_password.dart';
import 'package:lung_ai/presentation/auth/login.dart';
import 'package:lung_ai/presentation/auth/register.dart';
import 'package:lung_ai/presentation/home/home.dart';
import 'package:lung_ai/presentation/intro/intro_pages.dart';
import 'package:lung_ai/presentation/splash_screen/splash_screen.dart';
import 'package:lung_ai/providers/auth.dart';
import 'package:lung_ai/shared/expanding_circle.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
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
          '/': (ctx) => const SplashScreen(),
          Home.route: (ctx) => const Home(),
          IntroPages.route: (ctx) => const IntroPages(),
          Login.route: (ctx) => const Login(),
          Register.route: (ctx) => const Register(),
          ForgotPassword.route: (ctx) => const ForgotPassword(),
          ExpandingCircle.route: (ctx) => const ExpandingCircle()
        },
      ),
    );
  }
}
