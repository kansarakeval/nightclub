import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../models/city.dart';
import '../../../services/api_call.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final Apicall api = Apicall();
  List<City> citylist = <City>[];

  @override
  void initState() {
    super.initState();
    _loadList();
  }

  Future<void> _loadList() async {
    try {
      final events = await api.fetchCities();
      setState(() {
        citylist = events;
      });
    } catch (error) {
      if (kDebugMode) {
        print('Error loading events: $error');
      }
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
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  const Text("Search By City",style: TextStyle(fontSize: 25,color: Colors.white),),
                  const SizedBox(height: 10,),
                  Container(
                    margin: const EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height*0.8,
                    width: MediaQuery.of(context).size.width*0.95,
                    decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
                    child: ListView.builder(
                      itemCount: citylist.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const SizedBox(width: 10,),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        'event',
                                        arguments: "${citylist[index].stateName},${citylist[index].cityName}", // Pass event ID as an argument
                                      );
                                    },
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(citylist[index].cityName, style: const TextStyle(fontSize: 15),),
                                        const SizedBox(height: 5),
                                        Text(citylist[index].stateName, style: TextStyle(color: Colors.grey.shade400),),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Divider(color: Colors.grey.shade300,),
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
