import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import './constants/strings.dart';
import './enums/routes.dart';
import './providers/onboarding_step_provider.dart';
import './providers/bottom_navigation_provider.dart';
import '../providers/signup_login_provider.dart';

import './screens/splash_screen.dart';
import './screens/onboarding_screen.dart';
import './screens/signup_login_screen.dart';
import './screens/primary_screen.dart';

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
    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          redirect: (context, state) {
            final signupLoginProvider =
                Provider.of<SignupLoginProvider>(context);
            if (signupLoginProvider.isSignedIn) {
              return ValidRoutes.primaryScreen.route;
            }
            return ValidRoutes.splashScreen.route;
          },
        ),
        GoRoute(
          path: ValidRoutes.splashScreen.route,
          name: ValidRoutes.splashScreen.name,
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: ValidRoutes.onboardingScreen.route,
          name: ValidRoutes.onboardingScreen.name,
          builder: (context, state) => ChangeNotifierProvider(
            create: (context) => OnboardingStepProvider(),
            child: const OnboardingScreen(),
          ),
        ),
        GoRoute(
          path: ValidRoutes.signupLoginScreen.route,
          name: ValidRoutes.signupLoginScreen.name,
          builder: (context, state) => const SignupLoginScreen(),
        ),
        GoRoute(
          path: ValidRoutes.primaryScreen.route,
          name: ValidRoutes.primaryScreen.name,
          builder: (context, state) => MultiProvider(
            providers: [
              ChangeNotifierProvider(
                  create: (context) => BottomNavigationProvider()),
            ],
            child: const PrimaryScreen(),
          ),
        ),
      ],
    );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SignupLoginProvider(),
        ),
      ],
      child: MaterialApp.router(
        title: appTitle,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Roboto',
          badgeTheme: const BadgeThemeData(
            alignment: AlignmentDirectional.topEnd,
          ),
        ),
        routerConfig: router,
      ),
    );
  }
}
