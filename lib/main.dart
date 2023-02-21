import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './global_constants.dart';

import './screens/sign_up_login_screen.dart';
import './screens/onboarding_screen.dart';
import './screens/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        badgeTheme: const BadgeThemeData(
          alignment: AlignmentDirectional.topEnd,
        ),
      ),
      home: const SplashScreen(),
      routes: {
        ValidRoutes.onboardingScreen: (context) => const OnboardingScreen(),
        ValidRoutes.signupLoginScreen: (context) => const SignUpLoginScreen(),
      },
    );
  }
}
