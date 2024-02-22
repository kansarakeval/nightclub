import 'package:flutter/material.dart';
import 'package:nightclub/screen/forget/view/forgetpassword_screen.dart';
import 'package:nightclub/screen/home/view/home_screen.dart';
import 'package:nightclub/screen/login/view/login_Screen.dart';
import 'package:nightclub/screen/registration/view/registration_screen.dart';
import 'package:nightclub/screen/setting/view/setting_screeen.dart';
import 'package:nightclub/screen/splash/view/splash_screen.dart';

Map<String, WidgetBuilder> app_Routes = {
  '/': (context) => const SplashScreen(),
  'registration':(context) => const RegistrationScreen(),
  'login':(context) => const LoginScreen(),
  'forget':(context) => const ForgetpasswordScreen(),
  'home':(context) => const HomeScreen(),
  'setting':(context) => const SettingScreeen(),

};