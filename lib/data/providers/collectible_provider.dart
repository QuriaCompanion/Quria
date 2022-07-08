import 'package:bungie_api/destiny2.dart';
import 'package:flutter/foundation.dart';

class CollectibleProvider with ChangeNotifier {
  DestinyProfileCollectiblesComponent? _profileCollectibles = DestinyProfileCollectiblesComponent();
  Map<String, DestinyCollectiblesComponent> _characterCollectibles = {};
  DestinyProfileCollectiblesComponent? get profilePlugSets => _profileCollectibles;
  Map<String, DestinyCollectiblesComponent> get profileCharacterPlugSets => _characterCollectibles;

  void setProfileCollectible(DestinyProfileCollectiblesComponent? profileCollectible) {
    _profileCollectibles = profileCollectible;
    notifyListeners();
  }

  void setCharacterCollectible(Map<String, DestinyCollectiblesComponent> characterCollectible) {
    _characterCollectibles = characterCollectible;
    notifyListeners();
  }

  void reset() {
    _profileCollectibles = null;
    _characterCollectibles = {};
    notifyListeners();
  }
}
