import 'package:ama/modal/employees/employees.dart';
import 'package:flutter/material.dart';

class EmployeeDetails extends StatefulWidget {
  Employees? employee;
  EmployeeDetails({Key? key,required this.employee}) : super(key: key);

  @override
  _EmployeeDetailsState createState() => _EmployeeDetailsState();
}

class _EmployeeDetailsState extends State<EmployeeDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.employee!.name),
      ),
      body: Container(),
    );
  }
}
