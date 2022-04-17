import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/helpers/itemCardHelper.model.dart';
import 'package:quria/data/services/display/display.service.dart';
import 'package:quria/presentation/components/detailed_item/item/item_component_display.dart';

class ProfileMobileItemCard extends StatefulWidget {
  final DestinyItemComponent item;
  final String characterId;
  final List<DestinyItemComponent> inventory;
  const ProfileMobileItemCard(
      {Key? key,
      required this.characterId,
      required this.inventory,
      required this.item})
      : super(key: key);

  @override
  State<ProfileMobileItemCard> createState() => _ProfileMobileItemCardState();
}

class _ProfileMobileItemCardState extends State<ProfileMobileItemCard> {
  late ItemCardHelper data;
  bool isOpen = false;
  @override
  void initState() {
    super.initState();
    data = DisplayService()
        .getCardData(widget.item.itemInstanceId!, widget.item.itemHash);
  }

  @override
  void didUpdateWidget(covariant ProfileMobileItemCard oldWidget) {
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
              textBodyMedium(isOpen ? 'Fermer' : 'Tout voir'),
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
          cosmetics: data.cosmetics,
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
                  EdgeInsets.symmetric(vertical: globalPadding(context) / 2),
              child: ItemComponentDisplay(
                  item: item,
                  itemDef: dataItem.itemDef,
                  elementIcon: dataItem.elementIcon,
                  powerLevel: dataItem.powerLevel,
                  perks: dataItem.perks,
                  cosmetics: dataItem.cosmetics,
                  armorSockets: dataItem.armorSockets,
                  characterId: widget.characterId),
            );
          })
    ]);
  }
}
