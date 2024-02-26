import 'package:flutter/material.dart';
import 'package:gif_view/gif_view.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                  GifView.asset("assets/img/Sign in.gif",height: 200,width: 200,),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "Login to Your Account",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF00B79B)),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.email),
                        labelText: "Email"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.password),
                      labelText: "Passwored",
                      suffixIcon: Icon(Icons.remove_red_eye),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'forget');
                    },
                    child: const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Forget the password?",
                        style:
                            TextStyle(fontSize: 15, color: Color(0xFF00B79B)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, 'dash');
                      },
                      child: const Text(
                        "Sign in",
                        style: TextStyle(
                          color: Color(0xFF00B79B),
                        ),
                      ),
                    ),
                  ),
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
                        "Don't have on account?",
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, 'registration');
                          },
                          child: const Text(
                            "Sign up",
                            style: TextStyle(color: Color(0xFF00B79B)),
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
