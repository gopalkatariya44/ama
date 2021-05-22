import 'package:ama/screens/chat_screen.dart';
import 'package:ama/screens/drawer.dart';
import 'package:ama/screens/home.dart';
import 'package:ama/screens/notifications_screen.dart';
import 'package:ama/screens/profile_page.dart';
import 'package:ama/screens/search_screen.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, initialIndex: 0, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // sliders Different screen
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.green,
          tabs: [
            Tab(text: "Home", /*icon: Icon(Icons.home)*/),
            Tab(text: "Chat", /*icon: Icon(Icons.home)*/),
            Tab(text: "Notifications", /*icon: Icon(Icons.home)*/),
          ],
        ),
        title: Text(widget.title), //app title
        actions: [
          IconButton(
            icon: Icon(
              Icons.search, // search button
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchBar()));
            },
          ),
        ],
      ),
      drawer: DrawerItem(),
      body: TabBarView(
        
        controller: _tabController,
        children: [
          HomePage(),
          ChatScreen(),
          NotificationsScreen(),
        ],
      ),
    );
  }
}
