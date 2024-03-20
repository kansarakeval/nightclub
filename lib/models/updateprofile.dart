class UpdateUserResponse {
  final int success;

  UpdateUserResponse({required this.success});

  factory UpdateUserResponse.fromJson(Map<String, dynamic> json) {
    return UpdateUserResponse(success: json['success']);
  }
}