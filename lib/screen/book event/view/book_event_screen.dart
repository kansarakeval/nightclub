import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  late String name = '';
  late String uID = '';
  late String uContactno = '';
  late String uEmail = '';
  final Apicall api = Apicall();
  late Future<List<Eventdetail>> _eventDetailsFuture;
  late List<PaymentItem> _paymentItems;
  late final Future<PaymentConfiguration> _googlePayConfigFuture;

  @override
  void initState() {
    super.initState();
    _loadData();
    _googlePayConfigFuture =
        PaymentConfiguration.fromAsset('pay/default_google_pay_config.json');
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
            Column(
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
                      final List<Eventdetail> eventDetailsList = snapshot.data!;
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.95,
                              height: MediaQuery.of(context).size.height * 0.18,
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: Image.network(
                                            "${Apicall.imgUrl}event/${eventDetailsList[0].ePoster}",
                                            height: 100,
                                            width: 100,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              eventDetailsList[0].eName,
                                              style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            const SizedBox(height: 5),
                                            Text(
                                              '${DateFormat('E, MMM dd').format(DateTime.parse(eventDetailsList[0].eDate))} - ${DateFormat('hh:mm a').format(DateFormat('HH:mm:ss').parse(eventDetailsList[0].eTime))}',
                                              style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFF00B79B),
                                              ),
                                            ),
                                            const SizedBox(height: 5),
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.location_on_rounded,
                                                  size: 18,
                                                  color: Color(0xFF00B79B),
                                                ),
                                                SizedBox(
                                                  width: 140,
                                                  child: Text(
                                                    '${eventDetailsList[0].location}, ${eventDetailsList[0].lAddress}',
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                      fontSize: 15,
                                                      color: Color(0x7100B79B),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            Container(
                              width: MediaQuery.of(context).size.width * 0.95,
                              height: MediaQuery.of(context).size.height * 0.18,
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
                                          const Text("Full Name"),
                                          Text(name),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text("Contact No"),
                                          Text(uContactno),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text("Email"),
                                          Text(uEmail),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            Container(
                              width: MediaQuery.of(context).size.width * 0.95,
                              height: MediaQuery.of(context).size.height * 0.18,
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
                                          const Text("seat Price"),
                                          Text(
                                              "₹ ${eventDetailsList[0].fPrice}"),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text("Booking Seat"),
                                          Text(numberOfSeats.toString()),
                                        ],
                                      ),
                                      Divider(
                                        color: Colors.grey.shade700,
                                        height: 2,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text("Total"),
                                          Text(
                                              "₹ ${(int.parse(eventDetailsList[0].fPrice) * numberOfSeats).toString()}"),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                          context,
                                          'pay',
                                          arguments: {
                                            'eventId': eventDetailsList[0].eId,
                                            'numberOfSeats': numberOfSeats,
                                          },
                                        );
                                      },
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                          const Color(0xFF00B79B),
                                        ),
                                      ),
                                      child: const Text(
                                        "Pay Now",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: FutureBuilder<PaymentConfiguration>(
                                        future: _googlePayConfigFuture,
                                        builder: (context, snapshot) => snapshot
                                                .hasData
                                            ? GooglePayButton(
                                                paymentConfiguration:
                                                    snapshot.data!,
                                                paymentItems: _paymentItems,
                                                type: GooglePayButtonType.buy,
                                                margin: const EdgeInsets.only(
                                                    top: 15.0),
                                                onPaymentResult:
                                                    onGooglePayResult,
                                                loadingIndicator: const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                ),
                                              )
                                            : const SizedBox.shrink()),
                                  ),
                                ],
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: ApplePayButton(
                                      paymentConfiguration:
                                          PaymentConfiguration.fromJsonString(
                                              payment_configurations
                                                  .defaultApplePay),
                                      paymentItems: _paymentItems = [
                                        PaymentItem(
                                          label: 'Total',
                                          amount:
                                              "₹ ${(int.parse(eventDetailsList[0].fPrice) * numberOfSeats).toString()}",
                                          status: PaymentItemStatus.final_price,
                                        )
                                      ],
                                      style: ApplePayButtonStyle.black,
                                      type: ApplePayButtonType.buy,
                                      margin: const EdgeInsets.only(top: 15.0),
                                      onPaymentResult: onApplePayResult,
                                      loadingIndicator: const Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    ),
                                  ),
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

          ],

        ),
      ),
    );
  }
}
