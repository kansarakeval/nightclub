
class Category {
  final String cId;
  final String cName;
  final String cPic;

  Category({required this.cId, required this.cName, required this.cPic});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      cId: json['c_id'],
      cName: json['c_name'],
      cPic: json['c_pic'],
    );
  }
}