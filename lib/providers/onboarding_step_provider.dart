import 'package:dispatcher/models/onboarding_step_model.dart';
import 'package:flutter/material.dart';

class OnboardingStepProvider with ChangeNotifier {
  final OnboardingStepModel _onboardingStep = OnboardingStepModel();

  int get stepNumber => _onboardingStep.stepNumber;
  List<String> get descriptions => _onboardingStep.descriptions;

  void moveoToNextStep() {
    _onboardingStep.moveoToNextStep();
    notifyListeners();
  }

  void skipToEndOfOnboarding() {
    _onboardingStep.skipToEndOfOnboarding();
    notifyListeners();
  }
}
