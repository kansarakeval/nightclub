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
                              style: TextStyle(fontSize: 15, color: Colors.white),
                            ),
                            Text(
                              "Good Morning",
                              style: TextStyle(fontSize: 20, color: Colors.white),
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
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.90,
                      height: MediaQuery.sizeOf(context).height * 0.60,
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
                            style: TextStyle(fontSize: 16),
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
                      height: MediaQuery.sizeOf(context).height * 0.60,
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
                            style: TextStyle(fontSize: 16),
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
                      height: MediaQuery.sizeOf(context).height * 0.60,
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
                            style: TextStyle(fontSize: 16),
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

                    //theme
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.90,
                      height: MediaQuery.sizeOf(context).height * 0.20,
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
                                      Colors.blue.shade200),
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
                                      Colors.blue.shade600),
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
                    
                    //people
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.90,
                      height: MediaQuery.sizeOf(context).height * 0.40,
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
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("People",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                              Text("View All",style: TextStyle(fontSize: 15),)
                            ],
                          ),
                          const SizedBox(height: 10,),
                          SingleChildScrollView(scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    ClipRRect( borderRadius: BorderRadius.circular(10),child: Image.asset("assets/singerimg/3.png",height: 110,)),
                                    const SizedBox(height: 10,),
                                    const Text("Juliet Wykes",style: TextStyle(fontSize: 18),),
                                    const SizedBox(height: 2,),
                                    const Text("senior Designer",style: TextStyle(fontSize: 15),),
                                    const SizedBox(height: 10,),
                                    Row(
                                      children: [
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
                                    const SizedBox(height: 10,),
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all(
                                            Colors.blue.shade600),
                                      ),
                                      child: const Text(
                                        "Follow",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 20,),
                                Column(
                                  children: [
                                    ClipRRect( borderRadius: BorderRadius.circular(10),child: Image.asset("assets/singerimg/4.png",height: 110,)),
                                    const SizedBox(height: 10,),
                                    const Text("Dag Curner",style: TextStyle(fontSize: 18),),
                                    const SizedBox(height: 2,),
                                    const Text("Manager",style: TextStyle(fontSize: 15),),
                                    const SizedBox(height: 10,),
                                    Row(
                                      children: [
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
                                    const SizedBox(height: 10,),
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all(
                                            Colors.blue.shade600),
                                      ),
                                      child: const Text(
                                        "Follow",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 20,),
                                Column(
                                  children: [
                                    ClipRRect( borderRadius: BorderRadius.circular(10),child: Image.asset("assets/singerimg/9.png",height: 110,)),
                                    const SizedBox(height: 10,),
                                    const Text("Grove stark",style: TextStyle(fontSize: 18),),
                                    const SizedBox(height: 2,),
                                    const Text("Ux/Manager",style: TextStyle(fontSize: 15),),
                                    const SizedBox(height: 10,),
                                    Row(
                                      children: [
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
                                    const SizedBox(height: 10,),
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all(
                                            Colors.blue.shade600),
                                      ),
                                      child: const Text(
                                        "Follow",
                                        style: TextStyle(color: Colors.white),
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
