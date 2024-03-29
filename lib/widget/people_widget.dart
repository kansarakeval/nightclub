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
        const Row(
          children: [
            Icon(
              Icons.star,
              color: Color(0xFF00B79B),
              size: 18,
            ),
            Icon(
              Icons.star,
              color: Color(0xFF00B79B),
              size: 18,
            ),
            Icon(
              Icons.star,
              color: Color(0xFF00B79B),
              size: 18,
            ),
            Icon(
              Icons.star,
              color: Color(0xFF00B79B),
              size: 18,
            ),
            Icon(
              Icons.star_half,
              color: Color(0xFF00B79B),
              size: 18,
            ),
          ],
        ),
        const SizedBox(height: 10,),
        ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                const Color(0xFF00B79B)),
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
