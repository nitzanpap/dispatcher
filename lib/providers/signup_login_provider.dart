import 'package:dispatcher/api/firebase/firebase_auth.dart';
import 'package:dispatcher/api/firebase/firebase_auth_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class SignupLoginProvider with ChangeNotifier {
  static const String signupTitle = 'Signup';
  static const String loginTitle = 'Login';
  String _email = '';
  String _password = '';
  String _confirmationPassword = '';
  String _idToken = '';
  bool _isSignupPage = true;

  String get email => _email;
  String get password => _password;
  String get confirmationPassword => _confirmationPassword;
  String get idToken => _idToken;
  bool get isSignupPage => _isSignupPage;

  String get getSnackBarActionText =>
      isSignupPage ? 'Signing up...' : 'Signing in...';
  String get title => isSignupPage ? signupTitle : loginTitle;
  String get oppositeTitle => isSignupPage ? loginTitle : signupTitle;

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

  void updateProvider({
    required String formEmail,
    required String formPassword,
    required String newIdToken,
  }) {
    _email = formEmail;
    _password = formPassword;
    _idToken = newIdToken;
    notifyListeners();
  }

  void resetFormData({required GlobalKey<FormState> formKey}) {
    formKey.currentState?.reset();
    _email = '';
    _password = '';
    notifyListeners();
  }

  Future<String> getMessageFromFirebaseAuth({
    required GlobalKey<FormState> formKey,
  }) async {
    if (!isFormValid(formKey)) {
      return 'Invalid input somewhere in the form!';
    }
    debugPrint('Valid Form!');

    final Response firebaseAuthResponse = await (isSignupPage
        ? FirebaseAuthApi.signup(email: email, password: password)
        : FirebaseAuthApi.login(email: email, password: password));

    final firebaseAuthResponseData =
        firebaseAuthResponseFromJson(firebaseAuthResponse.body);

    if (firebaseAuthResponseData.error == null) {
      updateProvider(
        formEmail: firebaseAuthResponseData.email!,
        formPassword: password,
        newIdToken: firebaseAuthResponseData.idToken!,
      );
      return isSignupPage ? "Signed up" : 'Signed in';
    }
    return firebaseAuthResponseData.error!.message;
  }

  bool isFormValid(formKey) => formKey.currentState!.validate();
}
