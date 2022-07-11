import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:quria/data/models/Item.model.dart';

class CreateBuildProvider with ChangeNotifier {
  final List<Item> _items = [];
  List<Item> get items => _items;

  Item? getEquippedItemByBucket(int bucketHash) {
    return _items.firstWhereOrNull((item) => item.isEquipped! && item.bucketHash == bucketHash);
  }

  void addItem(Item item) {
    _items.add(item);
    notifyListeners();
  }

  void replaceItem(Item previousItem, Item item) {
    _items.remove(previousItem);
    _items.add(item);
    notifyListeners();
  }

  void removeItem(Item item) {
    _items.remove(item);
    notifyListeners();
  }

  void setBuild(List<Item> items) {
    _items.clear();
    _items.addAll(items);
    notifyListeners();
  }
}
