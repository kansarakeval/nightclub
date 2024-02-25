import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nightclub/screen/home/provider/home_provider.dart';
import 'package:nightclub/widget/home_event_widget.dart';
import 'package:nightclub/widget/people_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? providerr;
  HomeProvider? providerw;

  @override
  Widget build(BuildContext context) {
    providerr = context.read<HomeProvider>();
    providerw = context.watch<HomeProvider>();
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
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "keval...!",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                            Text(
                              "Good Morning",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ],
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'setting');
                            },
                            icon: const Icon(
                              Icons.settings_outlined,
                              color: Colors.white,
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SearchBar(
                      backgroundColor: MaterialStatePropertyAll(Colors.white),
                      leading: Icon(Icons.search),
                      hintText: "Search",
                      trailing: [
                        Icon(Icons.tune),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    //first
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, 'eventdetail');
                      },
                      child: HomeEventContainer(
                        img: "assets/img/singer1.jpg",
                        title: "Lifestyle trends",
                        text: "New York",
                        des:
                            "Someone who is not witly or sharp, but rather,\n they are ignorant unintelligent, or senseless.",
                      ),
                    ),
                    const SizedBox(height: 10),

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

                    //theme
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.90,
                      height: MediaQuery.sizeOf(context).height * 0.28,
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text("Light or Dark mode",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold)),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "This app comes can be used in light and dark\n mode as per your requirements",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color(0xFF00B79B)),
                                ),
                                child: const Text(
                                  "Light Mode",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color(0xFF00B79B)),
                                ),
                                child: const Text(
                                  "Dark Mode",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    SizedBox(
                      height: MediaQuery.sizeOf(context).height,
                      child: MasonryGridView.builder(
                        gridDelegate:
                        const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        itemCount: providerr!.gridList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8)),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset(
                                        '${providerr!.gridList[index].img}'),
                                  ),
                                  Text(
                                    '${providerr!.gridList[index].title}',
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 20,fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '${providerr!.gridList[index].events}',
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    '${providerr!.gridList[index].des}',
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    //people
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.90,
                      height: MediaQuery.sizeOf(context).height * 0.45,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 0.2,
                                blurRadius: 2)
                          ],
                          borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "People",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 25),
                              ),
                              Text(
                                "View All",
                                style: TextStyle(fontSize: 15),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                PeopleWidget(
                                    img: "assets/singerimg/3.png",
                                    name: "Juliet Wykes",
                                    qualification: "Senior Designer"),
                                const SizedBox(width: 20),
                                PeopleWidget(
                                    img: "assets/singerimg/4.png",
                                    name: "Dag Curner",
                                    qualification: "Manager"),
                                const SizedBox(width: 20),
                                PeopleWidget(
                                    img: "assets/singerimg/9.png",
                                    name: "Grove stark",
                                    qualification: "Ux/Manager"),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
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
