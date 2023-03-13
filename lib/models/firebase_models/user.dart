import 'package:dispatcher/models/firebase_models/provider_user_info.dart';

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
