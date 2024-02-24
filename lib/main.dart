import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nightclub/screen/home/provider/home_provider.dart';
import 'package:nightclub/screen/location/provider/location_provider.dart';
import 'package:nightclub/utils/app_routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: HomeProvider()),
          ChangeNotifierProvider.value(value: LocationProvider()),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(useMaterial3: true),
            routes: app_Routes,
          ),
      ));
}
