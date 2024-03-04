import 'package:flutter/material.dart';
import 'package:nightclub/screen/book%20event/view/book_event_screen.dart';
import 'package:nightclub/screen/dash/provider/dash_provider.dart';
import 'package:nightclub/screen/home/view/home_screen.dart';
import 'package:nightclub/screen/like/view/like_screen.dart';
import 'package:nightclub/screen/location/view/location_screen.dart';
import 'package:nightclub/screen/notification/view/notification_screen.dart';
import 'package:nightclub/screen/profile/view/profile_screeen.dart';
import 'package:nightclub/screen/tickets/view/ticket_screen.dart';
import 'package:provider/provider.dart';

class DashScreen extends StatefulWidget {
  const DashScreen({super.key});

  @override
  State<DashScreen> createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  List<Widget> screen = [
    const HomeScreen(),
    const LocationScreen(),
    const LikeScreen(),
    const TicketScreen(),
    const ProfileScreen(),
  ];

  DashProvider? providerr;
  DashProvider? providerw;

  @override
  Widget build(BuildContext context) {
    providerr = context.read<DashProvider>();
    providerw = context.watch<DashProvider>();
    return SafeArea(
      child: Scaffold(
        body: PageView(
          controller: providerr!.pageController,
          onPageChanged: (value) {
            providerr!.changeIndedx(value);
          },
          children: screen,
        ),
        bottomNavigationBar: NavigationBar(
          indicatorColor: Color(0xFF00B79B),
          selectedIndex: providerw!.screenIndex,
          onDestinationSelected: (value) {
            providerr!.pageController.animateToPage(value,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn);
            providerr!.screenIndex = value;
          },
          destinations: const [
            NavigationDestination(
                icon: Icon(Icons.home_outlined), label: "Home"),
            NavigationDestination(
                icon: Icon(Icons.explore_outlined), label: "Explore"),
            NavigationDestination(
                icon: Icon(Icons.favorite_border), label: "Favorites"),
            NavigationDestination(
                icon: Icon(Icons.confirmation_num_outlined), label: "Tickets"),
            NavigationDestination(
                icon: Icon(Icons.perm_identity_rounded), label: "Profile"),
          ],
          animationDuration: const Duration(microseconds: 1000),
        ),
      ),
    );
  }
}
