import 'dart:convert';

import './firebase_auth_response_error.dart';

FirebaseAuthResponse firebaseAuthResponseFromJson(String str) =>
    FirebaseAuthResponse.fromJson(json.decode(str));

String firebaseAuthResponseToJson(FirebaseAuthResponse data) =>
    json.encode(data.toJson());

class FirebaseAuthResponse {
  FirebaseAuthResponse({
    this.error,
    this.kind,
    this.localId,
    this.email,
    this.displayName,
    this.idToken,
    this.registered,
  });

  final FirebaseAuthResponseError? error;
  final String? kind;
  final String? localId;
  final String? email;
  final String? displayName;
  final String? idToken;
  final bool? registered;

  factory FirebaseAuthResponse.fromJson(Map<String, dynamic> json) =>
      FirebaseAuthResponse(
        error: json["error"] == null
            ? null
            : FirebaseAuthResponseError.fromJson(json["error"]),
        kind: json["kind"],
        localId: json["localId"],
        email: json["email"],
        displayName: json["displayName"],
        idToken: json["idToken"],
        registered: json["registered"],
      );

  Map<String, dynamic> toJson() => {
        "error": error?.toJson(),
        "kind": kind,
        "localId": localId,
        "email": email,
        "displayName": displayName,
        "idToken": idToken,
        "registered": registered,
      };
}
