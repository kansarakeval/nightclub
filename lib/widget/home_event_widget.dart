import 'package:flutter/material.dart';

class HomeEventContainer extends StatelessWidget {
  String? img,title,text,des;
  HomeEventContainer({super.key, this.img,this.title,this.text,this.des});

  @override
  Widget build(BuildContext context) {
    return   Container(
      width: MediaQuery.sizeOf(context).width * 0.90,
      height: MediaQuery.sizeOf(context).height*0.75,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 0.2,
              blurRadius: 2,
            )
          ],
          borderRadius: BorderRadius.circular(5)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Image.asset(
                    img ?? "",
                    height: 230,
                    fit: BoxFit.cover,
                  ),
                  IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border,color: Colors.white,))
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title ?? "",
            style: const TextStyle(
                fontSize: 25, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                text ?? "",
              ),
              const Spacer(),
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
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    "assets/singerimg/1.png",
                    height: 40,
                    fit: BoxFit.cover,
                  )),
              const SizedBox(width: 5),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  "assets/singerimg/2.png",
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 5),
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    "assets/singerimg/3.png",
                    height: 40,
                    fit: BoxFit.cover,
                  )),
              const SizedBox(width: 5),
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    "assets/singerimg/4.png",
                    height: 40,
                    fit: BoxFit.cover,
                  )),
              const SizedBox(width: 5),
              const Text(
                "+8 more",
                style: TextStyle(fontSize: 15),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            des ?? "",
            style: const TextStyle(fontSize: 15),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'bookevent');
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color(0xFF00B79B)),
                ),
                child: const Text(
                  "Book",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color(0xFF00B79B)),
                ),
                child: const Text(
                  "Invite",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(

                "View Gallery",
                style: TextStyle(fontSize: 15),
              )
            ],
          )
        ],
      ),
    );

  }
}
