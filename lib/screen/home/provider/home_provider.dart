import 'package:flutter/material.dart';
import 'package:nightclub/screen/home/model/home_model.dart';

class HomeProvider with ChangeNotifier{
  List<HomeModel> gridList = [
    HomeModel(
        img: "assets/singerimg/2.png",
        title: "Shopping",
        events: "604 Events",
        des:
        "Wednesday is hump day, but has anyone asked the camel if he's happy about it?"),
    HomeModel(
        img: "assets/singerimg/7.png",
        title: "Films",
        events: "701 Events",
        des:
        "Italy is my favorite country, in fact, I plan to spend two weeks there next year."),
    HomeModel(
        img: "assets/singerimg/13.png",
        title: "Fashion",
        events: "453 Events",
        des:
        "Someone who is not witty or sharp, but rather, they are ignorant, unintelligent, or senseless."),
    HomeModel(
        img: "assets/singerimg/14.png",
        title: "Adventure",
        events: "373 Events",
        des:
        "My Mum tries to be cool by saying that she likes all the same things that I do."),
    HomeModel(
        img: "assets/singerimg/15.png",
        title: "Business",
        events: "660 Events",
        des:
        "Wednesday is hump day, but has anyone asked the camel if he's happy about it?"),
    HomeModel(
        img: "assets/singerimg/7.png",
        title: "Drama",
        events: "952 Events",
        des:
        "There was no ice cream in the freezer, nor did they have money to go to the store."),
  ];
}