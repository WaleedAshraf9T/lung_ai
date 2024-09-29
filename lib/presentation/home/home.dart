import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lung_ai/presentation/home/mini_doctor_card.dart';
import 'package:lung_ai/presentation/widgets/custom_bottom_app_bar.dart';
import 'package:lung_ai/presentation/widgets/dashed_border_painter.dart';
import 'package:lung_ai/shared/doctors_dummy_data.dart';
import 'package:lung_ai/shared/theme_colors.dart';
import 'package:rive/rive.dart' as rive;

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
          child: Container(
            width: width,
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
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

                // CT Scan Image Add Box
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: height * 0.26,
                    width: width,
                    margin: const EdgeInsets.only(top: 20),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CustomPaint(
                          willChange: false,
                          painter: DashedBorderPainter(
                            color: whiteBG.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(25),
                            strokeWidth: 3,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: SizedBox(
                              height: height * 0.26,
                              width: width,
                              child: const rive.RiveAnimation.asset(
                                'assets/animations/home-add-image-bg-balls.riv',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: SizedBox(
                            height: height * 0.26,
                            width: width,
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
                              child: const SizedBox(),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/icons/add_icon.svg",
                              height: 32,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Text(
                                "Add CT Scanned Image",
                                style: TextStyle(
                                  color: whiteBG,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // Explore Specialist Title
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Explore Specialists",
                        style: TextStyle(
                          color: whiteBG,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            Text(
                              "View All",
                              style: TextStyle(
                                color: whiteBG.withOpacity(0.5),
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(width: 3),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 12,
                              color: whiteBG.withOpacity(0.5),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                // Doctors Lists
                SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 10),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(
                      doctorsData.length,
                      (index) => MiniDoctorCard(
                        doctor: doctorsData[index],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomAppBar(),
    );
  }
}
