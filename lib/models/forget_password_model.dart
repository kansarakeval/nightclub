class ForgetPasswordRequest {
  final String email;

  ForgetPasswordRequest({required this.email});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
    };
  }
}

class ForgetPasswordResponse {
  final String? sotp;
  final String? email;

  ForgetPasswordResponse({this.sotp, this.email});

  factory ForgetPasswordResponse.fromJson(Map<String, dynamic> json) {
    return ForgetPasswordResponse(
      sotp: json['sotp'],
      email: json['email'],
    );
  }
}
