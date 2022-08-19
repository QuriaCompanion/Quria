import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:quria/data/models/BuildStored.model.dart';
import 'package:quria/data/models/Item.model.dart';

class CreateBuildProvider with ChangeNotifier {
  final List<Item> _items = [];
  String? _name;
  String? _id;
  List<Item> get items => _items;
  String? get name => _name;
  String? get id => _id;

  Item? getEquippedItemByBucket(int bucketHash) {
    return _items.firstWhereOrNull((item) => item.isEquipped && item.bucketHash == bucketHash);
  }

  void addItem(Item item) {
    _items.add(item);
    notifyListeners();
  }

  void replaceItems(List<Item> items) {
    _items.clear();
    _items.addAll(items);
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
    _id = null;
    _name = null;
    _items.clear();
    _items.addAll(items);
    notifyListeners();
  }

  void modifyBuild(BuildStored buildStored) {
    _items.clear();
    _items.addAll(buildStored.items);
    _name = buildStored.name;
    _id = buildStored.id;
    notifyListeners();
  }

  void clear() {
    _items.clear();
    _id = null;
    _name = null;
    notifyListeners();
  }
}
