class Eventdetail {
  final String eId;
  final String ePoster;
  final String eName;
  final String eSpeaker;
  final String eDate;
  final String eTime;
  final String eInfo;
  final String cId;
  final String oId;
  final String lId;
  final String fPrice;
  final String fSeat;
  final String aSeat;
  final String cName;
  final String location;
  final String lAddress;
  final String lLink;

  Eventdetail({
    required this.eId,
    required this.ePoster,
    required this.eName,
    required this.eSpeaker,
    required this.eDate,
    required this.eTime,
    required this.eInfo,
    required this.cId,
    required this.oId,
    required this.lId,
    required this.fPrice,
    required this.fSeat,
    required this.aSeat,
    required this.cName,
    required this.location,
    required this.lAddress,
    required this.lLink,
  });

  factory Eventdetail.fromJson(Map<String, dynamic> json) {
    return Eventdetail(
      eId: json['e_id'],
      ePoster: json['e_poster'],
      eName: json['e_name'],
      eSpeaker: json['e_speaker'],
      eDate: json['e_date'],
      eTime: json['e_time'],
      eInfo: json['e_info'],
      cId: json['c_id'],
      oId: json['o_id'],
      lId: json['l_id'],
      fPrice: json['f_price'],
      fSeat: json['f_seat'],
      aSeat: json['a_seat'],
      cName: json['c_name'],
      location: json['location'],
      lAddress: json['l_address'],
      lLink: json['l_link'],
    );
  }
}
