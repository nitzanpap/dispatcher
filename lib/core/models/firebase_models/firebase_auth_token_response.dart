// To parse this JSON data, do
//
//     final firebaseAuthTokenResponse = FirebaseAuthTokenResponse.fromRawJson(jsonString);

import 'dart:convert';

import './firebase_auth_response_error.dart';
import './user.dart';

class FirebaseAuthTokenResponse {
  FirebaseAuthTokenResponse({
    this.error,
    this.kind,
    this.users,
  });

  final FirebaseAuthResponseError? error;
  final String? kind;
  final List<User>? users;

  factory FirebaseAuthTokenResponse.fromRawJson(String str) =>
      FirebaseAuthTokenResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FirebaseAuthTokenResponse.fromJson(Map<String, dynamic> json) =>
      FirebaseAuthTokenResponse(
        error: json["error"] == null
            ? null
            : FirebaseAuthResponseError.fromJson(json["error"]),
        kind: json["kind"],
        users: json["users"] == null
            ? []
            : List<User>.from(json["users"]!.map((x) => User.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error?.toJson(),
        "kind": kind,
        "users": users == null
            ? []
            : List<dynamic>.from(users!.map((x) => x.toJson())),
      };
}
