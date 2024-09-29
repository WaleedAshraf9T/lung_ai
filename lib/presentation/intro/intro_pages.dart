import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lung_ai/presentation/auth/login.dart';
import 'package:lung_ai/presentation/auth/register.dart';
import 'package:lung_ai/presentation/widgets/fade_transition.dart';
import 'package:lung_ai/presentation/widgets/expanding_circle.dart';
import 'package:lung_ai/shared/theme_colors.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:lung_ai/shared/intro_pages_data.dart';
import 'package:lung_ai/presentation/intro/animated_button.dart';
import 'package:lung_ai/presentation/intro/get_intro_text.dart';
import 'package:rive/rive.dart' as rive;

class IntroPages extends StatefulWidget {
  const IntroPages({super.key});
  static const String route = '/intro';

  @override
  State<IntroPages> createState() => _IntroPagesState();
}

class _IntroPagesState extends State<IntroPages> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).devicePixelRatio;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFF180C21),
      body: SafeArea(
        child: GestureDetector(
          onHorizontalDragEnd: (details) {
            if ((details.primaryVelocity ?? 0) > 0) {
              _pageController.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.bounceInOut);
            } else if ((details.primaryVelocity ?? 0) < 0) {
              _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.bounceInOut);
            }
          },
          child: Stack(
            children: [
              //BG
              Positioned(
                left: 25,
                top: -100,
                child: Opacity(
                  opacity: 0.15,
                  child: Container(
                    height: height * 0.4,
                    width: height * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(height * 0.3),
                      gradient: RadialGradient(
                        colors: [
                          accentColor.withOpacity(0),
                          secondaryColor.withOpacity(0.5),
                          accentPink
                        ],
                        center: const Alignment(-1, -0.8),
                        stops: const [0, 0.5, 1.0],
                        transform: const GradientRotation(50),
                      ),
                    ),
                  ),
                ),
              ),

              // Blur Effect
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
                  child: const SizedBox(),
                ),
              ), //Blur Effect End

              // Skip Button Start
              _currentIndex != introPagesText.length - 1
                  ? Positioned(
                      top: 20,
                      right: 20,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _pageController
                                .jumpToPage(introPagesText.length - 1);
                          });
                        },
                        child: AnimatedButton(
                          customHeight: height * 0.04,
                          customWidth: width * 0.2,
                          buttonWidget: const AutoSizeText(
                            "Skip",
                            style: TextStyle(
                              color: whiteBG,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(), // Skip Button End

              SizedBox(
                height: height,
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Middle Image
                    Container(
                      height: height * 0.4,
                      margin: EdgeInsets.only(top: height * 0.12),
                      child: PageView.builder(
                        controller: _pageController,
                        onPageChanged: _onPageChanged,
                        itemCount: introPagesText.length,
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              introPagesText[_currentIndex]?['imageUrl'] != null
                                  ? Positioned(
                                      right: _currentIndex == 0 ? 0 : null,
                                      left: _currentIndex == 1 ? 0 : null,
                                      child: SvgPicture.asset(
                                        introPagesText[_currentIndex]
                                                ?['imageUrl'] ??
                                            "",
                                        fit: BoxFit.contain,
                                      ),
                                    )
                                  : rive.RiveAnimation.asset(
                                      introPagesText[_currentIndex]
                                              ?['riveAnimation'] ??
                                          "assets/animations/splash_screen.riv",
                                      fit: BoxFit.contain,
                                    ),
                            ],
                          );
                        },
                      ),
                    ), // Middle Image End

                    // Text, Slider Indicator and Buttons
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          width * 0.05, 0, width * 0.05, height * 0.07),
                      child: Column(
                        children: [
                          // Title and Description
                          GetIntroText(index: _currentIndex),

                          // Slider Indicator
                          Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: height * 0.04),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                introPagesText.length,
                                (index) => TweenAnimationBuilder<double>(
                                  tween: Tween<double>(
                                    begin: _currentIndex == index ? 9 : 24,
                                    end: _currentIndex == index ? 24 : 9,
                                  ),
                                  duration: const Duration(milliseconds: 300),
                                  builder: (context, size, child) {
                                    return Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      width: size,
                                      height: 9,
                                      decoration: BoxDecoration(
                                        gradient: _currentIndex == index
                                            ? const LinearGradient(
                                                colors: [
                                                  secondaryColor,
                                                  accentColor,
                                                ],
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                              )
                                            : null, // No gradient for inactive dot
                                        color: _currentIndex != index
                                            ? whiteBG.withOpacity(0.25)
                                            : null, // Inactive dot color
                                        borderRadius: BorderRadius.circular(
                                            20), // Full rounded corners
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),

                          // Buttons with AnimatedSwitcher
                          (_currentIndex == introPagesText.length - 1)
                              ? Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    //Register Button
                                    GestureDetector(
                                      onTapDown: (details) => {
                                        Navigator.of(context).pushReplacement(
                                          FadeRoute(
                                            page: ExpandingCircle(
                                              startPosition:
                                                  details.globalPosition,
                                              duration: const Duration(
                                                milliseconds: 1000,
                                              ),
                                              nextPage: const Register(),
                                            ),
                                          ),
                                        ),
                                      },
                                      child: AnimatedButton(
                                        customHeight: 60,
                                        customWidth: width * 0.45,
                                        buttonWidget: const AutoSizeText(
                                          "Register an Account",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: whiteBG,
                                            fontSize: 11,
                                            fontWeight: FontWeight.w600,
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                      ),
                                    ),

                                    //Login Button
                                    GestureDetector(
                                      onTapDown: (details) => {
                                        Navigator.of(context).pushReplacement(
                                          FadeRoute(
                                            page: ExpandingCircle(
                                              startPosition:
                                                  details.globalPosition,
                                              duration: const Duration(
                                                milliseconds: 1000,
                                              ),
                                              nextPage: const Login(),
                                            ),
                                          ),
                                        ),
                                      },
                                      child: const AutoSizeText(
                                        "Login Your Account",
                                        style: TextStyle(
                                          color: whiteBG,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              : GestureDetector(
                                  onTap: () {
                                    _pageController.nextPage(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                    );
                                  },
                                  child: AnimatedButton(
                                    customHeight: 60,
                                    customWidth: width * 0.4,
                                    buttonWidget: SvgPicture.asset(
                                        "assets/icons/arrow-right.svg"),
                                  ),
                                ),
                        ],
                      ),
                    ), // Text, Slider Indicator and Buttons End
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
