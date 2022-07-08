import 'package:flutter/cupertino.dart';
import 'package:quria/data/models/BuildResponse.model.dart';

class InspectBuildProvider with ChangeNotifier {
  Build? _build;
  Build? get build => _build;

  setSelectedBuild(Build build) {
    _build = build;
    notifyListeners();
  }
}
