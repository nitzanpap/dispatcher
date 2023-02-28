import 'package:flutter/material.dart';

class SignupLoginProvider with ChangeNotifier {
  String _email = '';
  String _password = '';

  String get email => _email;
  String get password => _password;

  void updateEmail(String newEmail) {
    _email = newEmail;
    notifyListeners();
  }

  void updatePassword(String newPassword) {
    _password = newPassword;
    notifyListeners();
  }

  void updateProvider({
    required String formEmail,
    required String formPassword,
  }) {
    _email = formEmail;
    _password = formPassword;
    debugPrint('Email: $formEmail\n Password: $formPassword');
    notifyListeners();
  }

  void resetFormData() {
    _email = '';
    _password = '';
    notifyListeners();
  }
}
