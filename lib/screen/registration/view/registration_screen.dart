import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
                  Text(
                    "Create New Account",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.blue.shade900),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.email),
                        labelText: "Email"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.password),
                      labelText: "Passwored",
                      suffixIcon: Icon(Icons.remove_red_eye),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Forget the password?",
                      style: TextStyle(fontSize: 15, color: Colors.blue.shade900),
                    ),
                  ),
                  SizedBox(height: 20,),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(onPressed: () {
                        Navigator.pop(context);
                      }, child: Text("Sign up"),)),
                  SizedBox(height: 20,),
                  Text(
                    "or continue with",
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/img/facebook.png",fit: BoxFit.cover,height: 30,width: 30,),
                      SizedBox(width: 30,),
                      Image.asset("assets/img/google.png",fit: BoxFit.cover,height: 30,width: 30,),
                      SizedBox(width: 30,),
                      Image.asset("assets/img/apple.png",fit: BoxFit.cover,height: 30,width: 30,),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Alroady have on account?",style: TextStyle(color: Colors.grey),),
                      SizedBox(width: 10,),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                          child: Text("Sign in",style: TextStyle(color: Colors.blue.shade900),)),
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
