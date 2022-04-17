import 'package:bungie_api/models/destiny_character_component.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/services/bungie_api/bungie_actions.service.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/bungie_api/profile.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/misc/mobile_components/character_transfer_item.dart';

class EquipModal extends StatelessWidget {
  final String instanceId;
  final int itemHash;

  const EquipModal({required this.itemHash, required this.instanceId, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<DestinyCharacterComponent> characters =
        ProfileService().getCharacters();
    if (ProfileService().isItemEquipped(instanceId)) {
      final owner = ProfileService().getItemOwner(instanceId);
      characters =
          characters.where((element) => element.characterId != owner).toList();
    }

    return Container(
      height: vh(context) * 0.5,
      decoration: const BoxDecoration(
        color: black,
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
      ),
      child: Column(children: [
        Padding(
          padding: EdgeInsets.all(globalPadding(context)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textH2("Equiper"),
              InkWell(
                onTap: () => Navigator.pop(context),
                child: const CircleAvatar(
                  backgroundColor: blackLight,
                  child: Icon(Icons.clear, size: 20, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        Divider(
          color: blackLight,
          height: globalPadding(context),
          thickness: 1,
        ),
        for (final character in characters)
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: globalPadding(context) / 2,
                horizontal: globalPadding(context)),
            child: InkWell(
              onTap: () async {
                Navigator.pop(context);
                await BungieActionsService().equipItem(
                    itemId: instanceId,
                    characterId: character.characterId!,
                    itemHash: itemHash);
              },
              child: CharacterTransferItem(
                  imageLink: DestinyData.bungieLink + character.emblemPath!,
                  name: ManifestService
                          .manifestParsed
                          .destinyClassDefinition[character.classHash]!
                          .genderedClassNamesByGenderHash![
                      character.genderHash.toString()]!,
                  powerLevel: character.light,
                  icon: "assets/icons/Equip.svg"),
            ),
          ),
      ]),
    );
  }
}