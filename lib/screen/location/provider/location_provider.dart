import 'package:flutter/material.dart';
import 'package:nightclub/screen/location/model/location_model.dart';

class LocationProvider with ChangeNotifier{
  List<LocationModel> locationList = [
    LocationModel(img: "assets/countryimg/New York.jpg",name: "New York",city: "USA"),
    LocationModel(img: "assets/countryimg/London.jpg",name: "London",city: "UK"),
    LocationModel(img: "assets/countryimg/Mumbai.jpg",name: "Mumbai",city: "India"),
    LocationModel(img: "assets/countryimg/Paris.jpg",name: "Paris",city: "France"),
    LocationModel(img: "assets/countryimg/Bangalore.jpg",name: "Bangalore",city: "India"),
    LocationModel(img: "assets/countryimg/Moscow.jpg",name: "Moscow",city: "Russia"),
    LocationModel(img: "assets/countryimg/Dubai.jpg",name: "Dubai",city: "UAE"),
    LocationModel(img: "assets/countryimg/Tokyo.jpg",name: "Tokyo",city: "Japan"),
    LocationModel(img: "assets/countryimg/Singapore.jpg",name: "Singapore",city: "Singapore"),
    LocationModel(img: "assets/countryimg/Los Angeles.jpg",name: "Los Angeles",city: "USA"),
    LocationModel(img: "assets/countryimg/Amsterdam.jpg",name: "Amsterdam",city: "Netherlands"),
    LocationModel(img: "assets/countryimg/Barcelona.jpg",name: "Barcelona",city: "Spain"),
    LocationModel(img: "assets/countryimg/Beijing.jpg",name: "Beijing",city: "China"),
    LocationModel(img: "assets/countryimg/Bergen.jpg",name: "Bergen",city: "Norway"),
    LocationModel(img: "assets/countryimg/Cape Town.jpg",name: "Cape Town",city: "South Africa"),
    LocationModel(img: "assets/countryimg/Florence.jpg",name: "Florence",city: "Italy"),
  ];
}