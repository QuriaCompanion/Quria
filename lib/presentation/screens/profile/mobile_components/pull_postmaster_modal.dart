import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/helpers/inspectData.model.dart';
import 'package:quria/data/models/helpers/itemCardHelper.model.dart';
import 'package:quria/data/providers/characters_provider.dart';
import 'package:quria/data/providers/inventory_provider.dart';
import 'package:quria/data/services/bungie_api/bungie_api.service.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/display/display.service.dart';
import 'package:quria/presentation/components/detailed_item/item/item_component_display_perks.dart';
import 'package:quria/presentation/components/misc/icon_item.dart';
import 'package:quria/presentation/components/misc/mobile_components/loading_modal.dart';
import 'package:quria/presentation/components/misc/rounded_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quria/presentation/var/keys.dart';

class PullPostmasterModal extends StatelessWidget {
  final DestinyItemComponent item;
  final void Function(InspectData) onClick;
  const PullPostmasterModal({
    required this.item,
    required this.onClick,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ItemCardHelper data =
        DisplayService.getCardData(context, itemInstanceId: item.itemInstanceId!, itemHash: item.itemHash);
    return SingleChildScrollView(
        child: Container(
      decoration: const BoxDecoration(borderRadius: BorderRadius.vertical(top: Radius.circular(24)), color: black),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: globalPadding(context), left: globalPadding(context), right: globalPadding(context)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ItemIcon(
                      displayHash: item.overrideStyleItemHash ?? item.itemHash!,
                      imageSize: itemSize(context, vw(context)),
                    ),
                    SizedBox(width: globalPadding(context)),
                    SizedBox(
                      width: vw(context) - itemSize(context, vw(context)) - (globalPadding(context) * 3) - 40,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textH3(data.itemDef.displayProperties?.name ?? "Error"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              if (data.elementIcon != null)
                                Container(
                                    width: 12,
                                    height: 12,
                                    margin: const EdgeInsets.only(right: 5),
                                    child: Image(
                                      image: NetworkImage(DestinyData.bungieLink + data.elementIcon!),
                                    )),
                              if (data.powerLevel != null) textBodyBold(data.powerLevel.toString()),
                              divider,
                              textBodyRegular(data.itemDef.itemTypeDisplayName!),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: globalPadding(context), vertical: globalPadding(context) / 2),
            child: ItemComponentDisplayPerks(
              perks: data.perks,
              cosmetics: data.intristics,
              itemDef: data.itemDef,
              armorSockets: data.armorSockets,
              width: vw(context),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: globalPadding(context)),
            child: Divider(
              color: blackLight,
              height: globalPadding(context),
              thickness: 1,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(globalPadding(context)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: RoundedButton(
                    text: textBodyMedium(
                      AppLocalizations.of(context)!.recover,
                      color: black,
                      utf8: false,
                    ),
                    onPressed: () {
                      final characterId =
                          Provider.of<CharactersProvider>(context, listen: false).currentCharacter!.characterId!;
                      showMaterialModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context,
                          expand: false,
                          builder: ((context) {
                            return LoadingModal(
                              text1: AppLocalizations.of(context)!.equipping,
                              text2: AppLocalizations.of(context)!.please_wait,
                            );
                          }));
                      BungieApiService()
                          .pullFromPostMaster(
                        itemHash: item.itemHash!,
                        stackSize: 1,
                        itemId: item.itemInstanceId!,
                        characterId: characterId,
                      )
                          .then((value) {
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Provider.of<InventoryProvider>(context, listen: false).pullFromPostmaster(item, characterId);
                        ScaffoldMessenger.of(scaffoldKey.currentContext!).showSnackBar(SnackBar(
                          content: textBodyMedium(
                            AppLocalizations.of(context)!.item_transfered,
                            utf8: false,
                            color: Colors.white,
                          ),
                          backgroundColor: Colors.green,
                        ));
                      }, onError: (_) {
                        Navigator.pop(context);
                        Navigator.pop(context);
                        ScaffoldMessenger.of(scaffoldKey.currentContext!).showSnackBar(SnackBar(
                          content: textBodyMedium(
                            AppLocalizations.of(context)!.error_base,
                            utf8: false,
                            color: Colors.white,
                          ),
                          backgroundColor: crucible,
                        ));
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: globalPadding(context),
          )
        ],
      ),
    ));
  }
}
