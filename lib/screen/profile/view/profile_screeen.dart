import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isDarkThemeEnabled = false; // Assuming dark theme is initially disabled

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.30,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Color(0xFF00B79B),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "assets/img/keval.png",
                      height: 120,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Keval Kansara",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  const Text(
                    "M.In.Flutter",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
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
                        Navigator.pushNamed(context, 'profilepage');
                      },
                      icon: const Icon(Icons.navigate_next),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.event),
                    title: const Text(
                      "Events",
                      style: TextStyle(fontSize: 18),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'event');
                      },
                      icon: const Icon(Icons.navigate_next),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.interests_outlined),
                    title: const Text(
                      "Interests",
                      style: TextStyle(fontSize: 18),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'interests');
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
                        Navigator.pushNamed(context, 'location');
                      },
                      icon: const Icon(Icons.navigate_next),
                    ),
                  ),
                  ListTile(
                    leading:
                    const Icon(Icons.notifications_active_outlined),
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
                    leading: const Icon(Icons.dark_mode_outlined),
                    title: const Text(
                      "Dark Theme",
                      style: TextStyle(fontSize: 18),
                    ),
                    trailing: Switch(
                      value: isDarkThemeEnabled,
                      onChanged: (value) {
                        setState(() {
                          isDarkThemeEnabled = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.login,
                      color: Colors.red,
                    ),
                    title: const Text(
                      "Login",
                      style: TextStyle(fontSize: 18),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, 'login');
                      },
                      icon: const Icon(Icons.navigate_next),
                    ),
                  ),
                  ListTile(
                    title: const Text(
                      "Cancel Booking",
                      style: TextStyle(fontSize: 18),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'cancel');
                      },
                      icon: const Icon(Icons.navigate_next),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
