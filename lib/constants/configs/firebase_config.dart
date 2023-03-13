abstract class FirebaseConfig {
  static const firebaseApiKey = String.fromEnvironment('firebaseApiKey');
  static const signUpAuthUrl =
      'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$firebaseApiKey';
  static const signInAuthUrl =
      'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$firebaseApiKey';
  static const checkTokenConnectedUrl =
      'https://identitytoolkit.googleapis.com/v1/accounts:lookup?key=$firebaseApiKey';
}
