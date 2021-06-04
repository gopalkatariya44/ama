import 'package:ama/modal/employees/employees.dart';
import 'package:flutter/material.dart';

class Employeeschanger with ChangeNotifier {
  List<Employees> employee = [
    Employees(name: "Gopal", description: "Some", quantity: '99', price: '2', saree: 'red sare 300'),
    Employees(name: "parth", description: "Something’s", quantity: '55', price: '5', saree: 'white saree 500'),
    Employees(name: "Jainam", description: "some.....", quantity: '88', price: '6.9', saree: 'Purple saree 022'),
  ];
  void addEmployees(Employees emp) {
    employee.add(emp);
    notifyListeners();
  }
}
