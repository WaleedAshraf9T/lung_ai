import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lung_ai/providers/bottom_app_bar_provider.dart';
import 'package:lung_ai/shared/theme_colors.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    // Access the provider
    BottomBarProvider bottomBarProvider =
        Provider.of<BottomBarProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        width: width,
        height: height * 0.085, // A typical height for a bottom app bar
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(width),
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Home tab
            GestureDetector(
              onTap: () => bottomBarProvider.updateAnimation(0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 22,
                    width: 22,
                    child: bottomBarProvider.artboards.isNotEmpty
                        ? Rive(
                            artboard: bottomBarProvider
                                .artboards[0], // Display Home animation
                            fit: BoxFit.contain,
                          )
                        : Container(),
                  ),
                  const Text(
                    'Home',
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 8,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            // Doctors tab
            GestureDetector(
              onTap: () => bottomBarProvider.updateAnimation(1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 22,
                    width: 22,
                    child: bottomBarProvider.artboards.isNotEmpty
                        ? Rive(
                            artboard: bottomBarProvider.artboards[1],
                            fit: BoxFit.contain,
                          )
                        : Container(),
                  ),
                  const Text(
                    'Doctors',
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 8,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            // Chats tab
            GestureDetector(
              onTap: () => bottomBarProvider.updateAnimation(2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 22,
                    width: 22,
                    child: bottomBarProvider.artboards.isNotEmpty
                        ? Rive(
                            artboard: bottomBarProvider.artboards[2],
                            fit: BoxFit.contain,
                          )
                        : Container(),
                  ),
                  const Text(
                    'Chats',
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 8,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            // Profile tab (No Rive animation)
            GestureDetector(
              onTap: () => bottomBarProvider.updateAnimation(4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 22,
                    width: 22,
                    child: SvgPicture.asset(
                      "assets/icons/profile.svg",
                      fit: BoxFit.contain,
                    ), // Use icon or SVG for profile
                  ),
                  const Text(
                    'Profile',
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 8,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
