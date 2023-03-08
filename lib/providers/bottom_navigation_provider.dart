import 'package:flutter/material.dart';

import '../enums/valid_main_tabs.dart';

class BottomNavigationProvider with ChangeNotifier {
  int _currentMainTabIndex = ValidPrimaryTabs.home.index;
  String _currentMainTabName = ValidPrimaryTabs.home.name;

  int get currentPrimaryTabIndex => _currentMainTabIndex;
  String get currentPrimaryTabName => _currentMainTabName;

  void changeMainTab(int newTabIndex) {
    _currentMainTabIndex = newTabIndex;
    _currentMainTabName = ValidPrimaryTabs.values[newTabIndex].name;
    notifyListeners();
  }
}
