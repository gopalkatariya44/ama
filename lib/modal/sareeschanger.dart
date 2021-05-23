import 'package:ama/modal/sarees.dart';
import 'package:flutter/cupertino.dart';

class SareesChanger with ChangeNotifier {
  List<Sarees?> sarees = [];

  void addSaree(Sarees? saree) {
    sarees.add(saree);
    notifyListeners();
  }
}
