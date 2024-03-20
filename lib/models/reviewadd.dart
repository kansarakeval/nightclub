class ReviewAdd {
  final int success;

  ReviewAdd({required this.success});

  factory ReviewAdd.fromJson(Map<String, dynamic> json) {
    return ReviewAdd(success: json['success']);
  }
}
