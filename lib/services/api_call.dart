import 'dart:convert';

import 'package:http/http.dart';
import '../models/addwishlist.dart';
import '../models/city.dart';
import '../models/cityevent.dart';
import '../models/eventdetails.dart';
import '../models/reg.dart';
import '../models/login.dart';
import '../models/cat.dart';
import '../models/event.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/wishlist.dart';

class Apicall {
  static String apiUrl =
      "http://192.168.1.6/seminar%20booking%20system/php_application/lib/";
  static String imgUrl =
      "http://192.168.1.6/seminar%20booking%20system/php_application/images/upload/";
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<Registration> createRegistration(Registration registration) async {
    Map data = {
      'u_name': registration.u_name,
      'u_email': registration.u_email,
      'u_contactno': registration.u_contactno,
      'u_psw': registration.u_psw,
    };
    // print("Insert data ");
    // print(data);
    final Response response =
        await post(Uri.parse("$apiUrl/Reg_api.php"), body: {
      'u_name': registration.u_name,
      'u_email': registration.u_email,
      'u_contactno': registration.u_contactno,
      'u_psw': registration.u_psw,
    });
    if (response.statusCode == 200) {
      // print("Inserted");
      // print(response.body);
      return json.decode(response.body);
    } else {
      print("Error");
      throw Exception('Failed to post cases');
    }
  }

  Future<String> createLogin(Login login) async {
    Map data = {
      'u_email': login.u_email,
      'u_psw': login.u_psw,
    };
    // print("Login");
    // print(data);
    final Response response =
        await post(Uri.parse("$apiUrl/login_api.php"), body: {
      'u_email': login.u_email,
      'u_psw': login.u_psw,
    });
    if (response.statusCode == 200) {
      // print("Inserted");
      // print(response.body);
      Map<String, dynamic> jsonMap = json.decode(response.body);
      // String uName = jsonMap['u_name'];
      // print(json.decode(response.body));
      if (response.body.contains("1")) {
        final prefs = await SharedPreferences.getInstance();
        String uID = jsonMap['u_id'];
        await prefs.setString("uID", uID);
        String uName = jsonMap['u_name'];
        await prefs.setString("name", uName);
        String uEmail = jsonMap['u_email'];
        await prefs.setString("uEmail", uEmail);
        String uContactno = jsonMap['u_contactno'];
        await prefs.setString("uContactno", uContactno);
        return "1";
      } else {
        return "0";
      }
    } else {
      print("Error");
      throw Exception('Failed to post cases');
    }
  }

  Future<List<Category>> fetchCategories() async {
    final response = await get(Uri.parse("${apiUrl}show_cat.php"));

    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);
      return list.map((model) => Category.fromJson(model)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }

  Future<List<Event>> getEvent(String userId) async {
    Response res = await get(Uri.parse("${apiUrl}showevent_api.php?u_id=$userId"));
    if (res.statusCode == 200) {
      // print("Response Body");
      // print(res.body);
      List<dynamic> body = jsonDecode(res.body);
      // print("\n Body Data \n");
      // print(body.toString());
      List<Event> Events =
          body.map((dynamic item) => Event.fromJson(item)).toList();
      // print("\n list events \n");
      // print(Events.toString());
      // print("Events");
      // print(Events);
      return Events;
    } else {
      throw "Failed to load cases list";
    }
  }

  Future<List<Eventdetail>> fetchEventDetails(String eventId) async {
    final response = await get(Uri.parse('${apiUrl}eventdetails_api.php?e_id=$eventId'));

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<Eventdetail> Eventdet = body.map((dynamic item) => Eventdetail.fromJson(item)).toList();
      return Eventdet;
    } else {
      throw Exception('Failed to load event details');
    }
  }

  Future<List<City>> fetchCities() async {
    final response = await get(Uri.parse("${apiUrl}showcity&state_api.php"));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((city) => City.fromJson(city)).toList();
    } else {
      // If the server did not return a 200 OK response, throw an exception.
      throw Exception('Failed to load cities');
    }
  }

  Future<List<Cityevent>> fetchCityevent(String lAddress,String uID) async {
    final response = await get(Uri.parse("${apiUrl}citieswiseevent_api.php?l_address=$lAddress&u_id=$uID"));

    if (response.statusCode == 200) {
      List<Cityevent> eventDetails = [];
      List<dynamic> jsonList = json.decode(response.body);
      // print(response.body);
      for (var json in jsonList) {
        eventDetails.add(Cityevent.fromJson(json));
      }
      return eventDetails;
    } else {
      throw Exception('Failed to load event details');
    }
  }

  Future<addwishlist> addToWishlist(String userId, String eventId) async {
    final response = await post(
      Uri.parse("${apiUrl}addwislist.php"), // Replace with your endpoint
      body: {'u_id': userId.toString(), 'e_id': eventId.toString()},
    );

    if (response.statusCode == 200) {
      return addwishlist.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to add to wishlist');
    }
  }

  Future<List<wishlist>> fetchwislistEvents(String userId) async {
    final response = await get(Uri.parse('${apiUrl}wislistevent.php?u_id=$userId'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => wishlist.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load events');
    }
  }
}
