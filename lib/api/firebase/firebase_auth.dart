import 'package:http/http.dart' as http;

import '../../helpers/helper_classes/firebase_config.dart';

abstract class FirebaseAuthApi {
  static Future<http.Response> logIntoFirebase({
    required bool isSignupPage,
    required String email,
    required String password,
  }) async {
    if (isSignupPage) {
      return _signup(email: email, password: password);
    } else {
      return _login(email: email, password: password);
    }
  }

  static Future<http.Response> _login(
      {required String email, required String password}) {
    return http.post(
      Uri.parse(FirebaseConfig.signInAuthUrl),
      body: {
        'email': email,
        'password': password,
      },
    );
  }

  static Future<http.Response> _signup(
      {required String email, required String password}) {
    return http.post(
      Uri.parse(FirebaseConfig.signUpAuthUrl),
      body: {
        'email': email,
        'password': password,
      },
    );
  }
}
