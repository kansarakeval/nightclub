import 'package:flutter/material.dart';
import 'package:nightclub/services/api_call.dart';
import 'package:nightclub/models/reg.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final Apicall api = Apicall();
  final _addFormKey = GlobalKey<FormState>();

  final _unameController = TextEditingController();
  final _ucontactnoController = TextEditingController();
  final _uemailController = TextEditingController();
  final _upswController = TextEditingController();

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void showmsg() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Snackbar appears at botton Sending Message",
          style: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          )),
      backgroundColor: Colors.deepOrange,
    ));

    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => SecondView()),
    // );
  }

  final dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //GlobalKey<CSCPickerState> _cscPickerKey = GlobalKey();
    GlobalKey<FormState> _formKey = GlobalKey();

    final GlobalKey<FormState> _form = GlobalKey<FormState>();
    final TextEditingController _pass = TextEditingController();
    final TextEditingController _confirmPass = TextEditingController();

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Create New Account",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade900),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: _unameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person),
                        labelText: "User Name"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: _uemailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                      labelText: "Email",
                      hintText: 'Enter Your Email Id',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: _ucontactnoController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.phone),
                        labelText: "Phone No."),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: _upswController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.password),
                      labelText: "Password",
                      suffixIcon: Icon(Icons.remove_red_eye),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.password),
                        labelText: 'Confirm Password',
                        // suffixIcon: IconButton(
                        //     icon: Icon(
                        //         _isObscure ? Icons.visibility : Icons.visibility_off),
                        //     onPressed: () {
                        //       setState(() {
                        //         _isObscure = !_isObscure;
                        //       });
                        //     })
                      ),
                      validator: (val) {
                        if (val!.isEmpty) return 'Empty';
                        if (val != _pass.text) return 'Not Match';
                        return null;
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          api.createRegistration(Registration(
                              u_name: _unameController.text.toString(),
                              u_contactno: _ucontactnoController.text.toString(),
                              u_email: _uemailController.text.toString(),
                              u_psw: _upswController.text.toString()));
                          Navigator.pop(context);
                        },
                        child: const Text("Sign up"),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "or continue with",
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/img/facebook.png",
                        fit: BoxFit.cover,
                        height: 30,
                        width: 30,
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Image.asset(
                        "assets/img/google.png",
                        fit: BoxFit.cover,
                        height: 30,
                        width: 30,
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Image.asset(
                        "assets/img/apple.png",
                        fit: BoxFit.cover,
                        height: 30,
                        width: 30,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Alroady have on account?",
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Sign in",
                            style: TextStyle(color: Colors.blue.shade900),
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
