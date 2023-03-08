import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import './constants/strings.dart';
import './constants/routes.dart';
import './providers/onboarding_step_provider.dart';

import './screens/splash_screen.dart';
import './screens/onboarding_screen.dart';
import './screens/signup_login_screen.dart';

Future<void> main() async {
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
        ValidRoutes.onboardingScreen: (context) => ChangeNotifierProvider(
              create: (context) => OnboardingStepProvider(),
              child: const OnboardingScreen(),
            ),
        ValidRoutes.signupLoginScreen: (context) => const SignupLoginScreen(),
      },
    );
  }
}
