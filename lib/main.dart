import 'package:ama/ama_theme.dart';
import 'package:ama/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './modal/sareeschanger.dart';
import './resources/routes.dart';
import './screens/screens.dart' show SplashScreen, NotificationsScreen;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SareesChanger?>(
          create: (context) => SareesChanger(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Manager',
        themeMode: ThemeMode.system,
        theme: AmaThemeData.lightThemeData,
        darkTheme: AmaThemeData.darkThemeData,
        home: SplashScreen(),
        routes: {
          Routes.homeScreen: (context) => MyHomePage(),
          Routes.notificationScreen: (context) => NotificationsScreen(),
        },
      ),
    );
  }
}
