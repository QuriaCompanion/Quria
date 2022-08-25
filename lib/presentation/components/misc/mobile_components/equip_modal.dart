import 'package:bungie_api/models/destiny_character_component.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/providers/characters_provider.dart';
import 'package:quria/data/providers/inventory_provider.dart';
import 'package:quria/data/services/bungie_api/bungie_actions.service.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/misc/error_dialog.dart';
import 'package:quria/presentation/components/misc/mobile_components/character_transfer_item.dart';
import 'package:quria/presentation/var/keys.dart';

class EquipModal extends ConsumerWidget {
  final String instanceId;
  final int itemHash;
  final double? width;

  const EquipModal({
    required this.itemHash,
    required this.instanceId,
    this.width,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<DestinyCharacterComponent> characters = ref.watch(charactersProvider);
    if (ref.watch(isItemEquippedProvider(instanceId))) {
      final owner = ref.watch(itemOwnerProvider(instanceId));
      characters = characters.where((element) => element.characterId != owner).toList();
    }

    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
          color: black,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(10),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(globalPadding(context)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  textH2(
                    AppLocalizations.of(context)!.equip,
                    utf8: false,
                  ),
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
                  horizontal: globalPadding(context),
                ),
                child: InkWell(
                  onTap: () async {
                    await BungieActionsService()
                        .equipItem(ref, itemId: instanceId, characterId: character.characterId!, itemHash: itemHash)
                        .then((_) {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(scaffoldKey.currentContext!).showSnackBar(SnackBar(
                        content: textBodyMedium(
                          AppLocalizations.of(context)!.item_equipped,
                          utf8: false,
                          color: Colors.white,
                        ),
                        backgroundColor: Colors.green,
                      ));
                    }, onError: (_) {
                      Navigator.pop(context);
                      showDialog(
                          context: scaffoldKey.currentContext!,
                          builder: (context) {
                            return const ErrorDialog();
                          });
                    });
                  },
                  child: CharacterTransferItem(
                      width: width ?? vw(context),
                      imageLink: DestinyData.bungieLink + character.emblemPath!,
                      name: ManifestService.manifestParsed.destinyClassDefinition[character.classHash]!
                          .genderedClassNamesByGenderHash![character.genderHash.toString()]!,
                      powerLevel: character.light,
                      icon: "assets/icons/Equip.svg"),
                ),
              ),
            SizedBox(
              height: globalPadding(context) / 2,
            ),
          ],
        ),
      ),
    );
  }
}
