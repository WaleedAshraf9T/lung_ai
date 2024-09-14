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
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox.expand(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //SVG Logo
                Container(
                  margin: EdgeInsets.only(top: height * 0.05),
                  child: SvgPicture.asset(
                    'assets/images/logo_white.svg',
                    height: 32,
                  ),
                ),

                Container(
                  height: height,
                  width: width,
                  color: secondaryColor,
                ),
                Stack(
                  children: [Container()],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
