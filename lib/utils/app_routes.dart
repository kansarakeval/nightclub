import 'package:flutter/material.dart';
import 'package:nightclub/screen/book%20event/view/book_event_screen.dart';
import 'package:nightclub/screen/booking%20detail/view/booking_detail_screen.dart';
import 'package:nightclub/screen/cancel%20booking/view/cancel_booking_screen.dart';
import 'package:nightclub/screen/dash/view/dash_screen.dart';
import 'package:nightclub/screen/eventdetail/view/event_detail_screen.dart';
import 'package:nightclub/screen/events/view/events_screen.dart';
import 'package:nightclub/screen/forget/view/forgetpassword_screen.dart';
import 'package:nightclub/screen/home/view/home_screen.dart';
import 'package:nightclub/screen/interests/view/interests_screen.dart';
import 'package:nightclub/screen/like/view/like_screen.dart';
import 'package:nightclub/screen/location/view/location_screen.dart';
import 'package:nightclub/screen/login/view/login_Screen.dart';
import 'package:nightclub/screen/notification/view/notification_screen.dart';
import 'package:nightclub/screen/pay/view/pay_screen.dart';
import 'package:nightclub/screen/profile/view/profile_screeen.dart';
import 'package:nightclub/screen/profileDetails/view/profile_page_screen.dart';
import 'package:nightclub/screen/registration/view/registration_screen.dart';
import 'package:nightclub/screen/splash/view/splash_screen.dart';
import 'package:nightclub/screen/tickets/view/cancelled_screen.dart';
import 'package:nightclub/screen/tickets/view/completed_screen.dart';
import 'package:nightclub/screen/tickets/view/ticket_screen.dart';
import 'package:nightclub/screen/tickets/view/upcoming_screen.dart';

Map<String, WidgetBuilder> app_Routes = {
  '/': (context) => const SplashScreen(),
  'registration':(context) => const RegistrationScreen(),
  'login':(context) => const LoginScreen(),
  'forget':(context) => const ForgetPasswordScreen(),
  'dash': (context) => const DashScreen(),
  'home':(context) => const HomeScreen(),
  'profile':(context) => const ProfileScreen(),
  'event': (context) => const EventsScreen(),
  'interests': (context) => const InterestsScreen(),
  'location': (context) => const LocationScreen(),
  'eventdetail':(context) => const EventDetailScreen(),
  'bookevent':(context) => const BookEventScreen(),
  'bookdetail':(context) => const BookingDetailScreen(),
  'pay':(context) => const PayScreen(),
  'notification': (context) => const NotificationScreen(),
  'ticket':(context) => const TicketScreen(),
  'upcoming':(context) => const UpcomingScreen(),
  'completed':(context) => const CompletedScreen(),
  'cancelled':(context) => const CancelledScreen(),
  'like': (context) => const LikeScreen(),
  'profilepage':(context) => const ProfilePageScreen(),
  'cancel':(context) => const CancelBookingScreen(),
};