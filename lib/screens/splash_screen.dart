import 'package:dispatcher/global_constants.dart';
import 'package:flutter/material.dart';

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
        (value) =>
            Navigator.pushReplacementNamed(context, '/onboarding_screen'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: FractionallySizedBox(
          heightFactor: 0.75,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              logoLayered,
              Text(
                appTitle,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
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
