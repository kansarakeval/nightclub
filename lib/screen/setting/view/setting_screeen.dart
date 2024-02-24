import 'package:flutter/material.dart';

class SettingScreeen extends StatefulWidget {
  const SettingScreeen({super.key});

  @override
  State<SettingScreeen> createState() => _SettingScreeenState();
}

class _SettingScreeenState extends State<SettingScreeen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height * 0.35,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                color: Colors.blue.shade800,
              ),
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.clear,
                            color: Colors.white,
                          ))),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "assets/img/keval.png",
                        height: 120,
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Keval Kansara",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
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
                    leading: const Icon(Icons.dashboard_customize_outlined),
                    title: const Text(
                      "Dashboard",
                      style: TextStyle(fontSize: 18),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
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
                    leading: const Icon(Icons.manage_search),
                    title: const Text(
                      "Search Event",
                      style: TextStyle(fontSize: 18),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
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
                    leading: const Icon(Icons.qr_code_outlined),
                    title: const Text(
                      "Tickets",
                      style: TextStyle(fontSize: 18),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.navigate_next),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.reviews_outlined),
                    title: const Text(
                      "Reviews",
                      style: TextStyle(fontSize: 18),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
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
                      onPressed: () {},
                      icon: const Icon(Icons.navigate_next),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.account_circle_outlined),
                    title: const Text(
                      "User Profile",
                      style: TextStyle(fontSize: 18),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.navigate_next),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.group_outlined),
                    title: const Text(
                      "users",
                      style: TextStyle(fontSize: 18),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.navigate_next),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.messenger_outline),
                    title: const Text(
                      "Messages",
                      style: TextStyle(fontSize: 18),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.navigate_next),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.person_pin_outlined),
                    title: const Text(
                      "Followers",
                      style: TextStyle(fontSize: 18),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.navigate_next),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.help_outline),
                    title: const Text(
                      "Frequently Asked\n Question(Faq)",
                      style: TextStyle(fontSize: 18),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.navigate_next),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.manage_accounts_outlined),
                    title: const Text(
                      "Edit profile",
                      style: TextStyle(fontSize: 18),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.navigate_next),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.home_outlined),
                    title: const Text(
                      "Welcome",
                      style: TextStyle(fontSize: 18),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.navigate_next),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.login),
                    title: const Text(
                      "Login",
                      style: TextStyle(fontSize: 18),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.navigate_next),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.how_to_reg),
                    title: const Text(
                      "Register",
                      style: TextStyle(fontSize: 18),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.navigate_next),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.smartphone),
                    title: const Text(
                      "Enter mobile number",
                      style: TextStyle(fontSize: 18),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.navigate_next),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.dialpad),
                    title: const Text(
                      "Enter OTP",
                      style: TextStyle(fontSize: 18),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.navigate_next),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.policy_outlined),
                    title: const Text(
                      "Terms & Conditions",
                      style: TextStyle(fontSize: 18),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.navigate_next),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.verified_user_outlined),
                    title: const Text(
                      "Privacy Policy",
                      style: TextStyle(fontSize: 18),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
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
