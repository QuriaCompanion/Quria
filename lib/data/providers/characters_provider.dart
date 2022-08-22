import 'package:bungie_api/models/destiny_character_component.dart';
import 'package:collection/collection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void setCurrentCharacter(int index, WidgetRef ref) {
  ref.read(charactersProvider).swap(0, index);
}

void init(Map<String, DestinyCharacterComponent>? characters, WidgetRef ref) {
  if (characters == null) {
    return;
  }
  List<DestinyCharacterComponent> list = characters.values.toList();
  list.sort((charA, charB) {
    DateTime dateA = DateTime.parse(charA.dateLastPlayed!);
    DateTime dateB = DateTime.parse(charB.dateLastPlayed!);
    return dateB.compareTo(dateA);
  });
  ref.read(charactersProvider.notifier).update((state) => state..replaceRange(0, state.length, list));
}

final charactersProvider = StateProvider<List<DestinyCharacterComponent>>((ref) => []);
