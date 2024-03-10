import 'package:flutter/material.dart';

class ProfilePageScreen extends StatefulWidget {
  const ProfilePageScreen({Key? key}) : super(key: key);

  @override
  State<ProfilePageScreen> createState() => _ProfilePageScreenState();
}

class _ProfilePageScreenState extends State<ProfilePageScreen> {
  String selectedGender = '';

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
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Text(
                        "Profile",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.image,
                            color: Colors.white,
                          )),
                      const TextField(
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            prefixIcon:
                            Icon(Icons.supervised_user_circle_outlined),
                            labelText: "Name"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.email_outlined),
                            labelText: "Email"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.call_outlined),
                            labelText: "Mobile Number"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Radio(
                            value: 'male',
                            groupValue: selectedGender,
                            onChanged: (value) {
                              setState(() {
                                selectedGender = value.toString();
                              });
                            },
                          ),
                          const Text('Male'),
                          const SizedBox(width: 20),
                          Radio(
                            value: 'female',
                            groupValue: selectedGender,
                            onChanged: (value) {
                              setState(() {
                                selectedGender = value.toString();
                              });
                            },
                          ),
                          const Text('Female'),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      const TextField(
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.date_range),
                            labelText: "DD/MM/YYYY"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const TextField(
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.map),
                            labelText: "state"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const TextField(
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.location_city),
                            labelText: "city"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(const Color(0xFF00B79B)),
                        ),
                        child: const Text(
                          "save",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
