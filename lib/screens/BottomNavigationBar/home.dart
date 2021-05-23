import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        offset: const Offset(2.0, 2.0),
                        blurRadius: 10.0,
                        spreadRadius: 2.0), //BoxShadow
                    BoxShadow(
                        color: Colors.white,
                        offset: const Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0)
                  ],
                  border: Border.all(
                      color: Colors.green,
                      width: 4.0,
                      style: BorderStyle.none) //Border.all

                  ),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Add Item")
                ],
              ),
            ),
            onTap: () {},
          )
        
        ],
      ),
    );
  }
}
