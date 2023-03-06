import 'package:flutter/material.dart';

import '../enums/valid_main_tabs.dart';

class BottomNavigationProvider with ChangeNotifier {
  int _currentMainTabIndex = ValidMainTabs.home.index;
  var _currentMainTabRoute = ValidMainTabs.home.route;

  String get currentMainTabRoute => _currentMainTabRoute;
  int get currentMainTabIndex => _currentMainTabIndex;

  void changeMainTab(int newTabIndex) {
    _currentMainTabIndex = newTabIndex;
    _currentMainTabRoute = ValidMainTabs.values[currentMainTabIndex].route;
    notifyListeners();
  }
}
