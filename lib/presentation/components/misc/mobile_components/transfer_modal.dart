import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/services/bungie_api/bungie_actions.service.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/bungie_api/profile.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/misc/mobile_components/character_transfer_item.dart';

class TransferModal extends StatelessWidget {
  final String instanceId;
  final int itemHash;
  const TransferModal(
      {required this.instanceId, required this.itemHash, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final owner = ProfileService().getItemOwner(instanceId);
    final characters = ProfileService()
        .getCharacters()
        .where((element) => element.characterId != owner);

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
              textH2("Transferer"),
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
                await BungieActionsService().transferItem(
                    instanceId, character.characterId!,
                    stackSize: 1, itemHash: itemHash);
              },
              child: CharacterTransferItem(
                imageLink: DestinyData.bungieLink + character.emblemPath!,
                name: ManifestService
                        .manifestParsed
                        .destinyClassDefinition[character.classHash]!
                        .genderedClassNamesByGenderHash![
                    character.genderHash.toString()]!,
                icon: "assets/icons/Transfer.svg",
                powerLevel: character.light,
              ),
            ),
          ),
        if (characters.length < ProfileService().getCharacters().length)
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: globalPadding(context) / 2,
                horizontal: globalPadding(context)),
            child: InkWell(
              onTap: () async {
                Navigator.pop(context);
                await BungieActionsService().transferItem(instanceId, null,
                    stackSize: 1, itemHash: itemHash);
              },
              child: const CharacterTransferItem(
                  imageLink:
                      "https://www.bungie.net/common/destiny2_content/icons/b46b0f14f56805d4927f8a5ec15734c5.png",
                  name: "Coffre",
                  icon: "assets/icons/Transfer.svg"),
            ),
          ),
      ]),
    );
  }
}
