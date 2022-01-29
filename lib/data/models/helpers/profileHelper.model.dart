import 'package:bungie_api/models/destiny_character_component.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:bungie_api/models/group_user_info_card.dart';

class ProfileHelper {
  GroupUserInfoCard profile;
  List<DestinyCharacterComponent> characters = [];
  List<DestinyItemComponent> characterEquipement = [];
  ProfileHelper(this.profile, this.characters, this.characterEquipement);
}
