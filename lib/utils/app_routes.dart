import 'package:flutter/material.dart';
import 'package:nightclub/screen/events/view/events_screen.dart';
import 'package:nightclub/screen/forget/view/forgetpassword_screen.dart';
import 'package:nightclub/screen/home/view/home_screen.dart';
import 'package:nightclub/screen/interests/interests_screen.dart';
import 'package:nightclub/screen/location/view/location_screen.dart';
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
  'event': (context) => const EventsScreen(),
  'interests': (context) => const InterestsScreen(),
  'location': (context) => const LocationScreen(),
};