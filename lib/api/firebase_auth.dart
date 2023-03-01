import 'package:dispatcher/constants/firebase_auth_types.dart';
import 'package:dispatcher/helpers/helper_classes/firebase_config.dart';
import 'package:http/http.dart' as http;

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

  static String getFirebaseAuthResponseMessage({
    required String reasonPhrase,
    required Map<String, dynamic> responseData,
  }) {
    switch (reasonPhrase) {
      case FirebaseAuthResponseTypes.badRequest:
        return responseData['error']['message'];
      case FirebaseAuthResponseTypes.ok:
        return FirebaseAuthResponseTypes.ok;
      default:
        print('Unknown \'reasonPhrase\' from Firebase: $reasonPhrase');
        return reasonPhrase;
    }
  }
}
