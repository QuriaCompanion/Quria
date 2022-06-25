import 'package:bungie_api/models/destiny_character_component.dart';
import 'package:bungie_api/models/destiny_item_component.dart';

class ProfileHelper {
  DestinyCharacterComponent? selectedCharacter;
  List<DestinyItemComponent> selectedCharacterEquipment;
  List<DestinyItemComponent> selectedCharacterInventory;
  DestinyItemComponent? selectedCharacterSubclass;
  String? characterSuper;
  bool isNewSubclass;
  ProfileHelper({
    required this.selectedCharacter,
    required this.selectedCharacterEquipment,
    required this.selectedCharacterInventory,
    required this.selectedCharacterSubclass,
    required this.characterSuper,
    required this.isNewSubclass,
  });
}
