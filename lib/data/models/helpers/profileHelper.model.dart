import 'package:bungie_api/models/destiny_character_component.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:bungie_api/models/group_user_info_card.dart';

class ProfileHelper {
  GroupUserInfoCard? profile;
  List<DestinyCharacterComponent>? characters = [];
  List<DestinyItemComponent>? characterEquipement = [];
  ProfileHelper.fromJson(Map<String, dynamic> json) {
    profile = GroupUserInfoCard.fromJson(json['profile']);
    json['characters'].forEach((v) {
      characters!.add(DestinyCharacterComponent.fromJson(v));
    });
    json['characterEquipement'].forEach((v) {
      characterEquipement!.add(DestinyItemComponent.fromJson(v));
    });
  }
}
