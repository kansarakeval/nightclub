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
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ],
                      ),
                      Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.notifications_rounded,
                            color: Colors.white,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SearchBar(
                      leading: Icon(Icons.search),
                      hintText: "Search",
                      trailing: [Icon(Icons.tune)]),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.90,
                    height: MediaQuery.sizeOf(context).height * 0.50,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(5)),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Image.asset(
                                "assets/img/singer1.jpg",
                                height: 230,
                              ),
                              Container(
                                height: 44,
                                width: MediaQuery.sizeOf(context).width*0.84,
                                padding: const EdgeInsets.only(left: 20),
                                decoration: BoxDecoration(
                                    color: Colors.blue.withOpacity(0.2),
                                    borderRadius: const BorderRadius.only(
                                        bottomRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10))),
                                child: const Row(
                                  children: [
                                    Icon(Icons.thumb_up_alt_outlined,color: Colors.white,size: 17,),
                                    SizedBox(width: 10,),
                                    Text("231",style: TextStyle(color: Colors.white,fontSize: 13),),
                                    SizedBox(width: 20,),
                                    Icon(Icons.comment_outlined,color: Colors.white,size: 17,),
                                    SizedBox(width: 10,),
                                    Text("441",style: TextStyle(color: Colors.white,fontSize: 13),),
                                    SizedBox(width: 20,),
                                    Icon(Icons.share_outlined,color: Colors.white,size: 17,),
                                    SizedBox(width: 10,),
                                    Text("631",style: TextStyle(color: Colors.white,fontSize: 13),),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
