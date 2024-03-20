import 'package:flutter/material.dart';

class NotificationWidget extends StatelessWidget {
  final String? title;
  final String? des;

  const NotificationWidget({
    Key? key,
    required this.title,
    required this.des,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title ?? " ",
                  style: const TextStyle(fontSize: 20),
                ),
                Text(
                  des ?? "",
                  softWrap: true,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
