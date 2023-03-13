import './firebase_error_element.dart';

class FirebaseAuthResponseError {
  FirebaseAuthResponseError({
    required this.code,
    required this.message,
    required this.errors,
  });

  final int code;
  final String message;
  final List<ErrorElement> errors;

  factory FirebaseAuthResponseError.fromJson(Map<String, dynamic> json) =>
      FirebaseAuthResponseError(
        code: json["code"],
        message: (json["message"] as String).replaceAll('_', ' ').toLowerCase(),
        errors: List<ErrorElement>.from(
            json["errors"].map((x) => ErrorElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "errors": List<dynamic>.from(errors.map((x) => x.toJson())),
      };
}
