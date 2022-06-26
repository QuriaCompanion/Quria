import 'package:flutter/cupertino.dart';
import 'package:quria/data/models/ArmorMods.model.dart';

class BuilderModsProvider with ChangeNotifier {
  List<ModSlots> _mods = [];
  List<ModSlots> get mods => _mods;

  void setMods(
    List<ModSlots> mods,
  ) {
    _mods = mods;
    notifyListeners();
  }

  void init(
    List<ModSlots> mods,
  ) {
    _mods = mods;
  }

  void reset() {
    _mods = [];
  }
}
