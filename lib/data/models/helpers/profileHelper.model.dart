import 'package:bungie_api/models/destiny_character_component.dart';
import 'package:bungie_api/models/destiny_item_component.dart';

class ProfileHelper {
  final List<DestinyCharacterComponent> characters;
  final DestinyCharacterComponent selectedCharacter;
  final List<DestinyItemComponent> selectedCharacterInventory;
  final DestinyItemComponent selectedCharacterSubclass;
  final int selectedCharacterIndex;
  ProfileHelper(
      {required this.characters,
      required this.selectedCharacter,
      required this.selectedCharacterInventory,
      required this.selectedCharacterSubclass,
      required this.selectedCharacterIndex});
}
