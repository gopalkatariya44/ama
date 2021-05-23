import 'package:flutter/material.dart';

class EmployeesData extends StatefulWidget {
  @override
  _EmployeesDataState createState() => _EmployeesDataState();
}

class _EmployeesDataState extends State<EmployeesData> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Column(
        children: [
          Container(
            color: Colors.green[200],
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/as.png',
                    fit: BoxFit.cover,
                    cacheHeight: 50,
                    cacheWidth: 50,
                  ),
                  SizedBox(width: 25),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Username',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
