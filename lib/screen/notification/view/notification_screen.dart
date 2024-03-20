import 'package:flutter/material.dart';
import 'package:nightclub/widget/notifications_widget.dart';

import '../../../models/notification.dart';
import '../../../services/api_call.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final Apicall api = Apicall();
  late Future<List<cNotification>> _notificationFuture;
  @override
  Widget build(BuildContext context) {
    _notificationFuture = api.fetchNotifications();
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
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 10,),
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
                        FutureBuilder<List<cNotification>>(
                          future: _notificationFuture,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return const Center(child: CircularProgressIndicator());
                            } else if (snapshot.hasError) {
                              return Center(child: Text('Error: ${snapshot.error}'));
                            } else {
                              final List<cNotification> notificationList = snapshot.data!;
                              if (notificationList.isEmpty) {
                                return Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Image.asset(
                                        "assets/img/No data.gif",
                                        height: 500,
                                        width: 500,
                                      ),
                                      const SizedBox(height: 20),
                                      const Text(
                                        "Empty",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      const Text(
                                        "You don't have any notification at this time",
                                      ),
                                    ],
                                  ),
                                );
                              } else {
                                return ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: notificationList.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        SizedBox( // Wrap NotificationWidget with Container
                                          width: MediaQuery.of(context).size.width, // Set width to screen width
                                          child: NotificationWidget(
                                            title: notificationList[index].title,
                                            des: notificationList[index].content,
                                          ),
                                        ),
                                        const Divider(),
                                      ],
                                    );
                                  },
                                );
                              }
                            }
                          },
                        ),


                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
