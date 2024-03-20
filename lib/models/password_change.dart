class PasswordChangeResponse {
  final int success;

  PasswordChangeResponse({required this.success});

  factory PasswordChangeResponse.fromJson(Map<String, dynamic> json) {
    return PasswordChangeResponse(
      success: json['success'],
    );
  }
}