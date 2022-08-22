// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bungie_api/destiny2.dart';
import 'package:flutter/foundation.dart';

@immutable
class CollectibleModel {
  final DestinyProfileCollectiblesComponent? profileCollectibles;
  final Map<String, DestinyCollectiblesComponent> characterCollectibles;
  const CollectibleModel({
    this.profileCollectibles,
    required this.characterCollectibles,
  });

  CollectibleModel copyWith({
    DestinyProfileCollectiblesComponent? profileCollectibles,
    Map<String, DestinyCollectiblesComponent>? characterCollectibles,
  }) {
    return CollectibleModel(
      profileCollectibles: profileCollectibles ?? this.profileCollectibles,
      characterCollectibles: characterCollectibles ?? this.characterCollectibles,
    );
  }
}
