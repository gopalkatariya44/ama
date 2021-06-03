import 'package:ama/modal/employees/employees.dart';
import 'package:flutter/material.dart';

class Employeeschanger with ChangeNotifier {
  List<Employees> employee = [
    Employees(name: "Gopal", description: "Some", quantity: '99', price: '2'),
  ];
  void addEmployees(Employees emp) {
    employee.add(emp);
    notifyListeners();
  }
}
