

import 'package:flutter/material.dart';


import 'chat.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        child: Container(
          child: Container(
            width: double.infinity,
            height: 70,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
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
                              fontSize: 17,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Description',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => Chat(),
            ),
          );
        },
      ),
    );
  }
}
