import 'package:flutter/material.dart';

class SignupLoginProvider with ChangeNotifier {
  String _email = '';
  String _password = '';
  String _idToken = '';

  String get email => _email;
  String get password => _password;
  String get idToken => _idToken;

  void updateEmail(String newEmail) {
    _email = newEmail;
    notifyListeners();
  }

  void updatePassword(String newPassword) {
    _password = newPassword;
    notifyListeners();
  }

  void updateIdToken(String newIdToken) {
    _password = newIdToken;
    notifyListeners();
  }

  void updateProvider({
    required String formEmail,
    required String formPassword,
    required String newIdToken,
  }) {
    _email = formEmail;
    _password = formPassword;
    _idToken = newIdToken;
    debugPrint(
        'Email: $formEmail\n Password: $formPassword\n ID Token: $newIdToken');
    notifyListeners();
  }

  void resetFormData() {
    _email = '';
    _password = '';
    notifyListeners();
  }
}
