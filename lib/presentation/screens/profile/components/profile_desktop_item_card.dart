import 'package:bungie_api/enums/item_state.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/helpers/inspectData.model.dart';
import 'package:quria/data/models/helpers/itemCardHelper.model.dart';
import 'package:quria/data/services/display/display.service.dart';
import 'package:quria/presentation/components/detailed_item/item/item_component_display.dart';
import 'package:quria/presentation/components/misc/icon_item.dart';

class ProfileDesktopItemCard extends StatefulWidget {
  final DestinyItemComponent item;
  final String characterId;
  final double width;
  final List<DestinyItemComponent> inventory;
  final void Function(InspectData) onClick;
  const ProfileDesktopItemCard({
    required this.characterId,
    required this.inventory,
    required this.onClick,
    required this.item,
    required this.width,
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileDesktopItemCard> createState() => _ProfileDesktopItemCardState();
}

class _ProfileDesktopItemCardState extends State<ProfileDesktopItemCard> {
  late ItemCardHelper data;
  bool isOpen = false;
  @override
  void initState() {
    super.initState();
    data = DisplayService.getCardData(context,
        itemInstanceId: widget.item.itemInstanceId!, itemHash: widget.item.itemHash);
  }

  @override
  void didUpdateWidget(covariant ProfileDesktopItemCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    data = DisplayService.getCardData(context,
        itemInstanceId: widget.item.itemInstanceId!, itemHash: widget.item.itemHash);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: InkWell(
          onTap: () {
            setState(() {
              isOpen = !isOpen;
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  textH2(data.itemCategory.displayProperties!.name!),
                  const SizedBox(width: 20),
                  textH3('${widget.inventory.length + 1}/10', color: greyLight)
                ],
              ),
              textBodyMedium(isOpen ? AppLocalizations.of(context)!.close : AppLocalizations.of(context)!.see_all),
            ],
          ),
        ),
      ),
      ItemComponentDisplay(
          item: widget.item,
          itemDef: data.itemDef,
          elementIcon: data.elementIcon,
          powerLevel: data.powerLevel,
          perks: data.perks,
          width: widget.width,
          cosmetics: data.intristics,
          armorSockets: data.armorSockets,
          characterId: widget.characterId),
      if (isOpen)
        const Divider(
          color: greyLight,
          height: 22,
          thickness: 1,
        ),
      if (isOpen)
        SizedBox(
          width: widget.width,
          child: Wrap(
            alignment: WrapAlignment.start,
            spacing: globalPadding(context) / 2,
            runSpacing: globalPadding(context) / 2,
            children: [
              for (final item in widget.inventory)
                Builder(builder: (context) {
                  final dataItem = DisplayService.getCardData(
                    context,
                    itemInstanceId: item.itemInstanceId!,
                    itemHash: item.itemHash,
                  );
                  return InkWell(
                    onTap: () {
                      widget.onClick(InspectData(
                          hash: item.itemHash!, characterId: widget.characterId, instanceId: item.itemInstanceId!));
                    },
                    child: ItemIcon(
                      imageSize: iconSize(context, widget.width),
                      displayHash: item.overrideStyleItemHash ?? item.itemHash!,
                      element: dataItem.elementIcon,
                      powerLevel: dataItem.powerLevel,
                      isMasterworked: item.state == ItemState.Masterwork || item.state == const ItemState(5),
                    ),
                  );
                })
            ],
          ),
        )
    ]);
  }
}
