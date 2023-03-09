// To parse this JSON data, do
//
//     final firebaseAuthTokenResponse = firebaseAuthTokenResponseFromJson(jsonString);

import 'dart:convert';

import 'package:dispatcher/api/firebase/firebase_auth_response_error.dart';

FirebaseAuthTokenResponse firebaseAuthTokenResponseFromJson(String str) =>
    FirebaseAuthTokenResponse.fromJson(json.decode(str));

String firebaseAuthTokenResponseToJson(FirebaseAuthTokenResponse data) =>
    json.encode(data.toJson());

class FirebaseAuthTokenResponse {
  FirebaseAuthTokenResponse({
    this.error,
    this.kind,
    this.users,
  });

  final FirebaseAuthResponseError? error;
  final String? kind;
  final List<User>? users;

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

class User {
  User({
    this.localId,
    this.email,
    this.passwordHash,
    this.emailVerified,
    this.passwordUpdatedAt,
    this.providerUserInfo,
    this.validSince,
    this.lastLoginAt,
    this.createdAt,
    this.lastRefreshAt,
  });

  final String? localId;
  final String? email;
  final String? passwordHash;
  final bool? emailVerified;
  final int? passwordUpdatedAt;
  final List<ProviderUserInfo>? providerUserInfo;
  final String? validSince;
  final String? lastLoginAt;
  final String? createdAt;
  final DateTime? lastRefreshAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        localId: json["localId"],
        email: json["email"],
        passwordHash: json["passwordHash"],
        emailVerified: json["emailVerified"],
        passwordUpdatedAt: json["passwordUpdatedAt"],
        providerUserInfo: json["providerUserInfo"] == null
            ? []
            : List<ProviderUserInfo>.from(json["providerUserInfo"]!
                .map((x) => ProviderUserInfo.fromJson(x))),
        validSince: json["validSince"],
        lastLoginAt: json["lastLoginAt"],
        createdAt: json["createdAt"],
        lastRefreshAt: json["lastRefreshAt"] == null
            ? null
            : DateTime.parse(json["lastRefreshAt"]),
      );

  Map<String, dynamic> toJson() => {
        "localId": localId,
        "email": email,
        "passwordHash": passwordHash,
        "emailVerified": emailVerified,
        "passwordUpdatedAt": passwordUpdatedAt,
        "providerUserInfo": providerUserInfo == null
            ? []
            : List<dynamic>.from(providerUserInfo!.map((x) => x.toJson())),
        "validSince": validSince,
        "lastLoginAt": lastLoginAt,
        "createdAt": createdAt,
        "lastRefreshAt": lastRefreshAt?.toIso8601String(),
      };
}

class ProviderUserInfo {
  ProviderUserInfo({
    this.providerId,
    this.federatedId,
    this.email,
    this.rawId,
  });

  final String? providerId;
  final String? federatedId;
  final String? email;
  final String? rawId;

  factory ProviderUserInfo.fromJson(Map<String, dynamic> json) =>
      ProviderUserInfo(
        providerId: json["providerId"],
        federatedId: json["federatedId"],
        email: json["email"],
        rawId: json["rawId"],
      );

  Map<String, dynamic> toJson() => {
        "providerId": providerId,
        "federatedId": federatedId,
        "email": email,
        "rawId": rawId,
      };
}
