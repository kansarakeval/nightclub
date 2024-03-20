import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../services/api_call.dart';
import '../../dash/provider/dash_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isDarkThemeEnabled = false; // Assuming dark theme is initially disabled
  late String name = '';
  late String uprofile = '';
  late String uID = '';
  final Apicall api = Apicall();

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name') ?? '';
      uID = prefs.getString('uID') ?? '';
      uprofile = prefs.getString('uProfile') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    final DashProvider provider =
        Provider.of<DashProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Color(0xFF00B79B),
              ),
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(
                        "${Apicall.imgUrl}profile/$uprofile",
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: const Icon(Icons.account_circle_outlined),
                    title: const Text(
                      "User Profile",
                      style: TextStyle(fontSize: 18),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          'profilepage',
                          arguments: uID,
                        );
                      },
                      icon: const Icon(Icons.navigate_next),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.event),
                    title: const Text(
                      "Book Events",
                      style: TextStyle(fontSize: 18),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        provider.pageController.animateToPage(3,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn);
                        provider.changeIndex(
                            3); // Navigate to the Location Screen (index 1)
                      },
                      icon: const Icon(Icons.navigate_next),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.location_on_outlined),
                    title: const Text(
                      "Search City",
                      style: TextStyle(fontSize: 18),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        provider.pageController.animateToPage(1,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn);
                        provider.changeIndex(
                            1); // Navigate to the Location Screen (index 1)
                      },
                      icon: const Icon(Icons.navigate_next),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.notifications_active_outlined),
                    title: const Text(
                      "Notifications",
                      style: TextStyle(fontSize: 18),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'notification');
                      },
                      icon: const Icon(Icons.navigate_next),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.logout_rounded,
                      color: Colors.red,
                    ),
                    title: const Text(
                      "Logout",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.red,
                      ),
                    ),
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return StatefulBuilder(
                            builder:
                                (BuildContext context, StateSetter setState) {
                              return Container(
                                padding: const EdgeInsets.only(
                                  left: 16.0,
                                  right: 16.0,
                                  bottom: 16.0,
                                  top: 5.0,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                        width: 50, // Set the desired width here
                                        child: Divider(
                                          color: Colors.grey.shade700,
                                          // Darker color
                                          height:
                                              2, // Set the height of the divider
                                        )),
                                    const SizedBox(height: 10),
                                    const Text(
                                      'Logout',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.red,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Divider(
                                      color: Colors.grey.shade300,
                                    ),
                                    const SizedBox(height: 5),
                                    const Text(
                                      'Are you sure to you want to log out?',
                                      style: TextStyle(fontSize: 18.0),
                                    ),
                                    const SizedBox(height: 40.0),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          style: ButtonStyle(
                                            shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                side: const BorderSide(
                                                    color: Color(0xFF00B79B)),
                                              ),
                                            ),
                                          ),
                                          child: const Text(
                                            "Cancel",
                                            style: TextStyle(
                                                color: Color(0xFF00B79B)),
                                          ),
                                        ),
                                        ElevatedButton(
                                          onPressed: () async {
                                            SharedPreferences preferences =
                                                await SharedPreferences
                                                    .getInstance();
                                            await preferences.clear();

                                            // Dispose of the pageController
                                            // var dashProvider = Provider.of<DashProvider>(context, listen: false);
                                            // dashProvider.pageController.dispose();

                                            // Navigate to the login screen
                                            Navigator.pushNamed(
                                                context, 'login');
                                          },
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    const Color(0xFF00B79B)),
                                          ),
                                          child: const Text("Yes, Logout",
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
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
