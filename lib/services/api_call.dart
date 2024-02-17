import 'dart:convert';

import 'package:flutter/src/widgets/editable_text.dart';
import 'package:http/http.dart';
import '../models/reg.dart';

class Apicall {
  static String apiUrl =
      "http://192.168.135.86/seminar%20booking%20system/php_application/lib/";
  static String imgUrl =
      "http://192.168.135.86/seminar%20booking%20system/php_application/images/upload/";

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
      Uri.parse(apiUrl + "/Reg_api.php"),
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
}
