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
  static const BLACK = Colors.black;
  static const DEEP_DARK_BLUE = Color.fromRGBO(38, 33, 70, 1.0);
  static const MEDIUM_BLUE = Color.fromRGBO(90, 90, 137, 1);
  static const BLUE = Color.fromRGBO(90, 90, 137, 1);
  static const WHITE = Color.fromRGBO(248, 248, 255, 1);
  static const LIGHT_GREY = Color.fromRGBO(243, 243, 255, 1);
  static const GREY = Color.fromRGBO(217, 219, 233, 1);
}
