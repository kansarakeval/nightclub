import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import '../../../models/bookdetails.dart';
import '../../../services/api_call.dart';

class UpcomingScreen extends StatefulWidget {
  const UpcomingScreen({super.key});

  @override
  State<UpcomingScreen> createState() => _UpcomingScreenState();
}

class _UpcomingScreenState extends State<UpcomingScreen> {

  final Apicall api = Apicall();
  late Future<List<Bookdetails>> _BookingDetailsFuture;
  late String uID = '';

  @override
  void initState() {
    super.initState();
    _loadData();
    // _loadlist();
  }

  Future<void> _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      uID = prefs.getString('uID') ?? '';
    });
  }


  @override
  Widget build(BuildContext context) {
    _BookingDetailsFuture = api.fetchupcomingEvents(uID);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder<List<Bookdetails>>(
                future: _BookingDetailsFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(
                        child: Text('Error: ${snapshot.error}'));
                  } else {
                    final List<Bookdetails> wishlistDetailsList = snapshot.data!;
                    if (wishlistDetailsList.isEmpty) {
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
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              "Empty Tickets",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const Text("Now Book You`r Ticket And Enjoy The Events!")
                          ],
                        ),
                      );
                    } else {
                      return SizedBox(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.70,
                        child: ListView.builder(
                          itemCount: wishlistDetailsList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.95,
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    spreadRadius: 0.2,
                                    blurRadius: 2,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Center(
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                          context,
                                          'eventdetail',
                                          arguments: wishlistDetailsList[index]
                                              .eId,
                                        );
                                      },
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                                15),
                                            child: Image.network(
                                              "${Apicall
                                                  .imgUrl}event/${wishlistDetailsList[index]
                                                  .ePoster}",
                                              height: 100,
                                              width: 100,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .start,
                                              children: [
                                                Text(
                                                  wishlistDetailsList[index]
                                                      .eName,
                                                  style: const TextStyle(
                                                      fontSize: 20,
                                                      fontWeight: FontWeight
                                                          .w500),
                                                  overflow: TextOverflow
                                                      .ellipsis,
                                                ),
                                                const SizedBox(height: 5,),
                                                Text(
                                                  '${DateFormat('E, MMM dd')
                                                      .format(DateTime.parse(
                                                      wishlistDetailsList[index]
                                                          .eDate))} - ${DateFormat(
                                                      'hh:mm a').format(
                                                      DateFormat('HH:mm:ss')
                                                          .parse(
                                                          wishlistDetailsList[index]
                                                              .eTime))}',
                                                  style: const TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xFF00B79B),
                                                  ),
                                                  overflow: TextOverflow
                                                      .ellipsis,
                                                ),
                                                const SizedBox(height: 5,),
                                                Row(
                                                  children: [
                                                    const Icon(
                                                      Icons.location_on_rounded,
                                                      size: 18,
                                                      color: Color(0xFF00B79B),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        '${wishlistDetailsList[index]
                                                            .location},${wishlistDetailsList[index]
                                                            .lAddress}',
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: const TextStyle(
                                                            fontSize: 15,
                                                            color: Color(
                                                                0x7100B79B)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 7,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceEvenly,
                                      children: [
                                        SizedBox(
                                          width: MediaQuery
                                              .of(context)
                                              .size
                                              .width * 0.4,
                                          // Set the desired width here
                                          child: ElevatedButton(
                                            onPressed: () {
                                              showModalBottomSheet(
                                                context: context,
                                                builder: (
                                                    BuildContext context) {
                                                  return StatefulBuilder(
                                                    builder: (
                                                        BuildContext context,
                                                        StateSetter setState) {
                                                      return Container(
                                                        padding: const EdgeInsets
                                                            .only(
                                                          left: 16.0,
                                                          right: 16.0,
                                                          bottom: 16.0,
                                                          top: 5.0,
                                                        ),
                                                        child: Column(
                                                          mainAxisSize: MainAxisSize
                                                              .min,
                                                          children: [
                                                            SizedBox(
                                                              width: 50,
                                                              // Set the desired width here
                                                              child: Divider(
                                                                color: Colors
                                                                    .grey
                                                                    .shade700,
                                                                // Darker color
                                                                height: 2, // Set the height of the divider
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                height: 10),
                                                            const Text(
                                                              'Cancel Booking',
                                                              style: TextStyle(
                                                                  fontSize: 25.0,
                                                                  fontWeight: FontWeight
                                                                      .w500),
                                                            ),
                                                            const SizedBox(
                                                                height: 5),
                                                            Divider(
                                                                color: Colors
                                                                    .grey
                                                                    .shade300),
                                                            const SizedBox(
                                                                height: 5),
                                                            const Text(
                                                              'Are you sure you want to cancel \nthis event?',
                                                              style: TextStyle(
                                                                  fontSize: 18.0),
                                                            ),
                                                            const SizedBox(
                                                                height: 10),
                                                            const Text(
                                                              'No Refund',
                                                              style: TextStyle(
                                                                  fontSize: 12.0),
                                                            ),
                                                            const SizedBox(
                                                                height: 40.0),
                                                            Row(
                                                              mainAxisAlignment: MainAxisAlignment
                                                                  .spaceEvenly,
                                                              children: [
                                                                ElevatedButton(
                                                                  onPressed: () {
                                                                    Navigator
                                                                        .pop(
                                                                        context);
                                                                  },
                                                                  style: ButtonStyle(
                                                                    shape: MaterialStateProperty
                                                                        .all(
                                                                      RoundedRectangleBorder(
                                                                        borderRadius: BorderRadius
                                                                            .circular(
                                                                            50),
                                                                        side: const BorderSide(
                                                                            color: Color(
                                                                                0xFF00B79B)),
                                                                      ),),),
                                                                  child: const Text(
                                                                    "No, Don't Cancel",
                                                                    style: TextStyle(
                                                                        color: Color(
                                                                            0xFF00B79B)),
                                                                    overflow: TextOverflow
                                                                        .ellipsis, // Prevent text from going to the next line
                                                                  ),
                                                                ),
                                                                ElevatedButton(
                                                                  onPressed: () {
                                                                    Navigator
                                                                        .pushNamed(
                                                                        context,
                                                                        'cancel',
                                                                        arguments: wishlistDetailsList[index]
                                                                            .bId
                                                                    ); // Handle payment logic here
                                                                  },
                                                                  style: ButtonStyle(
                                                                    backgroundColor: MaterialStateProperty
                                                                        .all(
                                                                        const Color(
                                                                            0xFF00B79B)),
                                                                  ),
                                                                  child: const Text(
                                                                    "Yes, Cancel",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white),
                                                                    overflow: TextOverflow
                                                                        .ellipsis, // Prevent text from going to the next line
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              );
                                            },
                                            style: ButtonStyle(
                                              shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                                  borderRadius: BorderRadius
                                                      .circular(50),
                                                  side: const BorderSide(
                                                      color: Color(0xFF00B79B)),
                                                ),),),
                                            child: const Text(
                                              "Cancel Booking",
                                              style: TextStyle(
                                                  color: Color(0xFF00B79B)),
                                              overflow: TextOverflow
                                                  .ellipsis, // Prevent text from going to the next line
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery
                                              .of(context)
                                              .size
                                              .width * 0.4,
                                          // Set the desired width here
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.pushNamed(
                                                  context,
                                                  'bookdetail',
                                                  arguments: wishlistDetailsList[index]
                                                      .bId
                                              );
                                            },
                                            style: ButtonStyle(
                                              backgroundColor: MaterialStateProperty
                                                  .all(
                                                  const Color(0xFF00B79B)),
                                            ),
                                            child: const Text(
                                              "View E-Ticket",
                                              style: TextStyle(
                                                  color: Colors.white),
                                              overflow: TextOverflow
                                                  .ellipsis, // Prevent text from going to the next line
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
