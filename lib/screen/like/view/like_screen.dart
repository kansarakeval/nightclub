import 'package:flutter/material.dart';
// Import corrected

import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

import '../../../models/wishlist.dart';
import '../../../services/api_call.dart';

class LikeScreen extends StatefulWidget {
  const LikeScreen({super.key});

  @override
  State<LikeScreen> createState() => _LikeScreenState();
}

class _LikeScreenState extends State<LikeScreen> {
  final Apicall api = Apicall();
  late Future<List<wishlist>> _wishlistDetailsFuture;
  late String uID = '';

  @override
  void initState() {
    super.initState();
    _loadData();
    _loadlist();
  }

  Future<void> _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      uID = prefs.getString('uID') ?? '';
    });
  }

  Future<void> _loadlist() async {
    _wishlistDetailsFuture = api.fetchwislistEvents(uID);
  }

  @override
  Widget build(BuildContext context) {
    _wishlistDetailsFuture = api.fetchwislistEvents(uID);
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
                  const SizedBox(height: 15),
                  const Text(
                    "Favorites",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  FutureBuilder<List<wishlist>>(
                    future: _wishlistDetailsFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(
                            child: Text('Error: ${snapshot.error}'));
                      } else {
                        final List<wishlist> wishlistDetailsList =
                        snapshot.data!;
                        return SizedBox(
                          height: MediaQuery.of(context).size.height * 0.9,
                          child: ListView.builder(
                            itemCount: wishlistDetailsList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
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
                                child: Center( // Wrap the content with Center widget
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center, // Center the children vertically
                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(
                                            context,
                                            'eventdetail',
                                            arguments: wishlistDetailsList[index].eId,
                                          );
                                        },
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(15),
                                              child: Image.network(
                                                "${Apicall.imgUrl}event/${wishlistDetailsList[index].ePoster}",
                                                height: 100,
                                                width: 100,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            const SizedBox(width: 10),

                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  wishlistDetailsList[index].eName,
                                                  style: const TextStyle(
                                                      fontSize: 20, fontWeight: FontWeight.w500),
                                                ),
                                                Text(
                                                  '${DateFormat('E, MMM dd').format(DateTime.parse(wishlistDetailsList[index].eDate))} - ${DateFormat('hh:mm a').format(DateFormat('HH:mm:ss').parse(wishlistDetailsList[index].eTime))}',
                                                  style: const TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xFF00B79B),
                                                  ),
                                                ),
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
                                                        '${wishlistDetailsList[index].location},${wishlistDetailsList[index].lAddress}',
                                                        maxLines: 1,
                                                        overflow: TextOverflow.ellipsis,
                                                        style: const TextStyle(
                                                          fontSize: 15,
                                                          color: Color(0x7100B79B),
                                                        ),
                                                      ),
                                                    ),
                                                    IconButton(
                                                      onPressed: () async {
                                                        final response = await api.addToWishlist(
                                                            uID, wishlistDetailsList[index].eId);
                                                        if (response.success == 1) {
                                                          setState(() {
                                                            _loadlist();
                                                          });
                                                        } else {
                                                          // Handle error response
                                                        }
                                                      },
                                                      icon: const Icon(Icons.favorite_rounded,
                                                          color: Color(0xFF00B79B)),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );

                            },
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
