// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bungie_api/models/destiny_item_plug.dart';
import 'package:bungie_api/models/destiny_plug_sets_component.dart';
import 'package:flutter/foundation.dart';

@immutable
class PlugsModel {
  final Map<String, List<DestinyItemPlug>> profilePlugSets;
  final Map<String, DestinyPlugSetsComponent> characterPlugSets;

  const PlugsModel({
    this.profilePlugSets = const {},
    this.characterPlugSets = const {},
  });

  PlugsModel copyWith({
    Map<String, List<DestinyItemPlug>>? profilePlugSets,
    Map<String, DestinyPlugSetsComponent>? characterPlugSets,
  }) {
    return PlugsModel(
      profilePlugSets: profilePlugSets ?? this.profilePlugSets,
      characterPlugSets: characterPlugSets ?? this.characterPlugSets,
    );
  }
}
