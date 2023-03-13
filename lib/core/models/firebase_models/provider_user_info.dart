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
