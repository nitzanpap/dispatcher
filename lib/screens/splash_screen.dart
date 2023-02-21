import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/constant_vars.dart';
import '../constants/routes.dart';

import '../widgets/logo_widgets/logo_layered.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final logoLayered = const LogoLayered();
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1, milliseconds: 500)).then(
        (value) => Navigator.pushReplacementNamed(
            context, ValidRoutes.onboardingScreen));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deepDarkBlue,
      body: Center(
        child: FractionallySizedBox(
          heightFactor: 0.75,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              logoLayered,
              const Text(
                appTitle,
                style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
