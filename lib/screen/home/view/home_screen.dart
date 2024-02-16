import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                color: Colors.blue.shade800,
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
                        radius: 30,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage("assets/img/logo.png"),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Good Morning",
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                          ),
                          Text(
                            "Good Morning",
                            style: TextStyle(fontSize: 20,color: Colors.white),
                          ),
                        ],
                      ),
                      Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.notifications_rounded,color: Colors.white,))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SearchBar(
                      leading: Icon(Icons.search),
                      hintText: "Search",
                      trailing: [Icon(Icons.tune)]),
                  SizedBox(height: 10,),
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height*0.40,
                    color: Colors.red,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
