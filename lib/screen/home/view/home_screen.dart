import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nightclub/models/event.dart';
import 'package:nightclub/services/api_call.dart';
import '../../../models/cat.dart';
import '../../../widget/home_event_widget.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String name = '';
  late String uprofile = '';
  late String uID = '';
  late String timeOfDay = '';
  late String search = '';
  int? selectedCategoryId;

  final Apicall api = Apicall();
  late Future<List<Category>> _categoryFuture;
  List<Event> eventlist = <Event>[];
  List<Event> filteredEvents = [];

  @override
  void initState() {
    super.initState();
    _categoryFuture = api.fetchCategories();
    _loadData();
    filteredEvents.addAll(eventlist);
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
      uID = prefs.getString('uID') ?? '';
      uprofile = prefs.getString('uProfile') ?? '';
    });
    await _loadList();
  }

  Future<void> _loadList() async {
    try {
      final events = await api.getEvent(uID);
      setState(() {
        eventlist = events;
      });
    } catch (error) {
      print('Error loading events: $error');
    }
  }

  void _filterEvents(String searchText) {
    filteredEvents.clear();
    search = searchText;
    if (searchText.isEmpty) {
      filteredEvents.addAll(eventlist);
    } else {
      filteredEvents.addAll(eventlist.where((event) =>
          event.e_name.toLowerCase().contains(searchText.toLowerCase())));
      filteredEvents.addAll(eventlist.where((event) =>
          event.location.toLowerCase().contains(searchText.toLowerCase())));
      filteredEvents.addAll(eventlist.where((event) =>
          event.l_address.toLowerCase().contains(searchText.toLowerCase())));
      // print(filteredEvents);
    }
    setState(() {});
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
                      CircleAvatar(
                        radius: 23,
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage(
                          "${Apicall.imgUrl}profile/$uprofile",
                        ),
                        onBackgroundImageError: (exception, stackTrace) {
                          // Handle the error gracefully
                          print('Error loading profile image: $exception');
                          // You can replace the CircleAvatar with a placeholder image or display a default image
                        },
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
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
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 23,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
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
                  SearchBar(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    leading: const Icon(Icons.search),
                    hintText: "Search",
                    onChanged: _filterEvents,
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
                        return const Center(
                          child: Text("Connection Error"),
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
                                child: const Text("All"),
                              ),
                              const SizedBox(width: 5),
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
                              }),
                            ],
                          ),
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: search.isNotEmpty
                        ? _buildEventList(context, filteredEvents)
                        : ListView.builder(
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
                                            arguments: eventlist[index].e_id,
                                          );
                                        },
                                        child: HomeEventContainer(
                                          img:
                                              "${Apicall.imgUrl}event/${eventlist[index].e_poster}",
                                          title: eventlist[index].e_name,
                                          date:
                                              '${DateFormat('E, MMM dd').format(DateTime.parse(eventlist[index].e_date))} - ${DateFormat('hh:mm a').format(DateFormat('HH:mm:ss').parse(eventlist[index].e_time))}',
                                          loc:
                                              '${eventlist[index].location},${eventlist[index].l_address}',
                                          eid: eventlist[index].e_id,
                                          wis: eventlist[index].in_wishlist,
                                          api: api,
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                    ],
                                  );
                              } else if (selectedCategoryId == null &&
                                  eventlist.isNotEmpty) {
                                return Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                          context,
                                          'eventdetail',
                                          arguments: eventlist[index].e_id,
                                        );
                                      },
                                      child: HomeEventContainer(
                                        img:
                                            "${Apicall.imgUrl}event/${eventlist[index].e_poster}",
                                        title: eventlist[index].e_name,
                                        date:
                                            '${DateFormat('E, MMM dd').format(DateTime.parse(eventlist[index].e_date))} - ${DateFormat('hh:mm a').format(DateFormat('HH:mm:ss').parse(eventlist[index].e_time))}',
                                        loc:
                                            '${eventlist[index].location},${eventlist[index].l_address}',
                                        eid: eventlist[index].e_id,
                                        wis: eventlist[index].in_wishlist,
                                        api: api,
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                  ],
                                );
                              } else if (eventlist.isEmpty) {
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
                                        "No Data Found",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            },
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

Widget _buildEventList(BuildContext context, List<Event> events) {
  final Apicall api = Apicall();
  return SizedBox(
    height: MediaQuery.of(context).size.height * 0.50,
    child: ListView.builder(
      itemCount: events.isEmpty ? 1 : events.length,
      itemBuilder: (BuildContext context, int index) {
        if (events.isEmpty) {
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
                  "No Data Found",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          );
        } else {
          return Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    'eventdetail',
                    arguments: events[index].e_id,
                  );
                },
                child: HomeEventContainer(
                  img: "${Apicall.imgUrl}event/${events[index].e_poster}",
                  title: events[index].e_name,
                  date:
                      '${DateFormat('E, MMM dd').format(DateTime.parse(events[index].e_date))} - ${DateFormat('hh:mm a').format(DateFormat('HH:mm:ss').parse(events[index].e_time))}',
                  loc: '${events[index].location},${events[index].l_address}',
                  eid: events[index].e_id,
                  wis: events[index].in_wishlist,
                  api: api,
                ),
              ),
              const SizedBox(height: 20),
            ],
          );
        }
      },
    ),
  );
}
