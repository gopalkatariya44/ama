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
            width: MediaQuery.of(context).size.width,
            color: Colors.grey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text("-- Distribute Sarees --",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Quantity",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(widget.size.toString()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
