import 'package:dispatcher/providers/bottom_navigation_provider.dart';
import 'package:dispatcher/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import './constants/strings.dart';
import './constants/routes.dart';
import './providers/onboarding_step_provider.dart';

import './screens/splash_screen.dart';
import './screens/onboarding_screen.dart';
import './screens/signup_login_screen.dart';
import 'screens/primary_screen.dart';

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
// GoRouter configuration

  @override
  Widget build(BuildContext context) {
    final _router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: const String.fromEnvironment('currentEnv') == 'prod'
              // production splash screen
              ? (context, state) => const SplashScreen()
              // development main screen
              : (context, state) => MultiProvider(
                    providers: [
                      ChangeNotifierProvider(
                          create: (context) => BottomNavigationProvider())
                    ],
                    child: const PrimaryScreen(),
                  ),
        ),
        GoRoute(
          path: ValidRoutes.splashScreen,
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: ValidRoutes.onboardingScreen,
          builder: (context, state) => ChangeNotifierProvider(
            create: (context) => OnboardingStepProvider(),
            child: const OnboardingScreen(),
          ),
        ),
        GoRoute(
          path: ValidRoutes.signupLoginScreen,
          builder: (context, state) => const SignupLoginScreen(),
        ),
        GoRoute(
          path: ValidRoutes.mainScreen,
          builder: (context, state) => MultiProvider(
            providers: [
              ChangeNotifierProvider(
                  create: (context) => BottomNavigationProvider())
            ],
            child: const PrimaryScreen(),
          ),
        ),
        GoRoute(
          path: ValidRoutes.homeScreen,
          builder: (context, state) => const HomeScreen(),
        ),
      ],
    );
    return MaterialApp.router(
      title: appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        badgeTheme: const BadgeThemeData(
          alignment: AlignmentDirectional.topEnd,
        ),
      ),
      routerConfig: _router,

      // home: const String.fromEnvironment('currentEnv') == 'prod'
      //     ? const SplashScreen()
      //     : MultiProvider(
      //         providers: [
      //           ChangeNotifierProvider(
      //               create: (context) => BottomNavigationProvider())
      //         ],
      //         child: const MainScreen(),
      //       ),
      // routes: {
      //   ValidRoutes.onboardingScreen: (context) => ChangeNotifierProvider(
      //         create: (context) => OnboardingStepProvider(),
      //         child: const OnboardingScreen(),
      //       ),
      //   ValidRoutes.signupLoginScreen: (context) => const SignupLoginScreen(),
      //   ValidRoutes.mainScreen: (context) => MultiProvider(
      //         providers: [
      //           ChangeNotifierProvider(
      //               create: (context) => BottomNavigationProvider())
      //         ],
      //         child: const MainScreen(),
      //       ),
      // },
    );
  }
}
