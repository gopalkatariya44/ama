import 'package:ama/resources/routes.dart';
import 'package:ama/screens/drawer.dart';
import 'package:ama/screens/search_screen.dart';
import 'package:flutter/material.dart';

import 'addsaree.dart';
import 'screens.dart' show HomePage, EmployeesData, ChatScreen, Calculator;

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  List<Map<String, dynamic>> _widgetOptions = [
    {
      'title': "Manager",
      'page': HomePage(),
    },
    {
      'title': "Employees Data",
      'page': EmployeesData(),
    },
    {
      'title': "Chats",
      'page': ChatScreen(),
    },
    {
      'title': "Calculator",
      'page': Calculator(),
    },
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_widgetOptions[_selectedIndex]['title']), //app title
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications, // search button
            ),
            onPressed: () {
              Navigator.pushNamed(
                context,
                Routes.notificationScreen,
              );
            },
          ),
          IconButton(
            icon: Icon(
              Icons.search, // search button
            ),
            onPressed: () {
              showSearch(
                context: context,
                delegate: SearchBar(),
              );
            },
          ),
          IconButton(
            icon: Icon(
              Icons.add, // search button
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AddSareeScreen(),
                ),
              );
            },
          ),
        ],
      ),
      drawer: DrawerItem(),
      body: _widgetOptions[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.switch_account),
            label: 'Employees',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_outlined),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Calculator',
          ),
        ],
        currentIndex: _selectedIndex,
        elevation: 10,
        unselectedItemColor: Colors.green[200],
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),
    );
  }
}