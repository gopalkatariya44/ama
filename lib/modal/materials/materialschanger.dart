import 'materials.dart';
import 'package:flutter/foundation.dart';

class MaterialsChanger with ChangeNotifier {
  List<Materials?> materials  = [];

  void addMaterial(Materials? material) {
    materials.add(material);
    notifyListeners();
  }
}
