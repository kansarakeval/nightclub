import 'package:flutter/material.dart';
import 'package:nightclub/screen/tickets/view/cancelled_screen.dart';
import 'package:nightclub/screen/tickets/view/completed_screen.dart';
import 'package:nightclub/screen/tickets/view/upcoming_screen.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Column(
              children: [
                SizedBox(height: 10,),
                Text(
                  "Tickets",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),

              ],
            ),
            centerTitle: true,
            backgroundColor: const Color(0xFF00B79B),
            bottom: const TabBar(
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white,
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                  text: "Upcoming",
                ),
                Tab(
                  text: "Completed",
                ),
                Tab(
                  text: "Cancelled",
                ),
              ],
            ),
          ),
          backgroundColor: Colors.white,
          body: const TabBarView(children: [
            UpcomingScreen(),

            CompletedScreen(),

            CancelledScreen(),
          ]),
        ),
      ),
    );
  }
}
