import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lung_ai/presentation/auth/login.dart';
import 'package:lung_ai/providers/auth.dart';
import 'package:lung_ai/shared/field_decoration_properties.dart';
import 'package:lung_ai/shared/theme_colors.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  const Register({super.key});
  static const String route = '/register';

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _registerFormKey = GlobalKey<FormState>();

  Map<String, String> registerationInfo = {
    'name': '',
    'email': '',
    'password': '',
    'confirmPassword': ''
  };

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

  // Password Validator
  String? validatePassword(String? password) {
    final RegExp passRegEx = RegExp(
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');

    final isValidPass = passRegEx.hasMatch(password ?? "");
    if (!isValidPass || password == null) {
      return "Requires 8 Characters, Uppercase, Lowercase, Digit, and Special Character";
    }
    return null;
  }

  // Confirm Password Validator
  String? validateConfirmPassword(String? confirmPassword) {
    if (registerationInfo['password'] != confirmPassword ||
        confirmPassword == null) {
      return "Password Not Match!";
    }
    return null;
  }

  // Phone No validator
  String? validatePhoneNo(String? phoneNo) {
    final RegExp phoneRegEx = RegExp(r'^923\d{9}$');

    final isValid = phoneRegEx.hasMatch(phoneNo ?? '');
    if (phoneNo == null || !isValid) {
      return "Invalid Phone No. e.g. 923012345678";
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
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //SVG Logo
              Container(
                margin: EdgeInsets.only(top: height * 0.04),
                child: SvgPicture.asset(
                  'assets/images/logo_black.svg',
                  height: 32,
                ),
              ),

              // Create Account text
              Container(
                margin: EdgeInsets.only(top: height * 0.025),
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
                        'Create Account',
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
                      'Enter your account details, and start organizing your inventory',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      maxFontSize: 22,
                    ), //End Tagline
                  ],
                ),
              ), //End Create Account Text

              // Registration Form
              Container(
                margin: EdgeInsets.only(top: height * 0.035),
                child: Form(
                  key: _registerFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // Full Name Field
                      Padding(
                        padding: const EdgeInsets.only(bottom: 9),
                        child: TextFormField(
                          autofocus: false,
                          keyboardType: TextInputType.name,
                          autovalidateMode: AutovalidateMode.onUserInteraction,

                          //  Text Style
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: black,
                          ),

                          // Input Decoration
                          decoration: InputDecoration(
                            hintText: 'Full Name',
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: height * 0.027),

                            // Borders
                            border: border,
                            enabledBorder: enabledBorder,
                            focusedBorder: focousedBorder,
                          ),
                        ),
                      ), // End Full Name Field

                      // Emaill Field
                      Padding(
                        padding: const EdgeInsets.only(bottom: 9.0),
                        child: TextFormField(
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
                            border: border,
                            enabledBorder: enabledBorder,
                            focusedBorder: focousedBorder,
                          ),
                        ),
                      ), // End Email Field

                      // Phone No Field
                      Padding(
                        padding: const EdgeInsets.only(bottom: 9.0),
                        child: TextFormField(
                          autofocus: false,
                          keyboardType: TextInputType.phone,
                          validator: validatePhoneNo,
                          autovalidateMode: AutovalidateMode.onUserInteraction,

                          //  Text Style
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: black,
                          ),

                          // Input Decoration
                          decoration: InputDecoration(
                            hintText: 'Phone No',
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: height * 0.027),

                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: IconButton(
                                onPressed: null,
                                icon: SvgPicture.asset(
                                  'assets/icons/pak_flag.svg',
                                  height: 22,
                                ),
                              ),
                            ),

                            // Borders
                            border: border,
                            enabledBorder: enabledBorder,
                            focusedBorder: focousedBorder,
                          ),
                        ),
                      ), // End Phone No Field

                      // Password Field
                      Padding(
                        padding: const EdgeInsets.only(bottom: 9.0),
                        child: Consumer<Auth>(
                          builder: (context, passwordProvider, child) {
                            return TextFormField(
                              autofocus: false,
                              validator: validatePassword,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,

                              onChanged: (value) =>
                                  registerationInfo['password'] = value,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: black,
                              ),

                              // password Visibility
                              obscureText:
                                  passwordProvider.isRegisterPassHidden,
                              decoration: InputDecoration(
                                // Password Field Eye Icon
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: IconButton(
                                    onPressed: () {
                                      passwordProvider
                                          .toggleRegisterPasswordVisibility();
                                    },
                                    icon: passwordProvider.isRegisterPassHidden
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

                                // Borders
                                border: border,
                                enabledBorder: enabledBorder,
                                focusedBorder: focousedBorder,
                              ),
                            );
                          },
                        ),
                      ), // Password Field End

                      // Confirm Password Field
                      Consumer<Auth>(
                        builder: (context, passwordProvider, child) {
                          return TextFormField(
                            autofocus: false,
                            validator: validateConfirmPassword,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: black,
                            ),

                            // password Visibility
                            obscureText: passwordProvider.isRegisterPassHidden,
                            decoration: InputDecoration(
                              hintText: 'Confirm Password',
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: height * 0.027),

                              // Borders
                              border: border,
                              enabledBorder: enabledBorder,
                              focusedBorder: focousedBorder,
                            ),
                          );
                        },
                      ), // Confirm Password Field End
                    ],
                  ),
                ),
              ), //End Registeration Form

              //Register Button
              Padding(
                padding: EdgeInsets.symmetric(vertical: height * 0.02),
                child: GestureDetector(
                  onTap: null,
                  child: Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: whiteBG,
                      border: Border.all(
                        color: primaryColor,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0, 0),
                          blurRadius: 25,
                        )
                      ],
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/arrow-auth_btn.svg',
                      height: 30,
                    ),
                  ),
                ),
              ), //End Register Button

              //
              const AutoSizeText(
                'or continue with social account',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black45,
                  fontWeight: FontWeight.w600,
                ),
              ),

              // Register with Social Accounts
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Continue with Apple btn
                    GestureDetector(
                      onTap: null,
                      child: Container(
                        height: height * 0.08,
                        width: width * 0.435,
                        decoration: BoxDecoration(
                          color: whiteBG,
                          border: Border.all(color: fieldsBorder, width: 1.5),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/apple_icon.svg',
                              height: 18,
                            ),
                            const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5)),
                            const AutoSizeText(
                              'Login with Apple',
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                    ), // End Continue with Apple btn

                    const Padding(padding: EdgeInsets.symmetric(horizontal: 5)),

                    // Continue with Google btn
                    GestureDetector(
                      onTap: null,
                      child: Container(
                        height: height * 0.08,
                        width: width * 0.435,
                        decoration: BoxDecoration(
                          color: whiteBG,
                          border: Border.all(color: fieldsBorder, width: 1.5),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/google_icon.svg',
                              height: 18,
                            ),
                            const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5)),
                            const AutoSizeText(
                              'Login with Google',
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                    ), //End Coninue with Google btn
                  ],
                ),
              ),

              // Login Redirect
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const AutoSizeText(
                      'Have an account? ',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacementNamed(Login.route);
                      },
                      child: const AutoSizeText(
                        'Login',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: secondaryColor),
                      ),
                    )
                  ],
                ),
              ) // End Login Redirect
            ],
          ),
        ),
      )),
    );
  }
}
