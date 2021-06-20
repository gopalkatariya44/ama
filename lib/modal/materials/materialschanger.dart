import 'materials.dart';
import 'package:flutter/foundation.dart';

class MaterialsChanger with ChangeNotifier {
  List<Materials?> materials  = [];

  void addMaterial(Materials? material) {
    materials.add(material);
    notifyListeners();
  }
   double total() {
    double sum = 0;
    materials.forEach((saree) {
      sum = sum + (saree!.price * saree.size);
    });
    return sum;
  }
}
