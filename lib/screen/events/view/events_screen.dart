import 'package:flutter/material.dart';

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
                color: Colors.blue.shade800,
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(onPressed: (){
                          Navigator.popUntil(context, ModalRoute.withName('home'));
                        }, icon: Icon(Icons.arrow_back,color: Colors.white,)),
                        SizedBox(width: 10,),
                        Text("Event",style: TextStyle(fontSize: 25,color: Colors.white),textAlign: TextAlign.center,)
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    //first
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.90,
                      height: MediaQuery.sizeOf(context).height * 0.75,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Image.asset(
                                    "assets/img/singer1.jpg",
                                    height: 230,
                                    fit: BoxFit.cover,
                                  ),
                                  Container(
                                    height: 44,
                                    width:
                                    MediaQuery.sizeOf(context).width * 0.84,
                                    padding: const EdgeInsets.only(left: 20),
                                    decoration: BoxDecoration(
                                      color: Colors.blue.withOpacity(0.2),
                                      borderRadius: const BorderRadius.only(
                                        bottomRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                      ),
                                    ),
                                    child: const Row(
                                      children: [
                                        Icon(
                                          Icons.thumb_up_alt_outlined,
                                          color: Colors.white,
                                          size: 17,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "231",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Icon(
                                          Icons.comment_outlined,
                                          color: Colors.white,
                                          size: 17,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "441",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Icon(
                                          Icons.share_outlined,
                                          color: Colors.white,
                                          size: 17,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "631",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Lifestyle trends",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const Text(
                                "New York",
                              ),
                              const Spacer(),
                              Icon(
                                Icons.star,
                                color: Colors.blue.shade800,
                                size: 18,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.blue.shade800,
                                size: 18,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.blue.shade800,
                                size: 18,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.blue.shade800,
                                size: 18,
                              ),
                              Icon(
                                Icons.star_half,
                                color: Colors.blue.shade800,
                                size: 18,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    "assets/singerimg/1.png",
                                    height: 50,
                                    fit: BoxFit.cover,
                                  )),
                              const SizedBox(
                                width: 10,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  "assets/singerimg/2.png",
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    "assets/singerimg/3.png",
                                    height: 50,
                                    fit: BoxFit.cover,
                                  )),
                              const SizedBox(
                                width: 10,
                              ),
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    "assets/singerimg/4.png",
                                    height: 50,
                                    fit: BoxFit.cover,
                                  )),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "+8 more",
                                style: TextStyle(fontSize: 15),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Someone who is not witly or sharp, but rather,\n they are ignorant unintelligent, or senseless.",
                            style: TextStyle(fontSize: 15),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.blue.shade200),
                                ),
                                child: const Text(
                                  "Book",
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
                                      Colors.blue.shade600),
                                ),
                                child: const Text(
                                  "Invite",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "View Gallery",
                                style: TextStyle(fontSize: 15),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    //second
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.90,
                      height: MediaQuery.sizeOf(context).height * 0.75,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Image.asset(
                                    "assets/img/fun.jpg",
                                    height: 230,
                                    fit: BoxFit.cover,
                                  ),
                                  Container(
                                    height: 44,
                                    width:
                                    MediaQuery.sizeOf(context).width * 0.84,
                                    padding: const EdgeInsets.only(left: 20),
                                    decoration: BoxDecoration(
                                      color: Colors.blue.withOpacity(0.2),
                                      borderRadius: const BorderRadius.only(
                                        bottomRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                      ),
                                    ),
                                    child: const Row(
                                      children: [
                                        Icon(
                                          Icons.thumb_up_alt_outlined,
                                          color: Colors.white,
                                          size: 17,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "231",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Icon(
                                          Icons.comment_outlined,
                                          color: Colors.white,
                                          size: 17,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "441",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Icon(
                                          Icons.share_outlined,
                                          color: Colors.white,
                                          size: 17,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "631",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Fun and Comedy",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const Text(
                                "New York",
                              ),
                              const Spacer(),
                              Icon(
                                Icons.star,
                                color: Colors.blue.shade800,
                                size: 18,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.blue.shade800,
                                size: 18,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.blue.shade800,
                                size: 18,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.blue.shade800,
                                size: 18,
                              ),
                              Icon(
                                Icons.star_half,
                                color: Colors.blue.shade800,
                                size: 18,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    "assets/singerimg/1.png",
                                    height: 50,
                                    fit: BoxFit.cover,
                                  )),
                              const SizedBox(
                                width: 10,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  "assets/singerimg/2.png",
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    "assets/singerimg/3.png",
                                    height: 50,
                                    fit: BoxFit.cover,
                                  )),
                              const SizedBox(
                                width: 10,
                              ),
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    "assets/singerimg/4.png",
                                    height: 50,
                                    fit: BoxFit.cover,
                                  )),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "+8 more",
                                style: TextStyle(fontSize: 15),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Someone who is not witly or sharp, but rather,\n they are ignorant unintelligent, or senseless.",
                            style: TextStyle(fontSize: 15),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.blue.shade200),
                                ),
                                child: const Text(
                                  "Book",
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
                                      Colors.blue.shade600),
                                ),
                                child: const Text(
                                  "Invite",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "View Gallery",
                                style: TextStyle(fontSize: 15),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    //third
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.90,
                      height: MediaQuery.sizeOf(context).height * 0.75,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Image.asset(
                                    "assets/img/build.jpg",
                                    height: 230,
                                    fit: BoxFit.cover,
                                  ),
                                  Container(
                                    height: 44,
                                    width: MediaQuery.sizeOf(context).width * 0.84,
                                    padding: const EdgeInsets.only(left: 20),
                                    decoration: BoxDecoration(
                                      color: Colors.blue.withOpacity(0.2),
                                      borderRadius: const BorderRadius.only(
                                        bottomRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                      ),
                                    ),
                                    child: const Row(
                                      children: [
                                        Icon(
                                          Icons.thumb_up_alt_outlined,
                                          color: Colors.white,
                                          size: 17,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "231",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Icon(
                                          Icons.comment_outlined,
                                          color: Colors.white,
                                          size: 17,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "441",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Icon(
                                          Icons.share_outlined,
                                          color: Colors.white,
                                          size: 17,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "631",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Build Yourself",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const Text(
                                "New York",
                              ),
                              const Spacer(),
                              Icon(
                                Icons.star,
                                color: Colors.blue.shade800,
                                size: 18,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.blue.shade800,
                                size: 18,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.blue.shade800,
                                size: 18,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.blue.shade800,
                                size: 18,
                              ),
                              Icon(
                                Icons.star_half,
                                color: Colors.blue.shade800,
                                size: 18,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    "assets/singerimg/1.png",
                                    height: 50,
                                    fit: BoxFit.cover,
                                  )),
                              const SizedBox(
                                width: 10,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  "assets/singerimg/2.png",
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    "assets/singerimg/3.png",
                                    height: 50,
                                    fit: BoxFit.cover,
                                  )),
                              const SizedBox(
                                width: 10,
                              ),
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    "assets/singerimg/4.png",
                                    height: 50,
                                    fit: BoxFit.cover,
                                  )),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "+8 more",
                                style: TextStyle(fontSize: 15),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Someone who is not witly or sharp, but rather,\n they are ignorant unintelligent, or senseless.",
                            style: TextStyle(fontSize: 15),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.blue.shade200),
                                ),
                                child: const Text(
                                  "Book",
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
                                      Colors.blue.shade600),
                                ),
                                child: const Text(
                                  "Invite",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "View Gallery",
                                style: TextStyle(fontSize: 15),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
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
