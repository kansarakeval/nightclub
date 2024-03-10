import 'dart:convert';

import 'package:http/http.dart';
import '../models/city.dart';
import '../models/reg.dart';
import '../models/login.dart';
import '../models/cat.dart';
import '../models/event.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Apicall {
  static String apiUrl =
      "http://192.168.1.5/seminar%20booking%20system/php_application/lib/";
  static String imgUrl =
      "http://192.168.1.5/seminar%20booking%20system/php_application/images/upload/";
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<Registration> createRegistration(Registration registration) async {
    Map data = {
      // 'u_id': '0' ,
      // 'u_profile': registration.first_name,
      'u_name': registration.u_name,
      'u_email': registration.u_email,
      'u_contactno': registration.u_contactno,
      'u_psw': registration.u_psw,
      // 'u_address':registration.address,
      // 'country':registration.country,
      // 'state':registration.state,
      // 'city':registration.city,
    };
    print("Insert data ");
    print(data);
    final Response response = await post(
      Uri.parse("$apiUrl/Reg_api.php"),
      body: {
        // 'u_id': '0' ,
        // 'u_profile': registration.first_name,
        'u_name': registration.u_name,
        'u_email': registration.u_email,
        'u_contactno': registration.u_contactno,
        'u_psw': registration.u_psw,
        // 'u_address':registration.address,
        // 'country':registration.country,
        // 'state':registration.state,
        // 'city':registration.city,
      }
    );
    if (response.statusCode == 200) {
      print("Inserted");
      print(response.body);
      return json.decode(response.body);
    } else {
      print("Error");
      throw Exception('Failed to post cases');
    }
  }

  Future<String> createLogin(Login login ) async {
    Map data = {
      'u_email': login.u_email,
      'u_psw': login.u_psw,
    };
    print("Login");
    print(data);
    final Response response = await post(
        Uri.parse("$apiUrl/login_api.php"),
        body: {
          'u_email': login.u_email,
          'u_psw': login.u_psw,
        }
    );
    if (response.statusCode == 200) {
      print("Inserted");
      print(response.body);
      Map<String, dynamic> jsonMap = json.decode(response.body);
      String uName = jsonMap['u_name'];
      print(json.decode(response.body));
      if (response.body.contains("1")) {
        final prefs = await SharedPreferences.getInstance();
        String uName = jsonMap['u_name'];
        await prefs.setString("name", uName);
        return "1"; //Login.fromJson(json.decode(response.body));
      }else {
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

  Future<List<Event>> getEvent() async{
    Response res=await get(Uri.parse("${apiUrl}showevent_api.php"));
    if(res.statusCode == 200){
      // print("Response Body");
      // print(res.body);
      List<dynamic> body=jsonDecode(res.body);
      //   print("\n Body Data \n");
      // print(body.toString());
      List<Event> Events = body.map((dynamic item) =>
          Event.fromJson(item)).toList();
      // print("\n list events \n");
      // print(Events.toString());
      // print("Events");
      // print(Events);
      return Events;
    } else {
      throw "Failed to load cases list";
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
}
