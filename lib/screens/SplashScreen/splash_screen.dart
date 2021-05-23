import 'dart:async';

import 'package:ama/modal/sareeschanger.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../resources/routes.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(
        seconds: 1,
      ),
      () => Navigator.pushReplacementNamed(context, Routes.homeScreen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Image.asset(
        'assets/images/as1.jpg',
        scale: 10,
      ),
    );
  }
}
