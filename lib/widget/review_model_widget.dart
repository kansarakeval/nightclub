import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../services/api_call.dart';
class ReviewModal extends StatefulWidget {
  final String? bid;
  final String? eventname;

  const ReviewModal({
    super.key,
    required this.bid,
    required this.eventname,
  });

  @override
  _ReviewModalState createState() => _ReviewModalState();
}

class _ReviewModalState extends State<ReviewModal> {
  double rating = 0;
  TextEditingController reviewController = TextEditingController();
  int cursorPosition = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
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
              width: 50,
              child: Divider(
                color: Colors.grey.shade700,
                height: 2,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Leave a Review',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 5),
            Divider(
              color: Colors.grey.shade300,
            ),
            const SizedBox(height: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'How was your experience with',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${widget.eventname}?',
                  style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            RatingBar.builder(
              initialRating: rating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: false,
              itemCount: 5,
              itemPadding: EdgeInsets.zero,
              itemBuilder: (context, _) => Icon(
                Icons.star_rate_rounded,
                color: rating >= _ ? const Color(0xFF00B79B) : Colors.grey,
              ),
              onRatingUpdate: (newRating) {
                setState(() {
                  rating = newRating; // Update the rating variable
                });
              },
            ),
            const SizedBox(height: 5),
            Divider(
              color: Colors.grey.shade300,
            ),
            const SizedBox(height: 5),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Write Your Review',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                controller: reviewController,
                decoration: const InputDecoration(
                  hintText: 'Your review here...',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(8.0),
                ),
                maxLines: 3,
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: const BorderSide(color: Color(0xFF00B79B)),
                      ),
                    ),
                  ),
                  child: const Text(
                    "Maybe Later",
                    style: TextStyle(color: Color(0xFF00B79B)),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async{
                    try {
                      Apicall api = Apicall();
                      var response = await api.postFeedback(widget.bid.toString(), rating.toString(),reviewController.text);

                      if (response.success == 1) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("Success"),
                              content: const Text("Thank you for give Review.."),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text("Close"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("Success"),
                              content: const Text("Your Review are not Save.."),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text("Close"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    } catch (e) {
                      if (kDebugMode) {
                        print('Error: $e');
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00B79B),
                  ),
                  child: const Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    reviewController.dispose();
    super.dispose();
  }
}
