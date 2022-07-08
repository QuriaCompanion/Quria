import 'package:bungie_api/models/destiny_item_plug.dart';
import 'package:bungie_api/models/destiny_plug_sets_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:quria/data/providers/characters_provider.dart';

class PlugsProvider with ChangeNotifier {
  Map<String, List<DestinyItemPlug>> _profilePlugSets = {};
  Map<String, DestinyPlugSetsComponent> _characterPlugSets = {};
  Map<String, List<DestinyItemPlug>> get profilePlugSets => _profilePlugSets;
  Map<String, DestinyPlugSetsComponent>? get profileCharacterPlugSets => _characterPlugSets;

  void setProfilePlugSets(Map<String, List<DestinyItemPlug>> profilePlugSets) {
    _profilePlugSets = profilePlugSets;
    notifyListeners();
  }

  void reset() {
    _profilePlugSets = {};
    _characterPlugSets = {};
    notifyListeners();
  }

  void setCharacterPlugSets(Map<String, DestinyPlugSetsComponent> characterPlugSets) {
    _characterPlugSets = characterPlugSets;
    notifyListeners();
  }

  List<DestinyItemPlug>? getCharacterPlugSets(String characterId, int plugSetHash) {
    var plugs = _characterPlugSets[characterId]?.plugs;
    if (plugs?.containsKey("$plugSetHash") ?? false) {
      return plugs?["$plugSetHash"];
    }
    return null;
  }

  List<DestinyItemPlug>? getProfilePlugSets(int plugSetHash) {
    if (_profilePlugSets.containsKey("$plugSetHash")) {
      return _profilePlugSets["$plugSetHash"];
    }
    return null;
  }

  List<DestinyItemPlug> getPlugSets(BuildContext context, int plugSetHash) {
    List<DestinyItemPlug> plugs = [];
    plugs.addAll(getProfilePlugSets(plugSetHash) ?? []);
    var characters = Provider.of<CharactersProvider>(context, listen: false).characters;
    for (var c in characters) {
      plugs.addAll(getCharacterPlugSets(c.characterId!, plugSetHash) ?? []);
    }
    return plugs;
  }
}
