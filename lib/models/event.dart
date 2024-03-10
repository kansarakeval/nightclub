class Event {
  final String e_id;
  final String e_poster;
  final String e_name;
  final String e_speaker;
  final String e_date;
  final String e_time;
  final String e_info;
  final String c_id;
  final String o_id;
  final String l_id;
  final String f_price;
  final String f_seat;
  final String a_seat;
  final String location;
  final String l_address;
  final String l_link;

  Event(
      {this.e_id = "",
      this.e_poster = "",
      this.e_name = "",
      this.e_speaker = "",
      this.e_date = "",
      this.e_time = "",
      this.e_info = "",
      this.c_id = "",
      this.o_id = "",
      this.l_id = "",
      this.f_price = "",
      this.f_seat = "",
      this.a_seat = "",
      this.location = "",
      this.l_address = "",
      this.l_link = ""
      });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      e_id: json['e_id'].toString(),
      e_poster: json['e_poster'] ?? '',
      e_name: json['e_name'].toString(),
      e_speaker: json['e_speaker'].toString(),
      e_date: json['e_date'].toString(),
      e_time: json['e_time'].toString(),
      e_info: json['e_info'].toString(),
      c_id: json['c_id'].toString(),
      o_id: json['o_id'].toString(),
      l_id: json['l_id'].toString(),
      f_price: json['f_price'].toString(),
      f_seat: json['f_seat'].toString(),
      a_seat: json['a_seat'].toString(),
      location: json['location']?.toString() ?? '', // Handle null value for 'location'
      l_address: json['l_address']?.toString() ?? '', // Handle null value for 'l_address'
      l_link: json['l_link']?.toString() ?? '', // Handle null value for 'l_link'
    );
  }

  @override
  String toString() {
    return 'Trans{e_id:$e_id,e_poster:$e_poster,e_name:$e_name,e_speaker:$e_speaker,e_date:$e_date,e_time:$e_time,e_info:$e_info,c_id:$c_id,o_id:$o_id,l_id:$l_id,f_price:$f_price,f_seat:$f_seat,a_seat:$a_seat,location:$location,l_address:$l_address,l_link:$l_link	}';
  }
}
