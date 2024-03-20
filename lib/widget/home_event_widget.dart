import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/api_call.dart';

class HomeEventContainer extends StatefulWidget {
  final String? img;
  final String? title;
  final String? date;
  final String? loc;
  final String? eid;
  final String? wis;
  final Apicall api;

  HomeEventContainer({
    Key? key,
    this.img,
    this.title,
    this.date,
    this.loc,
    required this.eid,
    this.wis,
    required this.api, // Pass the Apicall instance through the constructor
  }) : super(key: key);

  @override
  _HomeEventContainerState createState() => _HomeEventContainerState();
}

class _HomeEventContainerState extends State<HomeEventContainer> {
  String uID = '';
  bool isFavorite = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadUserID();
    setState(() {
      isFavorite = widget.wis != '0';
    });
  }

  Future<void> _loadUserID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    uID = prefs.getString('uID') ?? '';
  }

  Future<void> _addToWishlist() async {
    setState(() {
      isLoading = true;
    });
    try {
      final response = await widget.api.addToWishlist(uID, widget.eid!);
      if (response.success == 1) {
        setState(() {
          isFavorite = !isFavorite;
        });
      } else {
        // Handle error response
      }
    } catch (e) {
      print('Error: $e');
      // Handle API call error
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    widget.img ?? "",
                    height: 230,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            widget.title ?? "",
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                widget.date ?? "",
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF00B79B),
                ),
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(
                Icons.location_on_rounded,
                size: 25,
                color: Color(0xFF00B79B),
              ),
              const SizedBox(width: 5),
              Flexible( // Wrap the Text with Flexible
                child: Text(
                  widget.loc ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 17, color: Color(0x7100B79B)),
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: isLoading ? null : () => _addToWishlist(),
                icon: isFavorite
                    ? const Icon(
                  Icons.favorite_rounded,
                  color: Color(0xFF00B79B),
                )
                    : const Icon(
                  Icons.favorite_border_rounded,
                  color: Color(0xFF00B79B),
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
