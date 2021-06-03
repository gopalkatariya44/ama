import 'package:ama/screens/actual_profit.dart';
import 'package:ama/screens/setting_screen.dart';
import 'package:ama/screens/profile_page.dart';
import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(),
            child: GestureDetector(
              child: Row(
                children: [
                  ClipOval(
                    child: Image.asset(
                      'assets/images/as.png',
                      fit: BoxFit.cover,
                      height: 80,
                      width: 80,
                    ),
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Username',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'Status',
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(),
                  ),
                );
              },
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(),
                ),
              );
            },
          ),
          ListTile(
            leading: Text("\u{20B9}",style: TextStyle(fontSize: 28),),
            title: Text('Actual Profit'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ActualProfit(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.login_outlined),
            title: Text('Log Out'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
