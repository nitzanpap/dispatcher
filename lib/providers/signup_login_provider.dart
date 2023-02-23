import 'package:flutter/material.dart';

class SignupLoginProvider with ChangeNotifier {
  String _email = '';
  String _password = '';

  String get email => _email;
  String get password => _password;

  void updateEmail(String newEmail) {
    _email = newEmail;
    notifyListeners();
    print('Updated email...');
  }

  void updatePassword(String newPassword) {
    _password = newPassword;
    notifyListeners();
    print('Updated password...');
  }
}
