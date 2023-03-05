import 'package:dispatcher/constants/routes.dart';
import 'package:flutter/material.dart';

class CurrentScreenProvider with ChangeNotifier {
  ValidRoutes? _currentScreen;

  ValidRoutes? get currentScreen => _currentScreen;

  void incrementOnboardingStep() {
    notifyListeners();
  }
}
