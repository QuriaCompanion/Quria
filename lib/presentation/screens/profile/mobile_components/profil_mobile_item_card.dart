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
  const ProfileMobileItemCard(
      {Key? key, required this.characterId, required this.item})
      : super(key: key);

  @override
  State<ProfileMobileItemCard> createState() => _ProfileMobileItemCardState();
}

class _ProfileMobileItemCardState extends State<ProfileMobileItemCard> {
  late ItemCardHelper data;

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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                textH2(data.itemCategory.displayProperties!.name!),
                const SizedBox(width: 20),
                textH3('1/10', color: greyLight)
              ],
            ),
            textBodyMedium('Tout voir'),
          ],
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
          characterId: widget.characterId)
    ]);
  }
}
