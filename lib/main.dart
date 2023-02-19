import 'package:dispatcher/providers/onboarding_step_provider.dart';
import 'package:flutter/material.dart';
import 'package:dispatcher/screens/onboarding_screen.dart';
import 'package:dispatcher/screens/splash_screen.dart';
import 'package:provider/provider.dart';

import './global_constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => OnboardingStepProvider(),
        ),
      ],
      child: MaterialApp(
        title: appTitle,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Roboto',
          colorScheme: myColorScheme,
          badgeTheme: const BadgeThemeData(
            alignment: AlignmentDirectional.topEnd,
            backgroundColor: Color.fromRGBO(253, 89, 89, 1),
          ),
          scaffoldBackgroundColor: const Color.fromRGBO(229, 229, 229, 1),
        ),
        home: const SplashScreen(),
        routes: {
          '/onboarding_screen': (context) => const OnboardingScreen(),
        },
      ),
    );
  }
}
