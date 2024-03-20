class Bookevent {
  String e_id;
  String u_id;
  String no_seat;
  String total_price;

  Bookevent(
      {this.e_id = "", this.u_id = "", this.no_seat = "", this.total_price = ""});

  factory Bookevent.formJson(Map<String, dynamic>json){
    return Bookevent(
      e_id: json['e_id'] as String,
      u_id: json['u_id'] as String,
      no_seat: json['no_seat'] as String,
      total_price: json['total_price'] as String,
    );
  }

  @override
  String toString() {
    return 'Trans{e_id:$e_id,u_id:$u_id,no_seat:$no_seat,total_price:$total_price}';
  }
}

