import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
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
                  const Text(
                    "Forget Passsword",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Color(0xFF00B79B)),
                  ),
                  const SizedBox(
                    height: 30,
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
                  const TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.password),
                      labelText: "Canform Passwored",
                      suffixIcon: Icon(Icons.remove_red_eye),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(onPressed: () {
                        Navigator.pop(context);
                      }, child: const Text("continue",style: TextStyle(color: Color(0xFF00B79B))),),),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
