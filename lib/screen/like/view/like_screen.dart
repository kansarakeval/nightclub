import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
  }

  Future<void> _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      uID = prefs.getString('uID') ?? '';
    });
  }

  void _updatelist() {
    setState(() {
      // print('Fetching wishlist events...');
      _wishlistDetailsFuture = api.fetchwislistEvents(uID);
      _wishlistDetailsFuture.then((value) {
        // print('Wishlist events fetched successfully.');
      }).catchError((error) {
        if (kDebugMode) {
          print('Error fetching wishlist events: $error');
        }
      });
      Navigator.pop(context);
    });
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
                  const SizedBox(height: 10),
                  const Text(
                    "Favorites",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  FutureBuilder<List<wishlist>>(
                    future: _wishlistDetailsFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else {
                        final List<wishlist> wishlistDetailsList =
                            snapshot.data!;
                        if (wishlistDetailsList.isEmpty) {
                          return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Image.asset("assets/img/No data.gif",height: 500,width: 500,),
                              const SizedBox(height:20,),
                              const Text("Empty Whistlist",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),),
                            ],
                          ),
                          );
                        } else {
                          return ListView(
                            shrinkWrap: true,
                            children: List.generate(
                              wishlistDetailsList.length,
                              (index) {
                                return Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.95,
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
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        'eventdetail',
                                        arguments:
                                            wishlistDetailsList[index].eId,
                                      );
                                    },
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: Image.network(
                                            "${Apicall.imgUrl}event/${wishlistDetailsList[index].ePoster}",
                                            height: 100,
                                            width: 100,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                wishlistDetailsList[index]
                                                    .eName,
                                                style: const TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Text(
                                                '${DateFormat('E, MMM dd').format(DateTime.parse(wishlistDetailsList[index].eDate))} - ${DateFormat('hh:mm a').format(DateFormat('HH:mm:ss').parse(wishlistDetailsList[index].eTime))}',
                                                style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xFF00B79B),
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.location_on_rounded,
                                                    size: 18,
                                                    color: Color(0xFF00B79B),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      '${wishlistDetailsList[index].location},${wishlistDetailsList[index].lAddress}',
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: const TextStyle(
                                                          fontSize: 15,
                                                          color: Color(
                                                              0x7100B79B)),
                                                    ),
                                                  ),
                                                  IconButton(
                                                    onPressed: () {
                                                      showModalBottomSheet(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return StatefulBuilder(
                                                            builder: (BuildContext
                                                                    context,
                                                                StateSetter
                                                                    setState) {
                                                              return Container(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                  left: 16.0,
                                                                  right: 16.0,
                                                                  bottom: 16.0,
                                                                  top: 5.0,
                                                                ),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  children: [
                                                                    SizedBox(
                                                                      width: 50,
                                                                      child:
                                                                          Divider(
                                                                        color: Colors
                                                                            .grey
                                                                            .shade700,
                                                                        height:
                                                                            2,
                                                                      ),
                                                                    ),
                                                                    const SizedBox(
                                                                        height:
                                                                            10),
                                                                    const Text(
                                                                      'Remove from Favorites?',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              20.0,
                                                                          fontWeight:
                                                                              FontWeight.w500),
                                                                    ),
                                                                    const SizedBox(
                                                                        height:
                                                                            5),
                                                                    Divider(
                                                                      color: Colors
                                                                          .grey
                                                                          .shade300,
                                                                    ),
                                                                    const SizedBox(
                                                                        height:
                                                                            5),
                                                                    Container(
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width *
                                                                          0.95,
                                                                      padding: const EdgeInsets
                                                                          .all(
                                                                          10),
                                                                      margin: const EdgeInsets
                                                                          .all(
                                                                          10),
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Colors
                                                                            .white,
                                                                        boxShadow: const [
                                                                          BoxShadow(
                                                                            color:
                                                                                Colors.grey,
                                                                            spreadRadius:
                                                                                0.2,
                                                                            blurRadius:
                                                                                2,
                                                                          )
                                                                        ],
                                                                        borderRadius:
                                                                            BorderRadius.circular(25),
                                                                      ),
                                                                      child:
                                                                          InkWell(
                                                                        onTap:
                                                                            () {
                                                                          Navigator
                                                                              .pushNamed(
                                                                            context,
                                                                            'eventdetail',
                                                                            arguments:
                                                                                wishlistDetailsList[index].eId,
                                                                          );
                                                                        },
                                                                        child:
                                                                            Row(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
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
                                                                            Expanded(
                                                                              child: Column(
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Text(
                                                                                    wishlistDetailsList[index].eName,
                                                                                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                                                                                    overflow: TextOverflow.ellipsis,
                                                                                  ),
                                                                                  Text(
                                                                                    '${DateFormat('E, MMM dd').format(DateTime.parse(wishlistDetailsList[index].eDate))} - ${DateFormat('hh:mm a').format(DateFormat('HH:mm:ss').parse(wishlistDetailsList[index].eTime))}',
                                                                                    style: const TextStyle(
                                                                                      fontSize: 15,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      color: Color(0xFF00B79B),
                                                                                    ),
                                                                                    overflow: TextOverflow.ellipsis,
                                                                                  ),
                                                                                  Row(
                                                                                    children: [
                                                                                      const Icon(
                                                                                        Icons.location_on_rounded,
                                                                                        size: 18,
                                                                                        color: Color(0xFF00B79B),
                                                                                      ),
                                                                                      Expanded(
                                                                                        child: Text(
                                                                                          '${wishlistDetailsList[index].location},${wishlistDetailsList[index].lAddress}',
                                                                                          maxLines: 1,
                                                                                          overflow: TextOverflow.ellipsis,
                                                                                          style: const TextStyle(fontSize: 15, color: Color(0x7100B79B)),
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
                                                                    ),
                                                                    const SizedBox(
                                                                        height:
                                                                            5),
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceEvenly,
                                                                      children: [
                                                                        ElevatedButton(
                                                                          onPressed:
                                                                              () {
                                                                            Navigator.pop(context);
                                                                          },
                                                                          style:
                                                                              ButtonStyle(
                                                                            shape:
                                                                                MaterialStateProperty.all(
                                                                              RoundedRectangleBorder(
                                                                                borderRadius: BorderRadius.circular(50),
                                                                                side: const BorderSide(color: Color(0xFF00B79B)),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              const Text(
                                                                            "Cancel",
                                                                            style:
                                                                                TextStyle(color: Color(0xFF00B79B)),
                                                                          ),
                                                                        ),
                                                                        ElevatedButton(
                                                                          onPressed:
                                                                              () async {
                                                                            final response =
                                                                                await api.addToWishlist(uID, wishlistDetailsList[index].eId);
                                                                            if (response.success ==
                                                                                1) {
                                                                              setState(() {
                                                                                _updatelist();
                                                                                // Navigator.pop(context);
                                                                              });
                                                                            } else {
                                                                              // Handle error response
                                                                            }
                                                                          },
                                                                          style:
                                                                              ButtonStyle(
                                                                            backgroundColor:
                                                                                MaterialStateProperty.all(const Color(0xFF00B79B)),
                                                                          ),
                                                                          child: const Text(
                                                                              "Yes, Remove",
                                                                              style: TextStyle(color: Colors.white)),
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
                                                    icon: const Icon(
                                                        Icons.favorite_rounded,
                                                        color:
                                                            Color(0xFF00B79B)),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
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
          ],
        ),
      ),
    );
  }
}
