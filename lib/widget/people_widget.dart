import 'package:flutter/material.dart';

class PeopleWidget extends StatelessWidget {
  String? img,name,qualification;
   PeopleWidget({super.key,required this.img,required this.name,required this.qualification});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect( borderRadius: BorderRadius.circular(10),child: Image.asset(img ?? "",height: 110,)),
        const SizedBox(height: 10,),
        Text(name ?? "",style: const TextStyle(fontSize: 18),),
        const SizedBox(height: 2,),
        Text(qualification ?? "",style: const TextStyle(fontSize: 15),),
        const SizedBox(height: 10,),
        Row(
          children: [
            Icon(
              Icons.star,
              color: Colors.blue.shade800,
              size: 18,
            ),
            Icon(
              Icons.star,
              color: Colors.blue.shade800,
              size: 18,
            ),
            Icon(
              Icons.star,
              color: Colors.blue.shade800,
              size: 18,
            ),
            Icon(
              Icons.star,
              color: Colors.blue.shade800,
              size: 18,
            ),
            Icon(
              Icons.star_half,
              color: Colors.blue.shade800,
              size: 18,
            ),
          ],
        ),
        const SizedBox(height: 10,),
        ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                Colors.blue.shade600),
          ),
          child: const Text(
            "Follow",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
