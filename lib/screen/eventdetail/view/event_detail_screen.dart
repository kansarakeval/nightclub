import 'package:flutter/material.dart';
import '../../../models/eventdetails.dart';
import '../../../services/api_call.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class EventDetailScreen extends StatefulWidget {
  const EventDetailScreen({super.key});

  @override
  _EventDetailScreenState createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends State<EventDetailScreen> {
  final Apicall api = Apicall();
  late Future<List<Eventdetail>> _eventDetailsFuture;

  @override
  void initState() {
    super.initState();
    // final eventId = ModalRoute.of(context)!.settings.arguments as String;
    // _eventDetailsFuture = api.fetchEventDetails(eventId);
  }

  @override
  Widget build(BuildContext context) {
    final eventId = ModalRoute.of(context)!.settings.arguments as String;
    _eventDetailsFuture = api.fetchEventDetails(eventId);
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
            FutureBuilder<List<Eventdetail>>(
              future: _eventDetailsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  final List<Eventdetail> eventDetailsList = snapshot.data!;
                  // Use eventDetailsList to display event details
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
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
                            const SizedBox(width: 10),
                            const Text(
                              "Event Detail",
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.90,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  spreadRadius: 0.2,
                                  blurRadius: 2,
                                )
                              ],
                              borderRadius: BorderRadius.circular(5)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Center(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    "${Apicall.imgUrl}event/${eventDetailsList[0].ePoster}",
                                    height: 230,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),

                              Text(
                                eventDetailsList[0].eName,
                                style: const TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w500),
                              ),
                              Divider(color: Colors.grey.shade300,),

                              Container(
                                padding: const EdgeInsets.all(5),
                                width: MediaQuery.of(context).size.width * 0.84,
                                height:
                                    MediaQuery.of(context).size.height * 0.12,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.blue.withOpacity(0.1),
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.calendar_month_rounded,
                                        color: Color(0xFF00B79B),
                                        size: 30,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          DateFormat('EEEE, MMMM dd, yyyy')
                                              .format(DateTime.parse(
                                                  eventDetailsList[0].eDate)),
                                          style: const TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          DateFormat('hh:mm a').format(
                                              DateFormat('HH:mm:ss').parse(
                                                  eventDetailsList[0].eTime)),
                                          style: const TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              Container(
                                padding: const EdgeInsets.all(5),
                                width: MediaQuery.of(context).size.width * 0.84,
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.blue.withOpacity(0.1),
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.location_on_rounded,
                                        color: Color(0xFF00B79B),
                                        size: 30,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      // Expanded widget added to occupy remaining space
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${eventDetailsList[0].location},',
                                            style: const TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            eventDetailsList[0].lAddress,
                                            style: const TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 25,
                                            child: ElevatedButton.icon(onPressed: () async {
                                              final url = eventDetailsList[0].lLink;
                                              if (await canLaunch(url)) {
                                                await launch(url);
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  const SnackBar(
                                                    content: Text(
                                                        "cloud not open Direction in Maps.."),
                                                    duration: Duration(seconds: 3),
                                                  ),
                                                );
                                              }
                                            },
                                              icon: const Icon(
                                                Icons.directions,
                                                size: 15,
                                                color: Colors.white,
                                              ),
                                              label: const Text("See Location on Maps",
                                              style: TextStyle(color: Colors.white,fontSize: 12),),
                                              style: ButtonStyle(
                                                backgroundColor: MaterialStateProperty.all(const Color(0xFF00B79B)),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                  ],
                                ),
                              ),

                              Container(
                                padding: const EdgeInsets.all(5),
                                width: MediaQuery.of(context).size.width * 0.84,
                                height:
                                MediaQuery.of(context).size.height * 0.12,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.blue.withOpacity(0.1),
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.confirmation_number,
                                        size: 30, // Adjust the size as needed
                                        color: Color(0xFF00B79B),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "₹ ${eventDetailsList[0].fPrice}",
                                          style: const TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        const Text(
                                          "Seating is on a \nfirst come first serve",
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              Divider(color: Colors.grey.shade300,),
                              const Text(
                                "About Event",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(eventDetailsList[0].eInfo),
                              const SizedBox(height: 10),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                          context: context,
                                          builder: (BuildContext context) {
                                            int numberOfSeats = 1; // Initial number of seats
                                            num totalPrice = numberOfSeats * int.parse(eventDetailsList[0].fPrice); // Initial total price
                                            return StatefulBuilder(
                                              builder: (BuildContext context, StateSetter setState) {
                                                return Container(
                                                  padding: const EdgeInsets.only(
                                                    left: 16.0,
                                                    right: 16.0,
                                                    bottom: 16.0,
                                                    top: 5.0,
                                                  ),
                                                  child: Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      SizedBox(
                                                        width: 50, // Set the desired width here
                                                        child:Divider(
                                                          color: Colors.grey.shade700, // Darker color
                                                          height: 2, // Set the height of the divider
                                                        )
                                                      ),
                                                      const SizedBox(height: 10),
                                                      const Text(
                                                        'Book Event',
                                                        style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w500),
                                                      ),
                                                      const SizedBox(height: 5),
                                                      Divider(color: Colors.grey.shade300,),
                                                      const SizedBox(height: 5),
                                                      const Text(
                                                        'Choose number of seats:',
                                                        style: TextStyle(fontSize: 18.0),
                                                      ),
                                                      const SizedBox(height: 10),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          OutlinedButton(
                                                            onPressed: () {
                                                              setState(() {
                                                                if (numberOfSeats > 1) {
                                                                  numberOfSeats--;
                                                                  totalPrice = numberOfSeats * int.parse(eventDetailsList[0].fPrice);
                                                                }
                                                              });
                                                            },
                                                            style: OutlinedButton.styleFrom(
                                                              shape: const CircleBorder(),
                                                              side: const BorderSide(color: Color(0xFF00B79B)),
                                                            ),
                                                            child: const Icon(
                                                              Icons.remove,
                                                              color: Color(0xFF00B79B),
                                                            ),
                                                          ),
                                                          const SizedBox(width: 20),
                                                          Text(
                                                            '$numberOfSeats',
                                                            style: const TextStyle(fontSize: 25.0),
                                                          ),
                                                          const SizedBox(width: 20),
                                                          OutlinedButton(
                                                            onPressed: () {
                                                              setState(() {
                                                                numberOfSeats++;
                                                                totalPrice = numberOfSeats * int.parse(eventDetailsList[0].fPrice);
                                                              });
                                                            },
                                                            style: OutlinedButton.styleFrom(
                                                              shape: const CircleBorder(),
                                                              side: const BorderSide(color: Color(0xFF00B79B)),
                                                            ),
                                                            child: const Icon(
                                                              Icons.add,
                                                              color: Color(0xFF00B79B),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(height: 40.0),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child: ElevatedButton(
                                                              onPressed: () {
                                                                Navigator.pushNamed(
                                                                  context,
                                                                  'bookevent',
                                                                  arguments: {
                                                                    'eventId': eventDetailsList[0].eId,
                                                                    'numberOfSeats': numberOfSeats// your another argument value,
                                                                  },
                                                                  // Pass event ID as an argument
                                                                );// Handle payment logic here
                                                              },
                                                              style: ButtonStyle(
                                                                backgroundColor: MaterialStateProperty.all(const Color(0xFF00B79B)),
                                                              ),
                                                              child: Text(
                                                                "Continue - ₹$totalPrice",
                                                                style: const TextStyle(color: Colors.white, fontSize: 18),
                                                              ),
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
                                        backgroundColor: MaterialStateProperty.all(const Color(0xFF00B79B)),
                                      ),
                                      child: const Text(
                                        "Book Event",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                ],
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),

                        ),
                      ],
                    ),

                  );

                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
