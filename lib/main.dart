import 'package:ama/modal/employees/employeeschanger.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

import 'modal/sarees/sareeschanger.dart';
import './resources/routes.dart';
import './screens/screens.dart'
    show MaterialsChanger, MyHomePage, NotificationsScreen, SareesDistributeChanger, SplashScreen;
import './ama_theme.dart';

void main() async{
  await initializeDateFormatting("en_IN").then((value) => runApp(MyApp()));
  
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SareesChanger?>(
          create: (context) => SareesChanger(),
        ),
        ChangeNotifierProvider<Employeeschanger?>(
          create: (context) => Employeeschanger(),
        ),
        ChangeNotifierProvider<MaterialsChanger?>(
          create: (context) => MaterialsChanger(),
        ),
        ChangeNotifierProvider<SareesDistributeChanger?>(
          create: (context) => SareesDistributeChanger(),
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
