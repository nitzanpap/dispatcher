import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/strings.dart';
import '../constants/routes.dart';

import '../widgets/minimal_app_bar.dart';
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
    Future.delayed(const Duration(milliseconds: 500)).then((value) =>
        Navigator.pushReplacementNamed(context, ValidRoutes.onboardingScreen));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deepDarkBlue,
      appBar: const MinimalAppBar(),
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
