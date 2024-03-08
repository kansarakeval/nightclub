import 'package:flutter/material.dart';
import 'package:nightclub/widget/home_event_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nightclub/models/event.dart';
import 'package:nightclub/services/api_call.dart';

// class EventsScreen extends StatefulWidget {
//   const EventsScreen({super.key});
//
//   @override
//   State<EventsScreen> createState() => _EventsScreenState();
// }
//
// class _EventsScreenState extends State<EventsScreen> {
//   final Apicall api = Apicall();
//   List<Event> eventlist = <Event>[];
//   @override
//   void initState() {
//     // super.initState();
//     // _loadData();
//     _loadList(); // Call method to load data when the widget initializes
//   }
//
//   Future _loadList() {
//     // Future<List<Category>> futureCases = api.getCategory();
//     Future<List<Event>> futureCases1 = api.getEvent();
//     futureCases1.then((HomeScreen) {
//       setState(() {
//         // this.categorylist = HomeScreen;
//         eventlist = HomeScreen;
//         // print(this.categorylist);
//         print(eventlist);
//       });
//     });
//     return futureCases1;
//   }
//
//   // void _loadData() async {
//   //   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //   setState(() {
//   //     name = prefs.getString(
//   //         'name')!; // Get value with key 'key', defaulting to 0 if not found
//   //   });
//   // }
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Stack(
//           children: [
//             Container(
//               height: MediaQuery.sizeOf(context).height,
//               width: MediaQuery.sizeOf(context).width,
//               color: Colors.white,
//             ),
//             Container(
//               height: MediaQuery.sizeOf(context).height * 0.40,
//               width: MediaQuery.sizeOf(context).width,
//               decoration: const BoxDecoration(
//                 color: Color(0xFF00B79B),
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(20),
//                   bottomRight: Radius.circular(20),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(10),
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         IconButton(
//                             onPressed: () {
//                               Navigator.pop(context);
//                             },
//                             icon: const Icon(
//                               Icons.arrow_back,
//                               color: Colors.white,
//                             )),
//                         const SizedBox(
//                           width: 10,
//                         ),
//                         const Text(
//                           "Event",
//                           style: TextStyle(fontSize: 25, color: Colors.white),
//                         )
//                       ],
//                     ),
//                     const SizedBox(height: 10),
//
//                     SizedBox(
//                       height: 400, // Set the height according to your requirements
//                       child: Column(
//                         children: [
//                           Expanded(
//                             child: ListView.builder(
//                                 itemCount: eventlist == null ? 0 : eventlist.length,
//                                 itemBuilder: (BuildContext context, int index) {
//                                   return HomeEventContainer(
//                                     img:  Apicall.imgUrl+"/"+ eventlist[index].e_poster,
//                                     title: eventlist[index].e_name,
//                                     text: eventlist[index].l_id,
//                                     des:
//                                     eventlist[index].e_info,
//                                   );
//                                 }
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//
//                     //first
//
//                     const SizedBox(height: 10),
//
//                     // //second
//                     // HomeEventContainer(
//                     //   img: "assets/img/fun.jpg",
//                     //   title: "Fun and Comedy",
//                     //   text: "London",
//                     //   des:
//                     //       "To greatly frustrate someone. To drive\n someone crazy, insane, bonkers,or bananas.",
//                     // ),
//                     // const SizedBox(height: 10),
//                     //
//                     // //third
//                     // HomeEventContainer(
//                     //   img: "assets/img/build.jpg",
//                     //   title: "Build Yourself",
//                     //   text: "Mumbai",
//                     //   des:
//                     //       "A person who does not speak a great deal,\n someone who talks with as few words as possible.",
//                     // ),
//                     // const SizedBox(height: 10),
//                     //
//                     // //4
//                     // HomeEventContainer(
//                     //   img: "assets/img/e4.jpg",
//                     //   title: "Trending Online",
//                     //   text: "Paris",
//                     //   des:
//                     //       "Someone who is beating around the bush is someone who avoids the main point.",
//                     // ),
//                     // const SizedBox(height: 10),
//                     //
//                     // //5
//                     // HomeEventContainer(
//                     //   img: "assets/img/e5.jpg",
//                     //   title: "Acting Workshops",
//                     //   text: "Bangalore",
//                     //   des:
//                     //       "Its useless to worry about things that already happened and cannot be changed.",
//                     // ),
//                     // const SizedBox(height: 10),
//                     //
//                     // //6
//                     // HomeEventContainer(
//                     //   img: "assets/img/e6.jpg",
//                     //   title: "Marketing in style",
//                     //   text: "Moscow",
//                     //   des:
//                     //       "Something that occurs too early before preparations are ready. Starting too soon.",
//                     // ),
//                     // const SizedBox(height: 10),
//                     //
//                     // //7
//                     // HomeEventContainer(
//                     //   img: "assets/img/e7.jpg",
//                     //   title: "Fit and Healthy",
//                     //   text: "Dubai",
//                     //   des:
//                     //       "Typically said to indicate that any further investigation into a situation may lead to harm.",
//                     // ),
//                     // const SizedBox(height: 10),
//                     //
//                     // //8
//                     // HomeEventContainer(
//                     //   img: "assets/img/e8.jpg",
//                     //   title: "Online Learning",
//                     //   text: "Tokyo",
//                     //   des:
//                     //       "Getting sincere about something, applying oneself seriously to a job.",
//                     // ),
//                     // const SizedBox(height: 10),
//                     //
//                     // //9
//                     // HomeEventContainer(
//                     //   img: "assets/img/e9.jpg",
//                     //   title: "Art & Creations ",
//                     //   text: "Singapore",
//                     //   des:
//                     //       "To greatly frustrate someone. To drive someone crazy, insane, bonkers, or bananas",
//                     // ),
//                     // const SizedBox(height: 10),
//                     //
//                     // //10
//                     // HomeEventContainer(
//                     //   img: "assets/img/e10.jpg",
//                     //   title: "Being Professional",
//                     //   text: "Los Angeles",
//                     //   des:
//                     //       "Someone I know recently combined Maple Syrup & buttered Popcorn thinking it wouldtaste.",
//                     // ),
//                     // const SizedBox(height: 10),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
class EventsScreen extends StatefulWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  final Apicall api = Apicall();
  List<Event> eventlist = <Event>[];

  @override
  void initState() {
    super.initState();
    _loadList(); // Call method to load data when the widget initializes
  }

  Future<void> _loadList() async {
    try {
      List<Event>? events = await api.getEvent(); // Use nullable list
      print(events);
      if (events != null) { // Check if events is not null
        setState(() {
          eventlist = events;
          // print(eventlist);
          // print("sadasds");
        });
      } else {
        print('Events list is null');
      }
    } catch (e) {
      print('Error loading events: $e');
    }
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
                  Expanded(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.50, // Adjust height as needed
                      child: ListView.builder(
                        itemCount: eventlist.length,
                        itemBuilder: (BuildContext context, int index) {
                          // Access properties with null-aware operators to handle null values
                          return HomeEventContainer(
                            img: Apicall.imgUrl + "event/" + (eventlist[index].e_poster ?? ''),
                            title: eventlist[index].e_name ?? '',
                            date: eventlist[index].e_date+' - '+eventlist[index].e_time  ?? '',
                            loc: eventlist[index].location +
                                ',' +
                                eventlist[index].l_address ??
                                '',
                          );
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

