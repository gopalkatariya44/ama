import 'package:ama/modal/sarees/sarees_distribute/sarees_distribute.dart';
import 'package:flutter/material.dart';

class SareesDistributeChanger with ChangeNotifier {
  List<SareesDistribute?> sareesdistribute = [];

  void addSareesDistribute(SareesDistribute? sareedistribute) {
    sareesdistribute.add(sareedistribute);
    notifyListeners();
  }
}
