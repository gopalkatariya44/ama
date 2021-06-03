import 'package:ama/modal/employees/employees.dart';
import 'package:flutter/material.dart';

class AdduserDistributeSarees extends StatefulWidget {
  Employees? user;
  AdduserDistributeSarees({Key? key, required this.user}) : super(key: key);

  @override
  _AdduserDistributeSareesState createState() =>
      _AdduserDistributeSareesState();
}

class _AdduserDistributeSareesState extends State<AdduserDistributeSarees> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user!.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Quantity",
                    hintText: "Enter Quantity here",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Prise",
                    hintText: "Enter Prise here",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 45,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 8,
                      shape: const BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(3)),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Add User",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
