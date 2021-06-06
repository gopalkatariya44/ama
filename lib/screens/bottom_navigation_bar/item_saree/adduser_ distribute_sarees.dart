import 'package:ama/modal/employees/employees.dart';
import 'package:ama/modal/sarees/sarees_distribute/sarees_distribute.dart';
import 'package:ama/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdduserDistributeSarees extends StatefulWidget {
  Employees? user;
  AdduserDistributeSarees({Key? key, required this.user}) : super(key: key);

  @override
  _AdduserDistributeSareesState createState() =>
      _AdduserDistributeSareesState();
}

class _AdduserDistributeSareesState extends State<AdduserDistributeSarees> {
  late SareesDistributeChanger? sareesDistributeChanger;

  double? price;
  double? size;

  final key = GlobalKey<FormState>();

  void onSave() async {
    if (key.currentState!.validate()) {
      key.currentState!.save();

      await showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text("Confirm"),
          content: Text("Are you sure you want to add the product"),
          actions: [
            TextButton(
              onPressed: () async {
                sareesDistributeChanger!.addSareesDistribute(
                  new SareesDistribute(
                    price: price!,
                    size: size!,
                  ),
                );
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Text(
                "ADD",
              ),
            ),
            TextButton(
              onPressed: () {
                return Navigator.of(context).pop(false);
              },
              child: Text(
                "NO",
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    sareesDistributeChanger = Provider.of<SareesDistributeChanger?>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user!.name),
      ),
      body: Container(
        child: Form(
          key: key,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  key: UniqueKey(),
                  decoration: InputDecoration(
                    labelText: "Quantity",
                    border: OutlineInputBorder(),
                    hintText: "Enter Quantity",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter Quantity of saree";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    size = double.parse(value!);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  decoration: InputDecoration(
                    labelText: "Price",
                    hintText: "Enter Price of Saree",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter price of saree";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    price = double.parse(value!);
                  },
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
                    onPressed: () => onSave(),
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
