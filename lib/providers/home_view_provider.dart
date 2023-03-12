import 'package:flutter/material.dart';

class HomeViewProvider with ChangeNotifier {
  double _lastOffset = 0;

  double get offset => _lastOffset;

  set offset(double value) {
    _lastOffset = value;
    notifyListeners();
  }

  void saveOffset(double offset) {
    _lastOffset = offset;
  }
}
