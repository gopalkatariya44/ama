import 'package:ama/modal/sarees/sarees_distribute/sarees_distributechanger.dart';
import 'package:ama/screens/bottom_navigation_bar/item_saree/sarees_distribute_with_employees.dart';
import 'package:flutter/material.dart';
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
            padding:
                const EdgeInsets.only(top: 12, bottom: 12, left: 4, right: 4),
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
                      Text(widget.size.toString(),
                          style: TextStyle(color: Colors.red)),
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
          Divider(),

          // Container(
          //   child: Container(
          //     width: double.infinity,
          //     height: 70,
          //     child: Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Row(
          //             children: [
          //               Image.asset(
          //                 'assets/images/as.png',
          //                 fit: BoxFit.cover,
          //                 cacheHeight: 50,
          //                 cacheWidth: 50,
          //               ),
          //               SizedBox(width: 25),
          //               Column(
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 mainAxisAlignment: MainAxisAlignment.center,
          //                 children: [
          //                   Text(
          //                     'User 1',
          //                     style: TextStyle(
          //                       fontSize: 17,
          //                     ),
          //                   ),
          //                   SizedBox(height: 5),
          //                   Text(
          //                     'Description',
          //                     style: TextStyle(
          //                       fontSize: 12,
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             ],
          //           ),
          //           Column(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             crossAxisAlignment: CrossAxisAlignment.end,
          //             children: [
          //               Text("Qty: " +widget.size.toString(),style: TextStyle(color: Colors.red),),
          //               SizedBox(height: 5),
          //               Text("\u{20B9} " +(widget.prise*widget.size).toString(),style: TextStyle(color: Colors.green)),
          //             ],
          //           )
          //         ],
          //       ),
          //     ),
          //   ),
          // ),

          AddEmployee(),
        ],
      ),
    );
  }
}

class AddEmployee extends StatelessWidget {
  const AddEmployee({Key? key}) : super(key: key);

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
            Text("No user please add some"),
          ],
        ),
      );
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          if (sareesDistributeProvider == null) CircularProgressIndicator(),
          if (sareesDistributeProvider.sareesdistribute.isNotEmpty)
            Expanded(
              child: ListView.builder(itemBuilder: (ctx, index) {
                return ListTile(
                  title: Text(sareesDistributeProvider.sareesdistribute[index]!.name),
                );
              }),
            ),
        ],
      ),
    );
  }
}
