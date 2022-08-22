import 'package:collection/collection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quria/data/models/BuildStored.model.dart';
import 'package:quria/data/models/Item.model.dart';
import 'package:quria/data/models/providers/create_build.model.dart';

class CreateBuildNotifier extends StateNotifier<CreateBuildModel> {
  CreateBuildNotifier() : super(const CreateBuildModel());

  void addItem(Item item) {
    state.items.add(item);
  }

  void replaceItems(List<Item> items) {
    state.items.replaceRange(0, state.items.length, items);
  }

  void replaceItem(Item previousItem, Item item) {
    state.items.remove(previousItem);
    state.items.add(item);
  }

  void removeItem(Item item) {
    state.items.remove(item);
  }

  void setBuild(List<Item> items) {
    state.items.clear();
    state.items.addAll(items);
    state = state.copyWith(id: null, name: null, items: items);
  }

  void modifyBuild(BuildStored buildStored) {
    state.items.clear();
    state.items.addAll(buildStored.items);
    state = state.copyWith(id: null, name: null, items: state.items);
  }

  void clear() {
    state.items.clear();
    state = state.copyWith(id: null, name: null, items: state.items);
  }
}

final createBuildProvider =
    StateNotifierProvider<CreateBuildNotifier, CreateBuildModel>((ref) => CreateBuildNotifier());

final getEquippedItemByBucketProvider = StateProviderFamily<Item?, int>((ref, bucketHash) {
  return ref
      .watch(createBuildProvider.select((value) => value.items))
      .firstWhereOrNull((element) => element.bucketHash == bucketHash);
});
