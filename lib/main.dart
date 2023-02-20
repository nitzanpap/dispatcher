import 'package:dispatcher/providers/onboarding_step_provider.dart';
import 'package:flutter/material.dart';
import 'package:dispatcher/screens/onboarding_screen.dart';
import 'package:dispatcher/screens/splash_screen.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import './global_constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
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
        '/onboarding_screen': (context) => ChangeNotifierProvider(
              create: (context) => OnboardingStepProvider(),
              child: const OnboardingScreen(),
            )
      },
    );
  }
}
