import 'package:flutter/material.dart';

import '../../../services/api_call.dart';

class CancelBookingScreen extends StatefulWidget {
  const CancelBookingScreen({super.key});

  @override
  State<CancelBookingScreen> createState() => _CancelBookingScreenState();
}

class _CancelBookingScreenState extends State<CancelBookingScreen> {
  String selectedGender = '';
  String bId = '';
  final Apicall api = Apicall();

  @override
  Widget build(BuildContext context) {
    final   bId = ModalRoute.of(context)!.settings.arguments as String;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Cancel Booking",
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: const Color(0xFF00B79B),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Please select the reason for cancellation",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(
              height: 10,
            ),
            Divider(color: Colors.grey.shade300,),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Radio(
                  value: 'I have another event so it collides',
                  groupValue: selectedGender,
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value.toString();
                    });
                  },
                  activeColor: const Color(0xFF00B79B),
                ),
                const Text('I have another event so it collides'),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: 'I am sick can`t come',
                  groupValue: selectedGender,
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value.toString();
                    });
                  },
                  activeColor: const Color(0xFF00B79B),
                ),
                const Text('I am sick can`t come'),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: 'I have on urgent need',
                  groupValue: selectedGender,
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value.toString();
                    });
                  },
                  activeColor: const Color(0xFF00B79B),
                ),
                const Text('I have on urgent need'),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: 'I have no transportation to come',
                  groupValue: selectedGender,
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value.toString();
                    });
                  },
                  activeColor: const Color(0xFF00B79B),
                ),
                const Text('I have no transportation to come'),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: 'I have no friends to come',
                  groupValue: selectedGender,
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value.toString();
                    });
                  },
                  activeColor: const Color(0xFF00B79B),
                ),
                const Text('I have no friends to come'),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: 'I want to book another event',
                  groupValue: selectedGender,
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value.toString();
                    });
                  },
                  activeColor: const Color(0xFF00B79B),
                ),
                const Text('I want to book another event'),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: 'I just want to cancel',
                  groupValue: selectedGender,
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value.toString();
                    });
                  },
                  activeColor: const Color(0xFF00B79B),
                ),
                const Text('I just want to cancel'),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: 'Others',
                  groupValue: selectedGender,
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value.toString();
                    });
                  },
                  activeColor: const Color(0xFF00B79B),
                ),
                const Text('Others'),
              ],
            ),
            const SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: selectedGender.isEmpty ? null : () async {
                    final response =
                    await api.Createcancelevent(bId, selectedGender);
                    if (response.success == 1) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Success"),
                            content: const Text("Your booking Cancellation .."),
                            actions: <Widget>[
                              TextButton(
                                child: const Text("Close"),
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      // Handle error response
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      selectedGender.isEmpty
                          ? Colors.grey
                          : const Color(0xFF00B79B),
                    ),
                  ),
                  child: const Text(
                    "Cancel Booking",
                    style: TextStyle(color: Colors.white),
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
