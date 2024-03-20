class User {
  final String uId;
  final String uProfile;
  final String uName;
  final String uEmail;
  final String uContactNo;
  final String uState;
  final String uCites;
  final String uGender;
  final String uDob;

  User({
    required this.uId,
    required this.uProfile,
    required this.uName,
    required this.uEmail,
    required this.uContactNo,
    required this.uState,
    required this.uCites,
    required this.uGender,
    required this.uDob,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uId: json['u_id'],
      uProfile: json['u_profile'],
      uName: json['u_name'],
      uEmail: json['u_email'],
      uContactNo: json['u_contactno'],
      uState: json['staus'] ?? "",
      uCites: json['cites'] ?? "", // Handle null case if needed
      uGender: json['u_gender'] ?? "", // Handle null case if needed
      uDob: json['u_dob'] ?? "", // Handle null case if needed
    );
  }
}
