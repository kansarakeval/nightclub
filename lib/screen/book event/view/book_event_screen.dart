import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../models/bookevent.dart';
import '../../../models/eventdetails.dart';
import '../../../services/api_call.dart';
import 'package:intl/intl.dart';
import 'package:pay/pay.dart';
import 'payment_configurations.dart' as payment_configurations;

class BookEventScreen extends StatefulWidget {
  const BookEventScreen({super.key});

  @override
  State<BookEventScreen> createState() => _BookEventScreenState();
}

class _BookEventScreenState extends State<BookEventScreen> {
  late String eventId = '';
  late int numberOfSeats = 0;
  late int t_price = 0;
  late String name = '';
  late String uID = '';
  late String uContactno = '';
  late String uEmail = '';
  final Apicall api = Apicall();
  late Future<List<Eventdetail>> _eventDetailsFuture;
  List<PaymentItem>? _paymentItems;
  late final Future<PaymentConfiguration> _googlePayConfigFuture;

  @override
  void initState() {
    super.initState();
    _googlePayConfigFuture =
        PaymentConfiguration.fromAsset('pay/default_google_pay_config.json');
    _loadData();
  }

  Future<void> _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name') ?? '';
      uID = prefs.getString('uID') ?? '';
      uEmail = prefs.getString('uEmail') ?? '';
      uContactno = prefs.getString('uContactno') ?? '';
    });
  }

  void onGooglePayResult(paymentResult) {
    debugPrint(paymentResult.toString());
    api.Createbookevent(Bookevent(
      u_id: uID,
      e_id: eventId,
      total_price: t_price.toString(),
      no_seat: numberOfSeats.toString(),
    )).then((res) async {
      if (res != "0") {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Success"),
              content: const Text("Your booking Confirmation.."),
              actions: <Widget>[
                TextButton(
                  child: const Text("Close"),
                  onPressed: () {
                    Navigator.pushNamed(context, 'bookdetail', arguments: res.toString());
                  },
                ),
              ],
            );
          },
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Success"),
              content: const Text("Your booking are not Confirmation.."),
              actions: <Widget>[
                TextButton(
                  child: const Text("Close"),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, 'dash');
                  },
                ),
              ],
            );
          },
        );
      }
    });
  }

  void onApplePayResult(paymentResult) {
    debugPrint(paymentResult.toString());
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    if (arguments != null) {
      eventId = arguments['eventId'];
      numberOfSeats = arguments['numberOfSeats'];
    }
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
            SingleChildScrollView(
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
                        "Booking Details",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  FutureBuilder<List<Eventdetail>>(
                    future: _eventDetailsFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else {
                        final List<Eventdetail> eventDetailsList =
                            snapshot.data!;
                        t_price = (int.parse(eventDetailsList[0].fPrice) *
                            numberOfSeats);
                        return SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.95,
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
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.3,
                                      // Adjust the height based on screen width
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            child: Image.network(
                                              "${Apicall.imgUrl}event/${eventDetailsList.isNotEmpty ? eventDetailsList[0].ePoster : 'placeholder_image_url'}",
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.3,
                                              // Adjust the height based on screen width
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.3,
                                              // Adjust the width based on screen width
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              // Align children vertically
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      eventDetailsList
                                                              .isNotEmpty
                                                          ? eventDetailsList[0]
                                                              .eName
                                                          : 'Event Name',
                                                      style: const TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      eventDetailsList
                                                              .isNotEmpty
                                                          ? '${DateFormat('E, MMM dd').format(DateTime.parse(eventDetailsList[0].eDate))} - ${DateFormat('hh:mm a').format(DateFormat('HH:mm:ss').parse(eventDetailsList[0].eTime))}'
                                                          : 'Event Date & Time',
                                                      style: const TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            Color(0xFF00B79B),
                                                      ),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Row(
                                                      children: [
                                                        const Icon(
                                                          Icons
                                                              .location_on_rounded,
                                                          size: 18,
                                                          color:
                                                              Color(0xFF00B79B),
                                                        ),
                                                        Expanded(
                                                          child: Text(
                                                            eventDetailsList
                                                                    .isNotEmpty
                                                                ? '${eventDetailsList[0].location}, ${eventDetailsList[0].lAddress}'
                                                                : 'Event Location',
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            maxLines: 1,
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 15,
                                                              color: Color(
                                                                  0x7100B79B),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Container(
                                width: MediaQuery.of(context).size.width * 0.95,
                                height:
                                    MediaQuery.of(context).size.height * 0.20,
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
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              "Full Name",
                                              style: TextStyle(fontSize: 15),
                                            ),
                                            Text(
                                              name,
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              "Contact No",
                                              style: TextStyle(fontSize: 15),
                                            ),
                                            Text(
                                              uContactno,
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              "Email",
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                            Text(
                                              uEmail,
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.95,
                                height:
                                    MediaQuery.of(context).size.height * 0.20,
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
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text(
                                                "seat Price:",
                                                style: TextStyle(fontSize: 15),
                                              ),
                                              Text(
                                                "₹ ${eventDetailsList.isNotEmpty ? eventDetailsList[0].fPrice : ''}",
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text(
                                                "Booking Seat:",
                                                style: TextStyle(fontSize: 15),
                                              ),
                                              Text(
                                                numberOfSeats.toString(),
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(5),
                                          child: Divider(
                                            color: Colors.grey.shade700,
                                            // Darker color
                                            height:
                                                2, // Set the height of the divider
                                          ),
                                        ),
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text(
                                                "Total:",
                                                style: TextStyle(fontSize: 15),
                                              ),
                                              Text(
                                                "₹ ${t_price.toString()}",
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                              // Padding(
                              //   padding: const EdgeInsets.all(10),
                              //   child: Row(
                              //     mainAxisAlignment:
                              //         MainAxisAlignment.spaceBetween,
                              //     children: [
                              //       Expanded(
                              //         child: ElevatedButton(
                              //           onPressed: () async {
                              //             Navigator.pushNamed(
                              //                         context, 'pay');
                              //             // api.Createbookevent(Bookevent(
                              //             //   u_id: uID,
                              //             //   e_id: eventDetailsList[0].eId,
                              //             //   total_price: (int.parse(
                              //             //               eventDetailsList[0]
                              //             //                   .fPrice) *
                              //             //           numberOfSeats)
                              //             //       .toString(),
                              //             //   no_seat: numberOfSeats.toString(),
                              //             // )).then((res) async {
                              //             //   if (res != "") {
                              //             //     // Navigator.pushReplacementNamed(context, 'dash');
                              //             //     Navigator.pushNamed(
                              //             //         context, 'bookdetail',
                              //             //         arguments: res.toString());
                              //             //   } else {}
                              //             // });
                              //           },
                              //           style: ButtonStyle(
                              //             backgroundColor:
                              //                 MaterialStateProperty.all(
                              //               const Color(0xFF00B79B),
                              //             ),
                              //           ),
                              //           child: const Text(
                              //             "Pay Now",
                              //             style: TextStyle(
                              //                 color: Colors.white, fontSize: 18),
                              //           ),
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // ),

                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: FutureBuilder<
                                              PaymentConfiguration>(
                                          future: _googlePayConfigFuture,
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.waiting) {
                                              return const Center(
                                                  child:
                                                      CircularProgressIndicator());
                                            } else if (snapshot.hasError) {
                                              return Center(
                                                  child: Text(
                                                      'Error: ${snapshot.error}'));
                                            } else {
                                              final paymentConfiguration =
                                                  snapshot.data!;
                                              return GooglePayButton(
                                                paymentConfiguration:
                                                    paymentConfiguration,
                                                paymentItems: _paymentItems = [
                                                  PaymentItem(
                                                    label: 'Total',
                                                    amount: t_price.toString(),
                                                    status: PaymentItemStatus
                                                        .final_price,
                                                  )
                                                ],
                                                type: GooglePayButtonType.book,
                                                margin: const EdgeInsets.only(
                                                    top: 15.0),
                                                onPaymentResult:
                                                    onGooglePayResult,
                                                loadingIndicator: const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                ),
                                              );
                                            }
                                          }),
                                    ),
                                  ],
                                ),
                              ),

                              ApplePayButton(
                                paymentConfiguration:
                                    PaymentConfiguration.fromJsonString(
                                        payment_configurations.defaultApplePay),
                                paymentItems: _paymentItems = [
                                  PaymentItem(
                                    label: 'Total',
                                    amount: t_price.toString(),
                                    status: PaymentItemStatus.final_price,
                                  )
                                ],
                                style: ApplePayButtonStyle.black,
                                type: ApplePayButtonType.book,
                                margin: const EdgeInsets.only(top: 15.0),
                                onPaymentResult: onApplePayResult,
                                loadingIndicator: const Center(
                                  child: CircularProgressIndicator(),
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
          ],
        ),
      ),
    );
  }
}
