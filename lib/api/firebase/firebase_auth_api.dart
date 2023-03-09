import 'package:dispatcher/api/firebase/firebase_auth_token_response.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import './firebase_config.dart';

abstract class FirebaseAuthApi {
  static Future<bool> checkTokenConnected() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final String? authToken = preferences.getString('auth_token');
    if (authToken != null) {
      final http.Response response = await http.post(
        Uri.parse(FirebaseConfig.checkTokenConnectedUrl),
        body: {
          'idToken': authToken,
        },
      );
      final responseData = firebaseAuthTokenResponseFromJson(response.body);
      if (responseData.error == null) {
        return true;
      }
    }
    return false;
  }

  static Future<void> saveTokenToDevice(String idToken) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('auth_token', idToken);
  }

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
    return () async {
      final res = await http.post(
        Uri.parse(FirebaseConfig.signInAuthUrl),
        body: {
          'email': email,
          'password': password,
          'returnSecureToken': "true",
        },
      );
      print(res);
      return res;
    }();
  }

  static Future<http.Response> _signup(
      {required String email, required String password}) {
    return http.post(
      Uri.parse(FirebaseConfig.signUpAuthUrl),
      body: {
        'email': email,
        'password': password,
        'returnSecureToken': "true",
      },
    );
  }
}
