class Registration {
  String u_name;
  String u_contactno;
  String u_email;
  String u_psw;

  Registration(
      {this.u_name = "", this.u_contactno = "", this.u_email = "", this.u_psw = ""});

  factory Registration.formJson(Map<String, dynamic>json){
    return Registration(
      u_name: json['u_name'] as String,
      u_contactno: json['u_contactno'] as String,
      u_email: json['u_email'] as String,
      u_psw: json['u_psw'] as String,
    );
  }

  @override
  String toString() {
    return 'Trans{u_name:$u_name,u_contactno:$u_contactno,u_email:$u_email,u_psw:$u_psw}';
  }
}

