import 'package:bungie_api/models/destiny_character_component.dart';
import 'package:bungie_api/models/destiny_item_component.dart';

class VaultHelper {
  final List<DestinyCharacterComponent> characters;
  final List<DestinyItemComponent> vaultItems;
  VaultHelper({required this.characters, required this.vaultItems});
}
