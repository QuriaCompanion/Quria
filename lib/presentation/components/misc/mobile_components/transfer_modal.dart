import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
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

class TransferModal extends StatefulWidget {
  final String instanceId;
  final int itemHash;
  final void Function() onTransfer;
  const TransferModal({
    required this.instanceId,
    required this.itemHash,
    required this.onTransfer,
    Key? key,
  }) : super(key: key);

  @override
  State<TransferModal> createState() => _TransferModalState();
}

class _TransferModalState extends State<TransferModal> {
  @override
  Widget build(BuildContext context) {
    final owner = Provider.of<InventoryProvider>(context).getItemOwner(widget.instanceId);
    final characters =
        Provider.of<CharactersProvider>(context).characters.where((element) => element.characterId != owner);

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
              padding: EdgeInsets.all(
                globalPadding(context),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  textH2(
                    AppLocalizations.of(context)!.transfer,
                    utf8: false,
                  ),
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const CircleAvatar(
                      backgroundColor: blackLight,
                      child: Icon(
                        Icons.clear,
                        size: 20,
                        color: Colors.white,
                      ),
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
                        .transferItem(
                      context,
                      widget.instanceId,
                      character.characterId!,
                      stackSize: 1,
                      itemHash: widget.itemHash,
                    )
                        .then((_) {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(scaffoldKey.currentContext!).showSnackBar(SnackBar(
                        content: textBodyMedium(
                          AppLocalizations.of(context)!.item_transfered,
                          utf8: false,
                          color: Colors.white,
                        ),
                        backgroundColor: Colors.green,
                      ));
                      widget.onTransfer();
                    }, onError: (_) {
                      showDialog(
                          context: scaffoldKey.currentContext!,
                          builder: (context) {
                            return const ErrorDialog();
                          });
                    });
                  },
                  child: CharacterTransferItem(
                    imageLink: DestinyData.bungieLink + character.emblemPath!,
                    name: ManifestService.manifestParsed.destinyClassDefinition[character.classHash]!
                        .genderedClassNamesByGenderHash![character.genderHash.toString()]!,
                    icon: "assets/icons/Transfer.svg",
                    powerLevel: character.light,
                  ),
                ),
              ),
            if (characters.length < Provider.of<CharactersProvider>(context).characters.length)
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: globalPadding(context) / 2,
                  horizontal: globalPadding(context),
                ),
                child: InkWell(
                  onTap: () async {
                    await BungieActionsService()
                        .transferItem(
                      context,
                      widget.instanceId,
                      null,
                      stackSize: 1,
                      itemHash: widget.itemHash,
                    )
                        .then((_) {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(scaffoldKey.currentContext!).showSnackBar(SnackBar(
                        content: textBodyMedium(
                          AppLocalizations.of(context)!.item_transfered,
                          utf8: false,
                          color: Colors.white,
                        ),
                        backgroundColor: Colors.green,
                      ));
                    }, onError: (_) {
                      showDialog(
                          context: scaffoldKey.currentContext!,
                          builder: (context) {
                            return const ErrorDialog();
                          });
                    });
                  },
                  child: CharacterTransferItem(
                    imageLink:
                        "https://www.bungie.net/common/destiny2_content/icons/b46b0f14f56805d4927f8a5ec15734c5.png",
                    name: AppLocalizations.of(context)!.vault,
                    icon: "assets/icons/Transfer.svg",
                  ),
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
