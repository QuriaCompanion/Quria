import 'package:collection/collection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quria/data/models/BuildStored.model.dart';
import 'package:quria/data/models/Item.model.dart';

class DetailsBuildNotifier extends StateNotifier<BuildStored?> {
  DetailsBuildNotifier() : super(null);

  void inspectBuild(BuildStored buildStored) {
    state = buildStored;
  }

  void clear() {
    state = null;
  }
}

final detailsBuildProvider = StateNotifierProvider<DetailsBuildNotifier, BuildStored?>((ref) => DetailsBuildNotifier());

final detailBuildEquippedItemProvider = StateProviderFamily<Item?, int>((ref, bucketHash) {
  return ref.watch(detailsBuildProvider)?.items.firstWhereOrNull((element) => element.bucketHash == bucketHash);
});
