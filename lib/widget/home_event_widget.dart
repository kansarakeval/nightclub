import 'package:flutter/material.dart';

class HomeEventContainer extends StatelessWidget {
  final String? img;
  final String? title;
  final String? date;
  final String? loc;

  const HomeEventContainer(
      {Key? key, this.img, this.title, this.date, this.loc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.90,
      height: MediaQuery.of(context).size.height * 0.50,
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
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    img ?? "",
                    height: 230,
                    fit: BoxFit.cover,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_border, color: Colors.white),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title ?? "",
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                date ?? "",
                style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500,color: Color(0xFF00B79B)),
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Icon(
                Icons.location_on_rounded,
                size: 25,
                color: Color(0xFF00B79B),
              ),
              SizedBox(width: 5),
              Text(
                loc ?? "",
                style: const TextStyle(fontSize: 17),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
