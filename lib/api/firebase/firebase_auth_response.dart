// To parse this JSON data, do
//
//     final firebaseAuthTokenResponse = FirebaseAuthResponse.fromRawJson(jsonString);

import 'dart:convert';

import './firebase_auth_response_error.dart';

class FirebaseAuthResponse {
  FirebaseAuthResponse({
    this.error,
    this.kind,
    this.localId,
    this.email,
    this.displayName,
    this.idToken,
    this.registered,
    this.refreshToken,
    this.expiresIn,
  });

  final FirebaseAuthResponseError? error;
  final String? kind;
  final String? localId;
  final String? email;
  final String? displayName;
  final String? idToken;
  final bool? registered;
  final String? refreshToken;
  final String? expiresIn;

  factory FirebaseAuthResponse.fromRawJson(String str) =>
      FirebaseAuthResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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
        refreshToken: json["refreshToken"],
        expiresIn: json["expiresIn"],
      );

  Map<String, dynamic> toJson() => {
        "error": error?.toJson(),
        "kind": kind,
        "localId": localId,
        "email": email,
        "displayName": displayName,
        "idToken": idToken,
        "registered": registered,
        "refreshToken": refreshToken,
        "expiresIn": expiresIn,
      };
}
