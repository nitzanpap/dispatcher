import 'package:flutter/material.dart';

class OnboardingStepProvider with ChangeNotifier {
  int _onboardingStep = 0;

  final List<String> _descriptions = [
    'Welcome to Dispatcher, the right way to read your news. Just open the app.',
    'Search your fields of interest and the best part..',
    'Save all your articles for later, filter, learn and explore the latest news.',
  ];

  int get stepNumber => _onboardingStep;

  List<String> get descriptions => _descriptions;

  void incrementOnboardingStep() {
    _onboardingStep++;
    notifyListeners();
  }
}
