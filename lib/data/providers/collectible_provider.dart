import 'package:bungie_api/destiny2.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quria/data/models/providers/collectible.model.dart';

class CollectibleNotifier extends StateNotifier<CollectibleModel> {
  CollectibleNotifier()
      : super(const CollectibleModel(
          profileCollectibles: null,
          characterCollectibles: {},
        ));
  void reset() {
    state = state.copyWith(
      profileCollectibles: null,
      characterCollectibles: {},
    );
  }

  void setProfileCollectible(DestinyProfileCollectiblesComponent? profileCollectible) {
    state = state.copyWith(
      profileCollectibles: profileCollectible,
    );
  }

  void setCharacterCollectible(Map<String, DestinyCollectiblesComponent> characterCollectibles) {
    state = state.copyWith(
      characterCollectibles: characterCollectibles,
    );
  }
}

final collectibleProvider =
    StateNotifierProvider<CollectibleNotifier, CollectibleModel>((ref) => CollectibleNotifier());
