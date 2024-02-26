import 'package:flutter/material.dart';

class DashProvider with ChangeNotifier{

  int screenIndex = 0;
  PageController pageController = PageController(initialPage:0);

  void changeIndedx(int value)
  {
    screenIndex =value;
    notifyListeners();
  }
}