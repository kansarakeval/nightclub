import 'package:flutter/material.dart';
import 'package:nightclub/widget/notifications_widget.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              color: Colors.white,
            ),
            Container(
              height: MediaQuery.sizeOf(context).height * 0.40,
              width: MediaQuery.sizeOf(context).width,
              decoration: const BoxDecoration(
                color: Color(0xFF00B79B),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Notification",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    )
                  ],
                ),
                const SizedBox(height: 10,),
                Container(
                  padding: const EdgeInsets.all(10),
                  width: MediaQuery.sizeOf(context).width * 0.95,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 0.2,
                        blurRadius: 2,
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      NotificationWidget(icon: Icons.discount, title: "50% Discount", des: "one parson"),
                      const Divider(),
                      NotificationWidget(icon: Icons.discount, title: "Discount", des: "2 by 1 free"),
                      const Divider(),
                      NotificationWidget(icon: Icons.discount, title: "50% Discount", des: "one parson"),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
