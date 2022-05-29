import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/helpers/inspectData.model.dart';
import 'package:quria/data/models/helpers/itemCardHelper.model.dart';
import 'package:quria/data/services/display/display.service.dart';
import 'package:quria/presentation/components/detailed_item/item/item_component_display.dart';

class ProfileDesktopItemCard extends StatefulWidget {
  final DestinyItemComponent item;
  final String characterId;
  final List<DestinyItemComponent> inventory;
  final void Function(InspectData) onClick;
  const ProfileDesktopItemCard({
    required this.characterId,
    required this.inventory,
    required this.onClick,
    required this.item,
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
    data = DisplayService()
        .getCardData(widget.item.itemInstanceId!, widget.item.itemHash);
  }

  @override
  void didUpdateWidget(covariant ProfileDesktopItemCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    data = DisplayService()
        .getCardData(widget.item.itemInstanceId!, widget.item.itemHash);
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
              textBodyMedium(isOpen
                  ? AppLocalizations.of(context)!.close
                  : AppLocalizations.of(context)!.see_all),
            ],
          ),
        ),
      ),
      ItemComponentDisplay(
          onClick: (inspectData) {
            widget.onClick(inspectData);
          },
          item: widget.item,
          itemDef: data.itemDef,
          elementIcon: data.elementIcon,
          powerLevel: data.powerLevel,
          perks: data.perks,
          width: vw(context) * 0.5,
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
        for (final item in widget.inventory)
          Builder(builder: (context) {
            final dataItem = DisplayService()
                .getCardData(item.itemInstanceId!, item.itemHash);
            return Padding(
              padding:
                  EdgeInsets.symmetric(vertical: globalPadding(context) / 4),
              child: ItemComponentDisplay(
                  onClick: (inspectData) {
                    widget.onClick(inspectData);
                  },
                  item: item,
                  itemDef: dataItem.itemDef,
                  elementIcon: dataItem.elementIcon,
                  powerLevel: dataItem.powerLevel,
                  perks: dataItem.perks,
                  width: vw(context) * 0.5,
                  cosmetics: dataItem.intristics,
                  armorSockets: dataItem.armorSockets,
                  characterId: widget.characterId),
            );
          })
    ]);
  }
}
