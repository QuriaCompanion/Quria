import 'package:bungie_api/enums/destiny_item_type.dart';
import 'package:bungie_api/enums/item_state.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:bungie_api/models/destiny_item_socket_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/Item.model.dart';
import 'package:quria/data/models/helpers/itemCardHelper.model.dart';
import 'package:quria/data/providers/create_build_provider.dart';
import 'package:quria/data/providers/inventory_provider.dart';
import 'package:quria/data/providers/item_provider.dart';
import 'package:quria/data/services/bungie_api/bungie_api.service.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/display/display.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/detailed_item/item/item_component_display_perks.dart';
import 'package:quria/presentation/components/misc/icon_item.dart';
import 'package:quria/presentation/components/misc/rounded_button.dart';

class ChooseItemModal extends StatefulWidget {
  final int bucketHash;
  final bool isEquipped;
  final double width;
  const ChooseItemModal({
    required this.bucketHash,
    required this.width,
    this.isEquipped = true,
    Key? key,
  }) : super(key: key);

  @override
  State<ChooseItemModal> createState() => _ChooseItemModalState();
}

class _ChooseItemModalState extends State<ChooseItemModal> {
  ItemCardHelper? data;
  late List<DestinyItemComponent> items;
  @override
  void initState() {
    super.initState();
    items = Provider.of<InventoryProvider>(context, listen: false)
        .getItemsForBuildCreation(context, slotTypeHash: widget.bucketHash);
  }

  @override
  Widget build(BuildContext context) {
    final item = Provider.of<CreateBuildProvider>(context).getEquippedItemByBucket(widget.bucketHash);
    if (item != null) {
      data = DisplayService.getCardData(context, itemInstanceId: item.instanceId, itemHash: item.itemHash);
    }
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(borderRadius: BorderRadius.vertical(top: Radius.circular(24)), color: black),
        padding: EdgeInsets.all(globalPadding(context)),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  textH2(AppLocalizations.of(context)!.add_an_equipment, utf8: false),
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.clear, size: 20, color: black),
                    ),
                  ),
                ],
              ),
              Divider(
                color: greyLight,
                thickness: 2,
                height: globalPadding(context),
              ),
              if (data != null)
                Column(
                  children: [
                    Row(
                      children: [
                        ItemIcon(
                          displayHash: Provider.of<InventoryProvider>(context)
                                  .getItemByInstanceId(item!.instanceId)
                                  ?.overrideStyleItemHash ??
                              item.itemHash,
                          imageSize: itemSize(context, widget.width),
                        ),
                        SizedBox(width: globalPadding(context)),
                        SizedBox(
                          width: widget.width - itemSize(context, widget.width) - (globalPadding(context) * 3) - 40,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              textH3(data!.itemDef.displayProperties?.name ?? "Error"),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  if (data!.elementIcon != null)
                                    Container(
                                        width: 12,
                                        height: 12,
                                        margin: const EdgeInsets.only(right: 5),
                                        child: Image(
                                          filterQuality: FilterQuality.high,
                                          image: CachedNetworkImageProvider(
                                              '${DestinyData.bungieLink}${data!.elementIcon!}?t={${BungieApiService.randomUserInt}}123456'),
                                        )),
                                  if (data!.powerLevel != null) textBodyBold(data!.powerLevel.toString()),
                                  divider,
                                  textBodyRegular(data!.itemDef.itemTypeDisplayName!),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: globalPadding(context),
                      color: greyLight,
                      thickness: 1,
                    ),
                    ItemComponentDisplayPerks(
                      perks: data!.perks,
                      cosmetics: data!.intristics,
                      itemDef: data!.itemDef,
                      armorSockets: data!.armorSockets,
                      width: widget.width > 1000 ? widget.width * 0.4 : widget.width,
                    ),
                    Divider(
                      height: globalPadding(context),
                      color: greyLight,
                      thickness: 2,
                    ),
                  ],
                ),
              GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: widget.width == vw(context) ? widget.width * 0.148 : 75,
                  mainAxisSpacing: widget.width == vw(context) ? globalPadding(context) : 8,
                  crossAxisSpacing: widget.width == vw(context) ? globalPadding(context) : 8,
                ),
                itemCount: items.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    List<int> mods = [];
                    if (ManifestService
                            .manifestParsed.destinyInventoryItemDefinition[items[index].itemHash]?.itemType ==
                        DestinyItemType.Subclass) {
                      mods = DisplayService.getSubclassMods(context, items[index].itemInstanceId!)
                          .sockets
                          .where((element) => element.plugHash != null)
                          .map((element) => element.plugHash!)
                          .toList();
                    } else {
                      List<DestinyItemSocketState> sockets = Provider.of<ItemProvider>(context, listen: false)
                          .getItemSockets(items[index].itemInstanceId!);

                      mods = sockets
                          .where((element) => ManifestService
                                      .manifestParsed.destinyInventoryItemDefinition[items[index].itemHash]?.itemType ==
                                  DestinyItemType.Armor
                              ? Conditions.armorSockets(element)
                              : Conditions.perkSockets(element.plugHash))
                          .where((element) => element.plugHash != null)
                          .map((element) => element.plugHash!)
                          .toList();
                    }

                    final createdItem = Item(
                      itemHash: items[index].itemHash!,
                      instanceId: items[index].itemInstanceId!,
                      bucketHash: widget.bucketHash,
                      isEquipped: widget.isEquipped,
                      mods: mods,
                    );

                    if (item != null) {
                      Provider.of<CreateBuildProvider>(context, listen: false).replaceItem(item, createdItem);
                      return;
                    }
                    Provider.of<CreateBuildProvider>(context, listen: false).addItem(createdItem);
                  },
                  child: ItemIcon(
                    displayHash: items[index].overrideStyleItemHash ?? items[index].itemHash!,
                    imageSize: widget.width == vw(context) ? widget.width * 0.148 : 70,
                    isMasterworked:
                        items[index].state == ItemState.Masterwork || items[index].state == const ItemState(5),
                    element: Provider.of<ItemProvider>(context).getItemElement(items[index]),
                    powerLevel: Provider.of<ItemProvider>(context).getItemPowerLevel(items[index].itemInstanceId!),
                  ),
                ),
              ),
              SizedBox(height: globalPadding(context)),
              RoundedButton(
                text: textBodyMedium(
                  AppLocalizations.of(context)!.add,
                  color: black,
                ),
                width: widget.width,
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
