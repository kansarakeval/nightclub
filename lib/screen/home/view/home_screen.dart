import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nightclub/models/event.dart';
import 'package:nightclub/services/api_call.dart';
import '../../../models/cat.dart';
import '../../../widget/home_event_widget.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String name = '';
  late String timeOfDay = '';

  int? selectedCategoryId;

  final Apicall api = Apicall();
  late Future<List<Category>> _categoryFuture;

  List<Event> eventlist = <Event>[];

  @override
  void initState() {
    super.initState();
    _categoryFuture = api.fetchCategories();
    _loadData();
    _loadList();
  }

  Future<void> _loadList() async {
    try {
      final events = await api.getEvent();
      setState(() {
        eventlist = events;
      });
    } catch (error) {
      print('Error loading events: $error');
    }
  }

  Future<void> _loadData() async {
    int currentHour = DateTime.now().hour;
    if (currentHour >= 5 && currentHour < 12) {
      timeOfDay = 'Good Morning';
    } else if (currentHour >= 12 && currentHour < 17) {
      timeOfDay = 'Good Afternoon';
    } else if (currentHour >= 17 && currentHour < 20) {
      timeOfDay = 'Good Evening';
    } else {
      timeOfDay = 'Good Night';
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
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
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage("assets/img/logo.png"),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            timeOfDay,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            name,
                            style: const TextStyle(
                              fontSize: 23,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'notification');
                        },
                        icon: const Icon(
                          Icons.notifications_none,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  const SearchBar(
                    backgroundColor: MaterialStatePropertyAll(Colors.white),
                    leading: Icon(Icons.search),
                    hintText: "Search",
                    trailing: [
                      Icon(Icons.tune),
                    ],
                  ),
                  const SizedBox(height: 10),
                  FutureBuilder<List<Category>>(
                    future: _categoryFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text('Error: ${snapshot.error}'),
                        );
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(
                          child: Text('No categories available'),
                        );
                      } else {
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    selectedCategoryId = null;
                                  });
                                },
                                child: Text("All"),
                              ),
                              SizedBox(width: 5),
                              ...snapshot.data!.map((category) {
                                return Row(
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          selectedCategoryId =
                                              int.parse(category.cId);
                                        });
                                      },
                                      child: Text(category.cName),
                                    ),
                                    const SizedBox(width: 5),
                                  ],
                                );
                              }).toList(),
                            ],
                          ),
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.50,
                      child: ListView.builder(
                        itemCount: eventlist.length,
                        itemBuilder: (BuildContext context, int index) {
                          if (selectedCategoryId != null &&
                              selectedCategoryId ==
                                  int.parse(eventlist[index].c_id)) {
                            return Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      'eventdetail',
                                      arguments: eventlist[index].e_id, // Pass event ID as an argument
                                    );
                                  },
                                  child: HomeEventContainer(
                                    img: "${Apicall.imgUrl}event/${eventlist[index].e_poster ?? ''}",
                                    title: eventlist[index].e_name ?? '',
                                    date: '${DateFormat.MMMd().format(DateTime.parse(eventlist[index].e_date))} - ${DateFormat('hh:mm a').format(DateFormat('HH:mm:ss').parse(eventlist[index].e_time))}' ??
                                        '',
                                    loc: '${eventlist[index].location},${eventlist[index].l_address}' ??
                                        '',
                                  ),
                                ),
                                const SizedBox(height: 10),
                              ],
                            );
                          } else if (selectedCategoryId == null) {
                            return Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      'eventdetail',
                                      arguments: eventlist[index].e_id, // Pass event ID as an argument
                                    );
                                  },
                                  child: HomeEventContainer(
                                    img: "${Apicall.imgUrl}event/${eventlist[index].e_poster ?? ''}",
                                    title: eventlist[index].e_name ?? '',
                                    date: '${DateFormat.MMMd().format(DateTime.parse(eventlist[index].e_date))} - ${DateFormat('hh:mm a').format(DateFormat('HH:mm:ss').parse(eventlist[index].e_time))}' ?? '',
                                    loc: '${eventlist[index].location},${eventlist[index].l_address}' ?? '',
                                  ),
                                ),
                                const SizedBox(height: 10),
                              ],
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
                      ),
                    ),
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
