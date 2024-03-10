class Login{
  String u_email;
  String u_psw;

  Login(
      {this.u_email = "", this.u_psw = ""});

  factory Login.fromJson(Map<String,dynamic>json){
    return Login(
      u_email: json['u_email'] as String,
      u_psw: json['u_psw'] as String,
    );
  }

  @override
  String toString() {
    return 'Trans{u_email:$u_email,u_psw:$u_psw}';
  }
}