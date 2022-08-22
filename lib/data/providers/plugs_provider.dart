import 'package:bungie_api/models/destiny_character_component.dart';
import 'package:bungie_api/models/destiny_item_plug.dart';
import 'package:bungie_api/models/destiny_plug_sets_component.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quria/data/models/providers/helpers.dart/inspect_helper.dart';
import 'package:quria/data/models/providers/plugs.model.dart';
import 'package:quria/data/providers/characters_provider.dart';

class PlugsNotifier extends StateNotifier<PlugsModel> {
  PlugsNotifier() : super(const PlugsModel());
  void reset() {
    state = state.copyWith(
      profilePlugSets: {},
      characterPlugSets: {},
    );
  }

  void setProfilePlugSets(Map<String, List<DestinyItemPlug>> profilePlugSets) {
    state = state.copyWith(
      profilePlugSets: profilePlugSets,
    );
  }

  void setCharacterPlugSets(Map<String, DestinyPlugSetsComponent> characterPlugSets) {
    state = state.copyWith(
      characterPlugSets: characterPlugSets,
    );
  }
}

final plugsProvider = StateNotifierProvider<PlugsNotifier, PlugsModel>((ref) => PlugsNotifier());

final plugsByCharacterProvider = StateProviderFamily<Map<String, List<DestinyItemPlug>>, String?>(
  (ref, characterId) => ref.watch(
    plugsProvider.select(
      (value) => value.characterPlugSets[characterId]?.plugs ?? {},
    ),
  ),
);

final plugsGetCharacterPlugSetProvider = StateProviderFamily<List<DestinyItemPlug>, CharacterAndPlug>((ref, helper) {
  return ref.watch(plugsByCharacterProvider(helper.characterId).select((value) => value[helper.plugSetHash] ?? []));
});

final plugsProfilePlugSetProvider = StateProviderFamily<List<DestinyItemPlug>, int>(
  (ref, plugSetHash) => ref.watch(
    plugsProvider.select(
      (value) => value.profilePlugSets[plugSetHash] ?? [],
    ),
  ),
);

final plugsSetsProvider = StateProviderFamily<List<DestinyItemPlug>, int>((ref, plugSetHash) {
  final List<DestinyItemPlug> plugs = ref.watch(plugsProfilePlugSetProvider(plugSetHash)) ?? [];
  final List<DestinyCharacterComponent> characters = ref.watch(charactersProvider);
  for (final character in characters) {
    plugs
        .addAll(ref.watch(plugsByCharacterProvider(character.characterId).select((value) => value[plugSetHash] ?? [])));
  }
  return plugs;
});
