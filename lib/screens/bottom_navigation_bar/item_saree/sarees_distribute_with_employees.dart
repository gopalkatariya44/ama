import 'package:ama/modal/employees/employees.dart';
import 'package:ama/modal/employees/employeeschanger.dart';
import 'package:ama/screens/bottom_navigation_bar/item_saree/adduser_%20distribute_sarees.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SareesDistributeWithEmployees extends SearchDelegate {
  Employeeschanger? emp;
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    emp = Provider.of<Employeeschanger?>(context);

    return ListView.builder(
      itemCount: emp!.employee.length,
      itemBuilder: (ctx, index) => GestureDetector(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 8),
          child: Card(
            child: ListTile(
              leading: ClipOval(),
              title: Text(emp!.employee[index].name),
              subtitle: Text(emp!.employee[index].description),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
              ),
            ),
          ),
        ),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AdduserDistributeSarees(user: emp!.employee[index],),
          ));
        },
      ),
    );
  }
}
