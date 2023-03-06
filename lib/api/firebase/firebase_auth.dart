import 'package:http/http.dart' as http;

import '../../helpers/helper_classes/firebase_config.dart';

abstract class FirebaseAuthApi {
  static Future<http.Response> login(
      {required String email, required String password}) {
    return http.post(
      Uri.parse(FirebaseConfig.signInAuthUrl),
      body: {
        'email': email,
        'password': password,
      },
    );
  }

  static Future<http.Response> signup(
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
