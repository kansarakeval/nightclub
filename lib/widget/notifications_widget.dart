import 'package:flutter/material.dart';

class NotificationWidget extends StatelessWidget {
  String? title,des;
  IconData? icon;
   NotificationWidget({super.key,required this.icon,required this.title,required this.des});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon ?? Icons.account_circle_outlined),
          const SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title ?? " ",style: const TextStyle(fontSize: 20),),
              Text(des ?? "",style: TextStyle(color: Colors.grey.shade400),),
            ],
          ),
          const Spacer(),
          const Text("1 day")
        ],
      ),
    );
  }
}
