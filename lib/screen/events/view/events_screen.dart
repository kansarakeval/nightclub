import 'package:flutter/material.dart';
import 'package:nightclub/widget/home_event_widget.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              color: Colors.white,
            ),
            Container(
              height: MediaQuery.sizeOf(context).height * 0.40,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                color: Color(0xFF00B79B),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(onPressed: (){
                          Navigator.popUntil(context, ModalRoute.withName('home'));
                        }, icon: Icon(Icons.arrow_back,color: Colors.white,)),
                        SizedBox(width: 10,),
                        Text("Event",style: TextStyle(fontSize: 25,color: Colors.white),)
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    //first
                    HomeEventContainer(
                      img: "assets/img/singer1.jpg",
                      title: "Lifestyle trends",
                      text: "New York",
                      des:
                      "Someone who is not witly or sharp, but rather,\n they are ignorant unintelligent, or senseless.",
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    //second
                    HomeEventContainer(
                      img: "assets/img/fun.jpg",
                      title: "Fun and Comedy",
                      text: "London",
                      des:
                      "To greatly frustrate someone. To drive\n someone crazy, insane, bonkers,or bananas.",
                    ),
                    const SizedBox(height: 10),

                    //third
                    HomeEventContainer(
                      img: "assets/img/build.jpg",
                      title: "Build Yourself",
                      text: "Mumbai",
                      des:
                      "A person who does not speak a great deal,\n someone who talks with as few words as possible.",
                    ),
                    const SizedBox(height: 10),

                    //4
                    HomeEventContainer(
                      img: "assets/img/e4.jpg",
                      title: "Trending Online",
                      text: "Paris",
                      des:
                      "Someone who is beating around the bush is someone who avoids the main point.",
                    ),
                    const SizedBox(height: 10),

                    //5
                    HomeEventContainer(
                      img: "assets/img/e5.jpg",
                      title: "Acting Workshops",
                      text: "Bangalore",
                      des:
                      "Its useless to worry about things that already happened and cannot be changed.",
                    ),
                    const SizedBox(height: 10),

                    //6
                    HomeEventContainer(
                      img: "assets/img/e6.jpg",
                      title: "Marketing in style",
                      text: "Moscow",
                      des:
                      "Something that occurs too early before preparations are ready. Starting too soon.",
                    ),
                    const SizedBox(height: 10),

                    //7
                    HomeEventContainer(
                      img: "assets/img/e7.jpg",
                      title: "Fit and Healthy",
                      text: "Dubai",
                      des:
                      "Typically said to indicate that any further investigation into a situation may lead to harm.",
                    ),
                    const SizedBox(height: 10),

                    //8
                    HomeEventContainer(
                      img: "assets/img/e8.jpg",
                      title: "Online Learning",
                      text: "Tokyo",
                      des:
                      "Getting sincere about something, applying oneself seriously to a job.",
                    ),
                    const SizedBox(height: 10),

                    //9
                    HomeEventContainer(
                      img: "assets/img/e9.jpg",
                      title: "Art & Creations ",
                      text: "Singapore",
                      des:
                      "To greatly frustrate someone. To drive someone crazy, insane, bonkers, or bananas",
                    ),
                    const SizedBox(height: 10),

                    //10
                    HomeEventContainer(
                      img: "assets/img/e10.jpg",
                      title: "Being Professional",
                      text: "Los Angeles",
                      des:
                      "Someone I know recently combined Maple Syrup & buttered Popcorn thinking it wouldtaste.",
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
