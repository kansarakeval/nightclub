import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../../../models/city.dart';
import '../../../services/api_call.dart';

class ProfilePageScreen extends StatefulWidget {
  const ProfilePageScreen({super.key});

  @override
  _ProfilePageScreenState createState() => _ProfilePageScreenState();
}

class _ProfilePageScreenState extends State<ProfilePageScreen> {
  File? _image;
  String profile = '';
  String selectedGender = '';
  String name = '';
  String email = '';
  String mobileNumber = '';
  String dateOfBirth = '';
  String stateValue = '';
  String cityValue = '';
  String uid = '';
  bool isEmailEnabled = false;
  bool isMobileEnabled = false;
  List<City> cities = [];
  List<String> stateList = [];
  List<String> cityList = [];
  List<String> uniqueStates = [];

  final _formKey = GlobalKey<FormState>();

  final Apicall api = Apicall();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController dobController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final uId = ModalRoute.of(context)!.settings.arguments as String;
      uid = uId;
      await fetchUser(uId);
      await fetchCitiesFromApi();
      fetchStates();
    });
  }

  Future<void> fetchCitiesFromApi() async {
    try {
      List<City> fetchedCities = await api.fetchCities();
      setState(() {
        cities = fetchedCities;
      });
    } catch (e) {
      print('Error fetching cities: $e');
    }
  }

  void fetchStates() async {
    try {
      List<City> cities = await api.fetchCities();
      setState(() {
        stateList = cities.map((city) => city.stateName).toList();
        cityList = cities.map((city) => city.cityName).toList();
        uniqueStates = stateList.toSet().toList(); // Assign to uniqueStates here
        List<String> uniqueStates1 = cityList.toSet().toList();
        if (uniqueStates.isNotEmpty) {
          stateValue = uniqueStates.first;
          cityValue = uniqueStates1.first;
        }
      });
    } catch (e) {
      print('Error fetching states: $e');
      // Handle the error or set default values for stateList and uniqueStates
      setState(() {
        stateList = []; // or any default value you want
        stateValue = ''; // or any default value you want
      });
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    mobileController.dispose();
    dobController.dispose();
    super.dispose();
  }

  Future<void> _getImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = File(image.path);
        profile = image.name;
      });
    }
  }

  Future<void> fetchUser(String userId) async {
    final user = await api.fetchUser(userId);
    if (user != null) {
      setState(() {
        profile = user.uProfile;
        name = user.uName;
        email = user.uEmail;
        mobileNumber = user.uContactNo;
        selectedGender = user.uGender;
        dateOfBirth = user.uDob;
        cityValue = user.uCites;
        stateValue = user.uState;

        nameController.text = name;
        emailController.text = email;
        mobileController.text = mobileNumber;
        dobController.text = dateOfBirth;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.40,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Color(0xFF00B79B),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.95,
                        height: MediaQuery.of(context).size.height * 0.08,
                        decoration: const BoxDecoration(
                          color: Color(0xFF00B79B),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                "Edit Profile",
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: _image != null
                        ? ClipOval(
                      child: Image.file(
                        _image!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    )
                        : profile.isNotEmpty
                        ? ClipOval(
                      child: Image.network(
                        "${Apicall.imgUrl}profile/$profile",
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    )
                        : const SizedBox(),
                  ),
                  IconButton(
                    onPressed: _getImage,
                    icon: const Icon(
                      Icons.image,
                      color: Colors.white,
                    ),
                  ),
                  Center(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width * 0.95,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 0.2,
                            blurRadius: 2,
                          ),
                        ],
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            TextFormField(
                              keyboardType: TextInputType.name,
                              controller: nameController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                prefixIcon:
                                Icon(Icons.supervised_user_circle_outlined),
                                labelText: "Name",
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your name';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  name = value;
                                });
                              },
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              enabled: isEmailEnabled,
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.email_outlined),
                                labelText: "Email",
                              ),
                              onChanged: (value) {
                                setState(() {
                                  email = value;
                                });
                              },
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              enabled: isMobileEnabled,
                              controller: mobileController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.call_outlined),
                                labelText: "Mobile Number",
                              ),
                              onChanged: (value) {
                                setState(() {
                                  mobileNumber = value;
                                });
                              },
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Radio(
                                  value: 'male',
                                  groupValue: selectedGender,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedGender = value.toString();
                                    });
                                  },
                                  activeColor: const Color(0xFF00B79B),
                                ),
                                const Text('Male'),
                                const SizedBox(width: 20),
                                Radio(
                                  value: 'female',
                                  groupValue: selectedGender,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedGender = value.toString();
                                    });
                                  },
                                  activeColor: const Color(0xFF00B79B),
                                ),
                                const Text('Female'),
                              ],
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              onTap: () async {
                                final selectedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime.now(),
                                  initialEntryMode:
                                  DatePickerEntryMode.calendar,
                                  helpText: 'Select Date of Birth',
                                  cancelText: 'Cancel',
                                  confirmText: 'Confirm',
                                  builder: (context, child) {
                                    return Theme(
                                      data: ThemeData.light().copyWith(
                                        colorScheme: const ColorScheme.light(
                                          primary: Color(0xFF00B79B),
                                        ),
                                      ),
                                      child: child!,
                                    );
                                  },
                                  initialDatePickerMode: DatePickerMode.day,
                                );
                                if (selectedDate != null) {
                                  setState(() {
                                    dateOfBirth =
                                    selectedDate.toString().split(" ")[0];
                                    dobController.text = dateOfBirth;
                                  });
                                }
                              },
                              keyboardType: TextInputType.datetime,
                              controller: dobController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.date_range),
                                labelText: "Date of Birth",
                              ),
                            ),
                            const SizedBox(height: 10),
                            DropdownButtonFormField<String>(
                              value: stateValue,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.location_on),
                                labelText: "State",
                              ),
                              onChanged: (value) {
                                setState(() {
                                  stateValue = value!;
                                  // Reset cityValue when state is changed
                                  cityValue = '';
                                });
                              },
                              items: uniqueStates.isEmpty
                                  ? []
                                  : uniqueStates
                                  .map((stateName) => DropdownMenuItem<String>(
                                value: stateName,
                                child: Text(stateName),
                              ))
                                  .toList(),
                            ),
                            const SizedBox(height: 10),
                            DropdownButtonFormField<String>(
                              value: cityValue,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.location_city),
                                labelText: "City",
                              ),
                              onChanged: (value) {
                                setState(() {
                                  cityValue = value!;
                                });
                              },
                              items: cities
                                  .where((city) => city.stateName == stateValue)
                                  .map((city) => DropdownMenuItem<String>(
                                value: city.cityName,
                                child: Text(city.cityName),
                              ))
                                  .toList(),
                            ),
                            const SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  try {
                                    // Upload the image first if it's not null
                                    if (_image != null) {
                                      await api.uploadImage(_image!);
                                    }
                                    var response = await api.updateUser(
                                      uid,
                                      profile,
                                      name,
                                      email,
                                      mobileNumber,
                                      selectedGender,
                                      dateOfBirth,
                                      stateValue,
                                      cityValue,
                                    );
                                    if (response.success == 1) {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text("Success"),
                                            content: const Text("Your profile was updated successfully."),
                                            actions: <Widget>[
                                              TextButton(
                                                child: const Text("Close"),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    } else {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text("Error"),
                                            content: const Text("Failed to update your profile."),
                                            actions: <Widget>[
                                              TextButton(
                                                child: const Text("Close"),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }
                                  } catch (e) {
                                    if (kDebugMode) {
                                      print('Error: $e');
                                    }
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text("Error"),
                                          content: const Text("An error occurred while updating your profile."),
                                          actions: <Widget>[
                                            TextButton(
                                              child: const Text("Close"),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                }
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  const Color(0xFF00B79B),
                                ),
                              ),
                              child: const Text(
                                "Save",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
