import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:quria/data/models/BuildStored.model.dart';
import 'package:quria/data/models/Item.model.dart';

class DetailsBuildProvider with ChangeNotifier {
  BuildStored? _buildStored;
  BuildStored? get buildStored => _buildStored;

  Item? getEquippedItemByBucket(int bucketHash) {
    return _buildStored?.items.firstWhereOrNull((item) => item.isEquipped && item.bucketHash == bucketHash);
  }

  void inspectBuild(BuildStored buildStored) {
    _buildStored = buildStored;
    notifyListeners();
  }

  void clear() {
    _buildStored = null;
    notifyListeners();
  }
}
