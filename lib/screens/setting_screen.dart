import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Setting"),
      ),
      body: Column(
        children: [
          Card(
            color: Colors.red,
            child: Text("data"),
          ),
        ],
      ),
    );
  }
}
