import 'package:http/http.dart' as http;

import '../../models/firebase_models/firebase_auth_token_response.dart';
import '../../utils/device_services/device_storage_functions.dart';

import '../../../constants/configs/firebase_config.dart';

abstract class FirebaseAuthApi {
  static Future<bool> checkTokenConnected() async {
    final String? authToken =
        await DeviceStorageFunctions.getFromPreferencesStorage(
            key: 'auth_token');
    if (authToken != null) {
      final http.Response response = await http.post(
        Uri.parse(FirebaseConfig.checkTokenConnectedUrl),
        body: {
          'idToken': authToken,
        },
      );
      final responseData = FirebaseAuthTokenResponse.fromRawJson(response.body);
      if (responseData.error == null) {
        return true;
      }
    }
    return false;
  }

  static Future<void> saveTokenToDevice(String idToken) async {
    await DeviceStorageFunctions.saveInPreferencesStorage(
        key: 'auth_token', value: idToken);
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

  static Future<void> logout() async {
    await DeviceStorageFunctions.removeKeyFromPreferencesStorage(
        key: 'auth_token');
  }
}
