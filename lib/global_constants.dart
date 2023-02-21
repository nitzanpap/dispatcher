import 'package:flutter/material.dart';

const appTitle = 'Dispatcher';

class FigmaColors {
  static const black = Colors.black;
  static const deepDarkBlue = Color.fromRGBO(38, 33, 70, 1.0);
  static const mediumBlue = Color.fromRGBO(90, 90, 137, 1);
  static const blue = Color.fromRGBO(0, 88, 185, 1);
  static const white = Color.fromRGBO(248, 248, 255, 1);
  static const lightGrey = Color.fromRGBO(243, 243, 255, 1);
  static const grey = Color.fromRGBO(217, 219, 233, 1);
  static const error = Color.fromRGBO(255, 107, 87, 1);
  static const badgeColor = Color.fromRGBO(217, 219, 233, 1);
}

class ValidRoutes {
  static const onboardingScreen = '/onboarding_screen';
  static const signupLoginScreen = '/sign_up_login_screen';
}

enum ThemeColor {
  light,
  dark,
}
