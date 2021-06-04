import 'package:ama/modal/employees/employeeschanger.dart';
import 'package:ama/screens/bottom_navigation_bar/Employees/employee_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmployeesData extends StatefulWidget {
  @override
  _EmployeesDataState createState() => _EmployeesDataState();
}

class _EmployeesDataState extends State<EmployeesData> {
  @override
  Widget build(BuildContext context) {
    var employeeProvider = Provider.of<Employeeschanger?>(context);

    if (employeeProvider!.employee.isEmpty)
      return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("No Users Available add some"),
            // GestureDetector(
            //   child: Icon(
            //     Icons.add,
            //     size: 50,
            //   ),
            //   onTap: () {},
            // ),
          ],
        ),
      );

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          if (employeeProvider == null) CircularProgressIndicator(),
          if (employeeProvider.employee.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: employeeProvider.employee.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (ctx, index) {
                  return GestureDetector(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.green,
                      ),
                      title: Text(employeeProvider.employee[index].name),
                      subtitle: Text(employeeProvider.employee[index].saree),
                      trailing: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Qty: " + employeeProvider.employee[index].quantity,
                            style: TextStyle(color: Colors.red, fontSize: 15),
                          ),
                          SizedBox(height: 3),
                          Text(
                            "Rs: \u{20B9} " +
                                employeeProvider.employee[index].price,
                            style: TextStyle(color: Colors.green, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => EmployeeDetails(
                            employee: employeeProvider.employee[index],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
