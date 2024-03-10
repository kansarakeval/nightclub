import 'package:flutter/material.dart';

class CancelBookingScreen extends StatefulWidget {
  const CancelBookingScreen({super.key});

  @override
  State<CancelBookingScreen> createState() => _CancelBookingScreenState();
}

class _CancelBookingScreenState extends State<CancelBookingScreen> {
  String selectedGender = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Cancel Booking",
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Color(0xFF00B79B),
        ),
        body: Column(
          children: [
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
                ),
                const Text('I have another event so it collides'),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: 'I am sick cont come',
                  groupValue: selectedGender,
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value.toString();
                    });
                  },
                ),
                const Text('I am sick cont come'),
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
                ),
                const Text('I have no friends to come'),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: 'I wont to book another event',
                  groupValue: selectedGender,
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value.toString();
                    });
                  },
                ),
                const Text('I wont to book another event'),
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
                ),
                const Text('Others'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xFF00B79B)),
                  ),
                  child: Text("Cancel Booking",style: TextStyle(color: Colors.white),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
