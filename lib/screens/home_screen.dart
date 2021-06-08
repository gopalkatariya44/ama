import 'package:ama/resources/routes.dart';
import 'package:ama/screens/bottom_navigation_bar/item_material/addmaterials.dart';
import 'package:ama/screens/drawer.dart';
import 'package:ama/screens/bottom_navigation_bar/item_saree/sarees_search_screen.dart';
import 'package:flutter/material.dart';
import 'bottom_navigation_bar/item_material/materials_search_screen.dart';
import 'bottom_navigation_bar/item_saree/addsaree.dart';
import 'screens.dart'
    show Calculator, ChatScreen, EmployeesData, HomePage, MaterialScreen, SplashScreen;

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // bool isVisible = true;
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
      'title': "Martials",
      'page': MaterialScreen(),
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

  void _notification() {
    setState(
      () {
        Navigator.pushNamed(
          context,
          Routes.notificationScreen,
        );
      },
    );
  }

  void _logOut() {
    setState(
      () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => SplashScreen()));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_widgetOptions[_selectedIndex]['title']), //app title
        actions: [
          // Visibility(
          //   visible: _selectedIndex == 4 ? isVisible = false : isVisible,
          // child:
          IconButton(
            icon: Icon(
              Icons.search, // search button
            ),
            onPressed: () {
              showSearch(
                context: context,
                delegate: _selectedIndex == 3
                    ? MaterialSearchScreen()
                    : SareesSearchScreen(),
              );
            },
          ),
          // ),
          IconButton(
            icon: Icon(
              Icons.add, // search button
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => _selectedIndex == 3
                      ? AddMaterialScreen()
                      : AddSareeScreen(),
                ),
              );
            },
          ),

          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              PopupMenuItem(
                child: ListTile(
                  leading: Icon(Icons.notifications, color: Colors.green),
                  title: Text('Notifications'),
                  onTap: _notification,
                ),
              ),
              // const PopupMenuDivider(),
              PopupMenuItem(
                child: ListTile(
                  leading: Icon(Icons.logout, color: Colors.green),
                  title: Text('Logout'),
                  onTap: _logOut,
                ),
              ),
              const PopupMenuItem(
                child: ListTile(
                  leading: Icon(Icons.refresh,color: Colors.green,),
                  title: Text('Refresh'),
                ),
              ),
            ],
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
            icon: Icon(Icons.local_mall_outlined),
            label: 'Materials',
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
