import 'package:bungie_api/models/destiny_character_component.dart';
import 'package:bungie_api/models/destiny_item_component.dart';

class ProfileHelper {
  List<DestinyCharacterComponent> characters;
  DestinyCharacterComponent selectedCharacter;
  List<DestinyItemComponent> selectedCharacterInventory;
  DestinyItemComponent selectedCharacterSubclass;
  String characterSuper;
  int selectedCharacterIndex;
  ProfileHelper(
      {required this.characters,
      required this.selectedCharacter,
      required this.selectedCharacterInventory,
      required this.selectedCharacterSubclass,
      required this.characterSuper,
      required this.selectedCharacterIndex});
}
