import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 10),
      () {
        Navigator.pushReplacementNamed(context, 'login');
      },
    );
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/img/logo.png',
                width: MediaQuery.sizeOf(context).width*0.90,
                height: MediaQuery.sizeOf(context).height*0.90,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
