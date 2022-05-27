import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/helpers/inspectData.model.dart';
import 'package:quria/data/models/helpers/itemCardHelper.model.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/display/display.service.dart';
import 'package:quria/presentation/components/detailed_item/item/item_component_display_perks.dart';
import 'package:quria/presentation/components/misc/icon_item.dart';
import 'package:quria/presentation/components/misc/mobile_components/transfer_modal.dart';
import 'package:quria/presentation/components/misc/rounded_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ItemModal extends StatelessWidget {
  final DestinyItemComponent item;
  final void Function(InspectData) onClick;
  final void Function() onTransfer;
  const ItemModal({
    required this.item,
    required this.onClick,
    required this.onTransfer,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ItemCardHelper data =
        DisplayService().getCardData(item.itemInstanceId!, item.itemHash);
    return SingleChildScrollView(
        child: Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          color: black),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: globalPadding(context),
                left: globalPadding(context),
                right: globalPadding(context)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ItemIcon(
                      displayHash: item.overrideStyleItemHash ?? item.itemHash!,
                      imageSize: mobileItemSize(context),
                    ),
                    SizedBox(width: globalPadding(context)),
                    SizedBox(
                      width: vw(context) -
                          mobileItemSize(context) -
                          (globalPadding(context) * 3) -
                          40,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textH3(
                              data.itemDef.displayProperties?.name ?? "Error"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              if (data.elementIcon != null)
                                Container(
                                    width: 12,
                                    height: 12,
                                    margin: const EdgeInsets.only(right: 5),
                                    child: Image(
                                      image: NetworkImage(
                                          DestinyData.bungieLink +
                                              data.elementIcon!),
                                    )),
                              if (data.powerLevel != null)
                                textBodyBold(data.powerLevel.toString()),
                              divider,
                              textBodyRegular(
                                  data.itemDef.itemTypeDisplayName!),
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
            padding: EdgeInsets.symmetric(
                horizontal: globalPadding(context),
                vertical: globalPadding(context) / 2),
            child: ItemComponentDisplayPerks(
              perks: data.perks,
              cosmetics: data.intristics,
              itemDef: data.itemDef,
              armorSockets: data.armorSockets,
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
                RoundedButton(
                  text: textBodyMedium(
                    AppLocalizations.of(context)!.transfer,
                    color: black,
                    utf8: false,
                  ),
                  onPressed: () {
                    showMaterialModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        isDismissible: false,
                        expand: false,
                        builder: (context) {
                          return TransferModal(
                            itemHash: item.itemHash!,
                            instanceId: item.itemInstanceId!,
                            onTransfer: () {
                              Navigator.pop(context);
                              onTransfer();
                            },
                          );
                        });
                  },
                  width: vw(context) * 0.4,
                ),
                RoundedButton(
                  text: textBodyMedium(AppLocalizations.of(context)!.details,
                      color: Colors.white, utf8: false),
                  onPressed: () {
                    Navigator.pop(context);
                    onClick(InspectData(
                      hash: item.itemHash!,
                      instanceId: item.itemInstanceId!,
                    ));
                  },
                  textColor: Colors.white,
                  buttonColor: grey,
                  width: vw(context) * 0.4,
                )
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
