import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lung_ai/shared/theme_colors.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  static const String route = '/home';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).devicePixelRatio;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: primaryColor,
      body: Container(),
    );
  }
}
