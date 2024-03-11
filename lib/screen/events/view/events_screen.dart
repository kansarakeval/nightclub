import 'package:flutter/material.dart';
import 'package:nightclub/widget/home_event_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nightclub/services/api_call.dart';
import 'package:intl/intl.dart';

import '../../../models/cityevent.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  final Apicall api = Apicall();
  late Future<List<Cityevent>> _eventDetailsFuture;
  late String uID = '';

  @override
  void initState() {
    super.initState();
    _loadData();
  }
  Future<void> _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      uID = prefs.getString('uID') ?? '';
    });
  }
  @override
  Widget build(BuildContext context) {
    final lAddress = ModalRoute.of(context)!.settings.arguments as String;
    _eventDetailsFuture = api.fetchCityevent(lAddress,uID);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.40,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Color(0xFF00B79B),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Event",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  FutureBuilder<List<Cityevent>>(
                    future: _eventDetailsFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else {
                        final List<Cityevent> eventDetailsList = snapshot.data!;
                        return Expanded(
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.50,
                            child: ListView.builder(
                              itemCount: eventDetailsList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                          context,
                                          'eventdetail',
                                          arguments: eventDetailsList[index].eId,
                                        );
                                      },
                                      child: HomeEventContainer(
                                        img: "${Apicall.imgUrl}event/${eventDetailsList[index].ePoster}",
                                        title: eventDetailsList[index].eName,
                                        date: '${DateFormat('E, MMM dd').format(DateTime.parse(eventDetailsList[index].eDate))} - ${DateFormat('hh:mm a').format(DateFormat('HH:mm:ss').parse(eventDetailsList[index].eTime))}',
                                        loc: '${eventDetailsList[index].location},${eventDetailsList[index].lAddress}',
                                        eid: eventDetailsList[index].eId,
                                        wis:eventDetailsList[index].in_wishlist,
                                        api: api,
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                  ],
                                );
                              },
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}