import 'package:ama/modal/employees/employees.dart';
import 'package:ama/modal/sarees/sarees_distribute/sarees_distributechanger.dart';
import 'package:ama/screens/bottom_navigation_bar/item_saree/sarees_distribution/sarees_distribute_with_employees.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class SareesDistribution extends StatefulWidget {
  double size;
  double prise;
  SareesDistribution({required this.size, required this.prise});
  @override
  _SareesDistributionState createState() => _SareesDistributionState();
}

class _SareesDistributionState extends State<SareesDistribution> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(child: AddEmployee()),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Quantity :  ",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(widget.size.toString(),
                        style: TextStyle(color: Colors.red)),
                    Text(" left",style: TextStyle(fontSize: 7),)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
        mini: true,
        tooltip: 'add Users',
        onPressed: () {
          showSearch(
            context: context,
            delegate: SareesDistributeWithEmployees(),
            //add Employee for Distributes saree
          );
        },
      ),
    );
  }
}

class AddEmployee extends StatefulWidget {
  Employees? employee;
  AddEmployee({Key? key, this.employee}) : super(key: key);

  @override
  _AddEmployeeState createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  @override
  Widget build(BuildContext context) {
    var sareesDistributeProvider =
        Provider.of<SareesDistributeChanger?>(context);
    if (sareesDistributeProvider!.sareesdistribute.isEmpty)
      return Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Distribute Saree"),
          ],
        ),
      );

    return Column(
      children: [
        if (sareesDistributeProvider == null) CircularProgressIndicator(),
        if (sareesDistributeProvider.sareesdistribute.isNotEmpty)
          Expanded(
            child: ListView.builder(
              itemCount: sareesDistributeProvider.sareesdistribute.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (ctx, index) {
                return Slidable(
                  actionPane: SlidableDrawerActionPane(),
                  actionExtentRatio: 0.25,
                  actions: [
                    IconSlideAction(
                      caption: 'Edit',
                      color: Colors.blue,
                      icon: Icons.edit,
                      onTap: () {},
                    ),
                  ],
                  closeOnScroll: true,
                  secondaryActions: <Widget>[
                    IconSlideAction(
                      caption: 'Delete',
                      color: Colors.red,
                      icon: Icons.delete,
                      onTap: () {},
                    ),
                  ],
                  key: UniqueKey(),
                  child: ListTile(
                    leading: CircleAvatar(),
                    title: Text(sareesDistributeProvider.sareesdistribute[index]!.name),
                    // subtitle: Text("data"),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Qty: " +
                              sareesDistributeProvider
                                  .sareesdistribute[index]!.size
                                  .toString(),
                          style: TextStyle(color: Colors.red, fontSize: 15),
                        ),
                        SizedBox(height: 3),
                        Text(
                          "Rs: \u{20B9} " +
                              sareesDistributeProvider
                                  .sareesdistribute[index]!.price
                                  .toString(),
                          style: TextStyle(color: Colors.green, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}
