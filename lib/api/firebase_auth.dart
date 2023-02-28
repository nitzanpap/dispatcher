import 'package:dispatcher/helpers/helper_classes/firebase_config.dart';
import 'package:http/http.dart' as http;

Future<http.Response> login({required String email, required String password}) {
  return http.post(
    Uri.parse(FirebaseConfig.signInAuthUrl),
    body: {
      'email': email,
      'password': password,
    },
  );
}

Future<http.Response> signup(
    {required String email, required String password}) {
  return http.post(
    Uri.parse(FirebaseConfig.signUpAuthUrl),
    body: {
      'email': email,
      'password': password,
    },
  );
}
