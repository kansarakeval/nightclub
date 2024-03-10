class City {
  final String cityName;
  final String stateName;

  City({required this.cityName, required this.stateName});

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      cityName: json['cityName'],
      stateName: json['stateName'],
    );
  }
}