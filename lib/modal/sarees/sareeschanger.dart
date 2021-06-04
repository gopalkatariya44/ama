import 'package:ama/modal/sarees/sarees.dart';
import 'package:flutter/cupertino.dart';

class SareesChanger with ChangeNotifier {
  List<Sarees?> sarees = [];

  void addSaree(Sarees? saree) {
    sarees.add(saree);
    notifyListeners();
  }

  void removeSaree(int index) {
    sarees.removeAt(index);
    notifyListeners();
  }

  double actualProfit() {
    double profit = 0;
    sarees.forEach((saree) {
      profit = profit + (saree!.price * saree.size);
    });
    return profit;
  }
}
