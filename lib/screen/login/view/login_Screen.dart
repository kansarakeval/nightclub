import 'package:flutter/material.dart';
import 'package:gif_view/gif_view.dart';
import 'package:nightclub/services/api_call.dart';
import 'package:nightclub/models/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final Apicall api = Apicall();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String _errorText = '';

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? name = prefs.getString('name');
    if (name != null && name.isNotEmpty) {
      Navigator.pushReplacementNamed(context, 'dash');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GifView.asset(
                    "assets/img/Sign in.gif",
                    height: 200,
                    width: 200,
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Login to Your Account",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF00B79B),
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                      hintText: "Email",
                    ),
                  ),
                  if (_errorText.isNotEmpty)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        _errorText,
                        style: const TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.password),
                      hintText: "Password",
                      suffixIcon: Icon(Icons.remove_red_eye),
                    ),
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'forget');
                    },
                    child: const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Forgot the password?",
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF00B79B),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        var email = _emailController.text;
                        var password = _passwordController.text;
                        api
                            .createLogin(Login(
                          u_email: email,
                          u_psw: password,
                        ))
                            .then((res) async {
                          if (res == "1") {
                            final prefs = await SharedPreferences.getInstance();
                            await prefs.setString("email", email);
                            Navigator.pushReplacementNamed(context, 'dash');
                          } else {
                            setState(() {
                              _errorText = '*Email Address and Password Check';
                            });
                          }
                        });
                      },
                      child: const Text(
                        "Sign in",
                        style: TextStyle(
                          color: Color(0xFF00B79B),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account? ",
                        style: TextStyle(color: Colors.grey),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, 'registration');
                        },
                        child: const Text(
                          "Sign up",
                          style: TextStyle(color: Color(0xFF00B79B)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
