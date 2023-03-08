class ErrorElement {
  ErrorElement({
    required this.message,
    required this.domain,
    required this.reason,
  });

  final String message;
  final String domain;
  final String reason;

  factory ErrorElement.fromJson(Map<String, dynamic> json) => ErrorElement(
        message: (json["message"] as String).replaceAll('_', ' ').toLowerCase(),
        domain: json["domain"],
        reason: json["reason"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "domain": domain,
        "reason": reason,
      };
}
