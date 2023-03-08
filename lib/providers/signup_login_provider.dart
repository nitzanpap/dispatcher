import 'package:flutter/material.dart';

class SignupLoginProvider with ChangeNotifier {
  String _email = '';
  String _password = '';
  String _idToken = '';
  String _name = '';

  String get email => _email;
  String get password => _password;
  String get idToken => _idToken;
  String get name {
    if (_name.isEmpty && _email.isEmpty) {
      return 'User';
    }
    if (_name.isEmpty) {
      return email.split('@')[0];
    }
    return _name;
  }

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

  void updateName(String newName) {
    _name = newName;
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
