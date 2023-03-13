import 'package:dispatcher/enums/routes.dart';
import 'package:dispatcher/core/models/firebase_models/firebase_auth_response.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';

import '../../core/models/logging_message_type.dart';
import '../../core/services/firebase_services/firebase_auth_api.dart';

class SignupLoginProvider with ChangeNotifier {
  static const String signupTitle = 'Signup';
  static const String loginTitle = 'Login';
  String _email = '';
  String _password = '';
  String _confirmationPassword = '';
  String _idToken = '';
  String _name = '';
  bool _isSignupPage = true;
  bool _isSignedIn = false;

  String get email => _email;
  String get password => _password;
  String get confirmationPassword => _confirmationPassword;
  String get idToken => _idToken;
  bool get isSignupPage => _isSignupPage;
  bool get isSignedIn => _isSignedIn;

  String get getSnackBarActionText =>
      isSignupPage ? 'Signing up...' : 'Signing in...';
  String get title => isSignupPage ? signupTitle : loginTitle;
  String get oppositeTitle => isSignupPage ? loginTitle : signupTitle;
  String get name {
    if (_name.isEmpty && _email.isEmpty) {
      return 'User';
    }
    if (_name.isEmpty) {
      return email.split('@')[0];
    }
    return _name;
  }

  set updateEmail(String newEmail) {
    _email = newEmail;
    notifyListeners();
  }

  set updatePassword(String newPassword) {
    _password = newPassword;
    notifyListeners();
  }

  set updateConfirmationPassword(String newConfirmationPassword) {
    _confirmationPassword = newConfirmationPassword;
    notifyListeners();
  }

  set updateIdToken(String newIdToken) {
    _idToken = newIdToken;
    notifyListeners();
  }

  void switchSignUpLoginPage() {
    _isSignupPage = !_isSignupPage;
    notifyListeners();
  }

  void updateName(String newName) {
    _name = newName;
    notifyListeners();
  }

  void _updateProvider({
    required String formEmail,
    required String formPassword,
    required String idToken,
  }) {
    _email = formEmail;
    _password = formPassword;
    _idToken = idToken;
    _isSignedIn = true;
  }

  void resetFormData({required GlobalKey<FormState> formKey}) {
    formKey.currentState?.reset();
    _email = '';
    _password = '';
    notifyListeners();
  }

  Future<LoggingMessageType> getMessageFromFirebaseAuth({
    required GlobalKey<FormState> formKey,
  }) async {
    if (!isFormValid(formKey)) {
      return LoggingMessageType(
          message: 'Invalid input somewhere in the form!', isValid: false);
    }
    debugPrint('Valid Form!');

    final Response firebaseAuthResponse = await FirebaseAuthApi.logIntoFirebase(
      isSignupPage: isSignupPage,
      email: email,
      password: password,
    );

    final firebaseAuthResponseData =
        FirebaseAuthResponse.fromRawJson(firebaseAuthResponse.body);

    if (firebaseAuthResponseData.error == null) {
      _updateProvider(
        formEmail: firebaseAuthResponseData.email!,
        formPassword: password,
        idToken: firebaseAuthResponseData.idToken!,
      );
      updateIdToken = firebaseAuthResponseData.idToken!;
      FirebaseAuthApi.saveTokenToDevice(idToken);
      return LoggingMessageType(
          message: 'Logged in successfully!', isValid: true);
    }
    return LoggingMessageType(
        message: firebaseAuthResponseData.error!.message, isValid: false);
  }

  bool isFormValid(formKey) => formKey.currentState!.validate();

  Future<void> logout(BuildContext context) async {
    await FirebaseAuthApi.logout();
    _isSignedIn = false;
    notifyListeners();
    if (context.mounted) {
      context.goNamed(ValidRoutes.signupLoginScreen.name);
    }
  }
}