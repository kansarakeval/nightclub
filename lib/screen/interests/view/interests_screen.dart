import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nightclub/screen/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({super.key});

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(onPressed: (){
                          Navigator.popUntil(context, ModalRoute.withName('home'));
                        }, icon: const Icon(Icons.arrow_back,color: Colors.white,)),
                        const SizedBox(width: 10,),
                        const Text("Interests",style: TextStyle(fontSize: 25,color: Colors.white),)
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    SizedBox(
                      height: MediaQuery.sizeOf(context).height*0.9,
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
