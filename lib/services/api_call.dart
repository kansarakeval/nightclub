import 'dart:convert';
import 'dart:io';
import 'package:nightclub/models/bookevent.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import '../models/addwishlist.dart';
import '../models/bookdetails.dart';
import '../models/cancelevent.dart';
import '../models/city.dart';
import '../models/cityevent.dart';
import '../models/eticket.dart';
import '../models/eventdetails.dart';
import '../models/forget_password_model.dart';
import '../models/notification.dart';
import '../models/password_change.dart';
import '../models/reg.dart';
import '../models/login.dart';
import '../models/cat.dart';
import '../models/event.dart';
import '../models/reviewadd.dart';
import '../models/updateprofile.dart';
import '../models/userdetail.dart';
import '../models/wishlist.dart';
import "package:path/path.dart" show basename;

class Apicall {
  static String apiUrl =
      "http://192.168.221.213/seminar%20booking%20system/php_application/lib/";
  static String imgUrl =
      "http://192.168.221.213/seminar%20booking%20system/php_application/images/upload/";

  Future<Registration> createRegistration(Registration registration) async {
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
        String uProfile = jsonMap['u_profile'];
        await prefs.setString("uProfile", uProfile);
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

  Future<Object> Createbookevent(Bookevent bookdetails) async {
    // print("Insert data ");
    // print(data);
    final Response response =
    await post(Uri.parse("$apiUrl/booking_api.php"), body: {
      'e_id': bookdetails.e_id,
      'u_id': bookdetails.u_id,
      'no_seat': bookdetails.no_seat,
      'total_price': bookdetails.total_price,
    });
    if (response.body.contains("1")) {
      Map<String, dynamic> jsonMap = json.decode(response.body);
      int bId = jsonMap['b_id'] as int;
      return bId;
    } else {
      return "0";
    }
  }

  Future<List<Bookdetails>> fetchupcomingEvents(String userId) async {
    final response = await get(Uri.parse('${apiUrl}upcomingbooking.php?u_id=$userId'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => Bookdetails.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load events');
    }
  }

  Future<List<Bookdetails>> fetchcomplatedEvents(String userId) async {
    final response = await get(Uri.parse('${apiUrl}complatedbooking.php?u_id=$userId'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => Bookdetails.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load events');
    }
  }

  Future<List<Bookdetails>> fetchcancelEvents(String userId) async {
    final response = await get(Uri.parse('${apiUrl}cancelledevent_api.php?u_id=$userId'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => Bookdetails.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load events');
    }
  }

  Future<CancelEvent> Createcancelevent(String bId, String reason) async {
    final response = await post(
      Uri.parse("${apiUrl}cancelevent_api.php"), // Replace with your endpoint
      body: {'b_id': bId.toString(), 'c_reason': reason.toString()},
    );

    if (response.statusCode == 200) {
      return CancelEvent.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to Cancel Event');
    }
  }

  Future<List<eticket>> fetchTicketData(String bId) async {
    final response = await get(Uri.parse('${apiUrl}eticket.php?b_id=$bId'));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((event) => eticket.fromJson(event)).toList();
    } else {
      throw Exception('Failed to load event data');
    }
  }

  Future<List<cNotification>> fetchNotifications() async {
    final response = await get(Uri.parse("${apiUrl}notification_api.php"));

    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      return responseData.map((json) => cNotification.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load notifications');
    }
  }

  Future<User?> fetchUser(String userId) async {
    final response = await get(Uri.parse('${apiUrl}userdetail_api.php?u_id=$userId'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      if (data.isNotEmpty) {
        return User.fromJson(data.first);
      }
    }
    return null;
  }

  Future<ReviewAdd> postFeedback(String bId, String rating, String review) async {
    final response = await post(
      Uri.parse('${apiUrl}feedadd_api.php'),
      body: {
        'b_id': bId,
        'f_rating': rating,
        'f_review': review,
      },
    );

    if (response.statusCode == 200) {
      return ReviewAdd.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to post feedback');
    }
  }

  Future<ForgetPasswordResponse> sendOtp(String email) async {
    final response = await post(
      Uri.parse('${apiUrl}mailer.php'),
      body: {
        'email': email,
      },
    );

    if (response.statusCode == 200) {
      return ForgetPasswordResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to send OTP');
    }
  }

  Future<PasswordChangeResponse> changePassword(String email, String newPassword) async {
    final response = await post(
      Uri.parse('${apiUrl}forgot_api.php'),
      body: {
        'u_email': email,
        'u_psw': newPassword,
      },
    );
    if (response.statusCode == 200) {
      return PasswordChangeResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to change password');
    }
  }

  Future<void> uploadImage(File image) async {
    final ByteStream stream = http.ByteStream(image.openRead());
    final int length = await image.length();

    var request = http.MultipartRequest('POST', Uri.parse('${apiUrl}imageuplode.php'));
    // final multipartFile = http.MultipartFile(
    //   'profile',
    //   stream,
    //   length,
    //   filename: basename(image.path),
    // );

    request.files.add(await http.MultipartFile.fromPath('profile', image.path));
    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    print(response.body);
  }


  Future<UpdateUserResponse> updateUser(String userId, String profile, String name, String email, String contactNo, String gender, String dob, String state, String city) async {
    final response = await post(
      Uri.parse('${apiUrl}updateprofile_api.php'),
      body: {
        'u_id': userId,
        'u_profile': profile,
        'u_name': name,
        'u_email': email,
        'u_contactno': contactNo,
        'u_gender': gender,
        'u_dob': dob,
        'u_state': state,
        'u_city': city,
      },
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonMap = json.decode(response.body);
      final prefs = await SharedPreferences.getInstance();
      String uID = jsonMap['u_id'];
      await prefs.setString("uID", uID);
      String uName = jsonMap['u_name'];
      await prefs.setString("name", uName);
      String uEmail = jsonMap['u_email'];
      await prefs.setString("uEmail", uEmail);
      String uContactno = jsonMap['u_contactno'];
      await prefs.setString("uContactno", uContactno);
      String uProfile = jsonMap['u_profile'];
      await prefs.setString("uProfile", uProfile);
      return UpdateUserResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update user');
    }
  }

}