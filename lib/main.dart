import 'package:ama/screens/home_screen%20.dart';
import 'package:flutter/material.dart';

import '../routes.dart';
import '../screens/SplashScreen/splash_screen.dart';
import '../screens/notifications_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SplashScreen(),
      routes: {
        Routes.homeScreen: (context) => MyHomePage(),
        Routes.notificationScreen: (context) => NotificationsScreen(),
      },
    );
  }
}
