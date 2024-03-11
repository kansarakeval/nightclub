class addwishlist {
  final int success;

  addwishlist({required this.success});

  factory addwishlist.fromJson(Map<String, dynamic> json) {
    return addwishlist(success: json['success']);
  }
}