import 'package:ama/modal/materials/materialschanger.dart';
import 'package:ama/modal/sarees/sareeschanger.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ActualProfit extends StatelessWidget {
  const ActualProfit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var materialProvider = Provider.of<MaterialsChanger?>(context);
    var sareeProvider = Provider.of<SareesChanger?>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Actual Profit"),
      ),
      body: Center(
        child: Container(
          child: Text(
            (sareeProvider!.actualProfit() - materialProvider!.total())
                .toString(),
          ),
        ),
      ),
    );
  }
}
