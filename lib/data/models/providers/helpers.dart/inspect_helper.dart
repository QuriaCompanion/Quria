import 'package:bungie_api/enums/destiny_class.dart';
import 'package:bungie_api/enums/destiny_item_sub_type.dart';

class ByCharacterAndBucket {
  final String characterId;
  final int bucketHash;
  ByCharacterAndBucket({required this.characterId, required this.bucketHash});
}

class ArmorForGivenClass {
  final DestinyClass? classType;
  final DestinyItemSubType? itemSubType;
  final bool includeSunset;
  ArmorForGivenClass({
    required this.classType,
    this.includeSunset = true,
    this.itemSubType,
  });
}

class ByDestinyClassAndBucket {
  final DestinyClass characterId;
  final int bucketHash;
  ByDestinyClassAndBucket({required this.characterId, required this.bucketHash});
}

class CharacterAndPlug {
  final String characterId;
  final int plugSetHash;
  CharacterAndPlug({
    required this.characterId,
    required this.plugSetHash,
  });
}
