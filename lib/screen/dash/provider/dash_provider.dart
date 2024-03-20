import 'package:flutter/material.dart';

class DashProvider with ChangeNotifier {
  int screenIndex = 0;
  late PageController pageController;

  DashProvider() {
    pageController = PageController(initialPage: screenIndex);
  }

  void changeIndex(int value) {
    screenIndex = value;
    // pageController.animateToPage(
    //   value,
    //   duration: const Duration(milliseconds: 500),
    //   curve: Curves.easeInOut,
    // );
    notifyListeners();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}