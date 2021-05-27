import 'dart:async';
import 'package:flutter/material.dart';
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
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        color: Colors.green,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ClipOval(
                  child: Image.asset(
                    'assets/images/as1.jpg',
                    fit: BoxFit.cover,
                    width: 400,
                    height: 400,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ClipOval(
                      child: Image.asset(
                        'assets/images/as1.jpg',
                        fit: BoxFit.cover,
                        width: 100,
                        height: 100,
                      ),
                    ),
                    ClipOval(
                      child: Image.asset(
                        'assets/images/as1.jpg',
                        fit: BoxFit.cover,
                        width: 30,
                        height: 30,
                      ),
                    ),
                  ],
                ),
                ClipOval(
                  child: Image.asset(
                    'assets/images/as1.jpg',
                    fit: BoxFit.cover,
                    width: 50,
                    height: 50,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
