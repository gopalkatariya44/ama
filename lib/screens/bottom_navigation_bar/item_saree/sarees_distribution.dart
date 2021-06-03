import 'package:ama/screens/bottom_navigation_bar/item_saree/sarees_distribute_with_employees.dart';
import 'package:flutter/material.dart';

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
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(3))),
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text("-- Distribute Sarees --",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12,bottom: 12,left: 4,right: 4),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Quantity",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(widget.size.toString(),style: TextStyle(color: Colors.red)),
                    ],
                  ),
                  //add Employee for Distributes saree

                  CircleAvatar(
                    backgroundColor: Colors.green,
                    child: IconButton(
                      onPressed: () {
                        showSearch(
                          context: context,
                          delegate: SareesDistributeWithEmployees(),
                        );
                      },
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            elevation: 10,
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
                              'User 1',
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("Qty: " +widget.size.toString(),style: TextStyle(color: Colors.red),),
                        SizedBox(height: 5),
                        Text("\u{20B9} " +(widget.prise*widget.size).toString(),style: TextStyle(color: Colors.green)),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
