import 'package:dispatcher/enums/valid_main_tabs.dart';
import 'package:flutter/material.dart';

import '../constants/routes.dart';

class BottomNavigationProvider with ChangeNotifier {
  String _currentMainTabRoute = ValidRoutes.homeScreen;
  int _currentMainTabIndex = ValidMainTabs.home.index;

  String get currentMainTabRoute => _currentMainTabRoute;
  int get currentMainTabIndex => _currentMainTabIndex;

  void changeTabIndex(int newTabIndex) {
    _currentMainTabIndex = newTabIndex;
    notifyListeners();
  }
}
