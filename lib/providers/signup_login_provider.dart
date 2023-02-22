import 'package:flutter/material.dart';

class SignupLoginProvider with ChangeNotifier {
  String _email = 'John';

  String get email => _email;

  void updateEmail(newEmailString) {
    _email = newEmailString;
    notifyListeners();
    print('Updated email...');
  }
}
