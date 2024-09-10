import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lung_ai/providers/auth.dart';
import 'package:lung_ai/shared/theme_colors.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  static const String route = '/login';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  bool isPassHidden = true;
  Map<String, String> signinInfo = {'email': '', 'password': ''};

  // To validate email field
  String? validateEmail(String? email) {
    final RegExp emailRegEx = RegExp(
      r'^([a-zA-Z0-9._-]+)@([a-zA-Z0-9.-]+\.[a-zA-Z]{2,})$',
      caseSensitive: false,
    );

    final isValid = emailRegEx.hasMatch(email ?? '');
    if (!isValid) {
      return "Invalid Email Address!";
    }
    return null;
  }

  // For password validation
  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return "Enter Password!";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).devicePixelRatio;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: whiteBG,
      body: SafeArea(
        //Mian Container
        child: SingleChildScrollView(
          //Collumn To arrange whole screen elements
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //SVG Logo
                Container(
                  margin: EdgeInsets.only(top: height * 0.05),
                  child: SvgPicture.asset(
                    'assets/images/logo_black.svg',
                    height: 32,
                  ),
                ),

                // Welcome text
                Container(
                  margin: EdgeInsets.only(top: height * 0.04),
                  child: Column(
                    children: [
                      //Gradient Welcome Text
                      ShaderMask(
                        shaderCallback: (bounds) => const LinearGradient(
                            colors: [secondaryColor, accentColor],
                            tileMode: TileMode.mirror,
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: [0.3, 1.0]).createShader(bounds),
                        child: const AutoSizeText(
                          'Welcome Back',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 32,
                            color: whiteBG,
                          ),
                          maxLines: 2,
                          maxFontSize: 48,
                        ),
                      ), //End Gradient Welcome Text

                      // Tagline below heading
                      const AutoSizeText(
                        'Sign in to your account using an email or social networks',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        maxFontSize: 22,
                      ), //End Tagline
                    ],
                  ),
                ), //End Welcome Text

                // Email and Password Input Fields
                Container(
                  margin: EdgeInsets.only(top: height * 0.05),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // Emaill Field
                        TextFormField(
                          autofocus: false,
                          validator: validateEmail,
                          keyboardType: TextInputType.emailAddress,
                          autovalidateMode: AutovalidateMode.onUserInteraction,

                          //  Text Style
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: black,
                          ),

                          // Input Decoration
                          decoration: InputDecoration(
                            hintText: 'Email',
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: height * 0.027),
                            // Borders
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                color: fieldsBorder,
                                width: 1.7,
                                strokeAlign: BorderSide.strokeAlignInside,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: const BorderSide(
                                color: Colors.black38,
                                width: 1.7,
                                strokeAlign: BorderSide.strokeAlignInside,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: const BorderSide(
                                color: primaryColor,
                                width: 1.6,
                              ),
                            ),
                          ),
                        ),

                        // Spacing between fieds
                        Container(
                            margin: const EdgeInsets.symmetric(vertical: 7)),

                        // Password Field
                        Consumer<Auth>(
                          builder: (context, passwordProvider, child) {
                            return TextFormField(
                              autofocus: false,
                              validator: validatePassword,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: black,
                              ),

                              // password Visibility
                              obscureText: passwordProvider.isPassHidden,
                              decoration: InputDecoration(
                                // Password Field Eye Icon
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: IconButton(
                                    onPressed: () {
                                      passwordProvider
                                          .togglePasswordVisibility();
                                    },
                                    icon: passwordProvider.isPassHidden
                                        ? SvgPicture.asset(
                                            'assets/icons/unhide_pass_eye.svg',
                                            height: 18,
                                          )
                                        : SvgPicture.asset(
                                            'assets/icons/hide_pass_eye.svg',
                                          ),
                                  ),
                                ),
                                hintText: 'Password',
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: height * 0.027),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                    color: fieldsBorder,
                                    width: 1.7,
                                    strokeAlign: BorderSide.strokeAlignInside,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: const BorderSide(
                                    color: Colors.black38,
                                    width: 1.7,
                                    strokeAlign: BorderSide.strokeAlignInside,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: const BorderSide(
                                    color: primaryColor,
                                    width: 1.6,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),

                        //Forgot Password
                        GestureDetector(
                          onTap: null,
                          child: const Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: AutoSizeText(
                              'Forgot Password?',
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                  color: secondaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(vertical: height * 0.04),
                  child: const AutoSizeText(
                    'or continue with social account',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black45,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                //Continue with apple btn
                GestureDetector(
                  onTap: null,
                  child: Container(
                    height: height * 0.08,
                    width: width,
                    decoration: BoxDecoration(
                      color: whiteBG,
                      border: Border.all(color: fieldsBorder, width: 1.5),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/icons/apple_icon.svg'),
                        const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5)),
                        const AutoSizeText(
                          'Login with Apple',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 7)),

                //Continue with google btn
                GestureDetector(
                  onTap: null,
                  child: Container(
                    height: height * 0.08,
                    width: width,
                    decoration: BoxDecoration(
                      color: whiteBG,
                      border: Border.all(color: fieldsBorder, width: 1.5),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/icons/google_icon.svg'),
                        const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5)),
                        const AutoSizeText(
                          'Login with Google',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),

                //Sign in Button
                Padding(
                  padding: EdgeInsets.symmetric(vertical: height * 0.04),
                  child: GestureDetector(
                    onTap: null,
                    child: Container(
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                          color: secondaryColor,
                          border: Border.all(
                            color: primaryColor,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(50)),
                      child: SvgPicture.asset(
                        'assets/icons/arrow-auth_btn.svg',
                        height: 30,
                      ),
                    ),
                  ),
                ),

                // Registeration Redirect
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const AutoSizeText(
                        'Didn’t have and account? ',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      GestureDetector(
                        onTap: null,
                        child: const AutoSizeText(
                          'Register',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: secondaryColor),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
