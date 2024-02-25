import 'package:flutter/material.dart';
import 'package:nightclub/screen/location/provider/location_provider.dart';
import 'package:provider/provider.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  LocationProvider? providerr;
  LocationProvider? providerw;
  @override
  Widget build(BuildContext context) {
    providerr = context.read<LocationProvider>();
    providerw = context.watch<LocationProvider>();
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
            SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(onPressed: (){
                        Navigator.popUntil(context, ModalRoute.withName('home'));
                      }, icon: const Icon(Icons.arrow_back,color: Colors.white,)),
                      const SizedBox(width: 10,),
                      const Text("Location",style: TextStyle(fontSize: 25,color: Colors.white),)
                    ],
                  ),
                  SizedBox(height: 20,),
                  Container(
                    height: MediaQuery.sizeOf(context).height*0.9,
                    width: MediaQuery.sizeOf(context).width*0.95,
                    decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
                    child: ListView.builder(itemCount: providerr!.locationList.length,itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                ClipRRect(borderRadius: BorderRadius.circular(5),child: Image.asset("${providerr!.locationList[index].img}",height: 50, width:50,fit: BoxFit.cover,)),
                                SizedBox(width: 10,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("${providerr!.locationList[index].name}",style: TextStyle(fontSize: 15),),
                                    SizedBox(height:5),
                                    Text("${providerr!.locationList[index].city}",style: TextStyle(color: Colors.grey.shade400),),
                                  ],
                                ),
                              ],
                            ),
                            Divider( color: Colors.grey.shade300,),
                          ],
                        ),
                      );

                    },

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
