import 'package:flutter/material.dart';

const appTitle = 'Dispatcher';

final myColorScheme = ColorScheme(
  primary: const Color.fromRGBO(38, 33, 70, 1.0),
  primaryContainer: const Color.fromRGBO(90, 90, 137, 1),
  secondary: const Color.fromRGBO(0, 88, 185, 1),
  secondaryContainer: Colors.green.shade700,
  surface: const Color.fromRGBO(248, 248, 255, 1),
  background: Colors.grey.shade200,
  error: const Color.fromRGBO(255, 107, 87, 1),
  onPrimary: Colors.white,
  onSecondary: Colors.white,
  onSurface: Colors.black,
  onBackground: Colors.black,
  onError: Colors.white,
  brightness: Brightness.light,
);

class FigmaColors {
  static const black = Colors.black;
  static const deepDarkBlue = Color.fromRGBO(38, 33, 70, 1.0);
  static const mediumBlue = Color.fromRGBO(90, 90, 137, 1);
  static const blue = Color.fromRGBO(90, 90, 137, 1);
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

enum IconDirection {
  start,
  end,
}
