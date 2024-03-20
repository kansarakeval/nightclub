import 'package:flutter/material.dart';
import 'package:nightclub/screen/dash/provider/dash_provider.dart';
import 'package:nightclub/screen/home/view/home_screen.dart';
import 'package:nightclub/screen/like/view/like_screen.dart';
import 'package:nightclub/screen/location/view/location_screen.dart';
import 'package:nightclub/screen/profile/view/profile_screeen.dart';
import 'package:nightclub/screen/tickets/view/ticket_screen.dart';
import 'package:provider/provider.dart';

class DashScreen extends StatelessWidget {
  const DashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DashProvider>(
      create: (context) => DashProvider(),
      child: const DashScreenContent(),
    );
  }
}

class DashScreenContent extends StatefulWidget {
  const DashScreenContent({super.key});

  @override
  _DashScreenContentState createState() => _DashScreenContentState();
}

class _DashScreenContentState extends State<DashScreenContent> {
  List<Widget> screen = [
    const HomeScreen(),
    const LocationScreen(),
    const LikeScreen(),
    const TicketScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final DashProvider provider = Provider.of<DashProvider>(context);

    return SafeArea(
      child: Scaffold(
        body: PageView(
          controller: provider.pageController,
          onPageChanged: (value) {
            provider.changeIndex(value);
          },
          children: screen,
        ),
        bottomNavigationBar: NavigationBar(
          indicatorColor: const Color(0xFF00B79B),
          selectedIndex: provider.screenIndex,
          onDestinationSelected: (value) {
            provider.pageController.animateToPage(value,
                duration: const Duration(milliseconds:500),
                curve: Curves.easeIn);
            provider.changeIndex(value);
          },
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home_outlined), label: "Home"),
            NavigationDestination(icon: Icon(Icons.explore_outlined), label: "Explore"),
            NavigationDestination(icon: Icon(Icons.favorite_border), label: "Favorites"),
            NavigationDestination(icon: Icon(Icons.confirmation_num_outlined), label: "Tickets"),
            NavigationDestination(icon: Icon(Icons.perm_identity_rounded), label: "Profile"),
          ],
          animationDuration: const Duration(milliseconds: 1000),
        ),
      ),
    );
  }
}
