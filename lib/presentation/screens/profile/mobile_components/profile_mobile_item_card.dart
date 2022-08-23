import 'package:bungie_api/enums/item_state.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/helpers/itemCardHelper.model.dart';
import 'package:quria/data/providers/inspect/inspect_provider.dart';
import 'package:quria/data/services/display/display.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/detailed_item/item/item_component_display.dart';
import 'package:quria/presentation/components/misc/icon_item.dart';
import 'package:quria/presentation/var/routes.dart';

class ProfileMobileItemCard extends ConsumerStatefulWidget {
  final DestinyItemComponent item;
  final String characterId;
  final double width;
  final List<DestinyItemComponent> inventory;
  const ProfileMobileItemCard({
    required this.characterId,
    required this.inventory,
    required this.item,
    required this.width,
    Key? key,
  }) : super(key: key);

  @override
  ProfileMobileItemCardState createState() => ProfileMobileItemCardState();
}

class ProfileMobileItemCardState extends ConsumerState<ProfileMobileItemCard> {
  late ItemCardHelper data;
  bool isOpen = false;
  @override
  void initState() {
    super.initState();
    data = DisplayService.getCardData(
      context,
      itemInstanceId: widget.item.itemInstanceId!,
      itemHash: widget.item.itemHash,
    );
  }

  @override
  void didUpdateWidget(covariant ProfileMobileItemCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    data = DisplayService.getCardData(
      context,
      itemInstanceId: widget.item.itemInstanceId!,
      itemHash: widget.item.itemHash,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10),
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
            ],
          ),
        ),
        ItemComponentDisplay(
            item: widget.item,
            itemDef: data.itemDef,
            elementIcon: data.elementIcon,
            powerLevel: data.powerLevel,
            perks: data.perks,
            cosmetics: data.intristics,
            armorSockets: data.armorSockets,
            width: vw(context),
            characterId: widget.characterId),
        const Divider(
          color: greyLight,
          height: 22,
          thickness: 1,
        ),
        Wrap(
          spacing: globalPadding(context) / 2,
          runSpacing: globalPadding(context) / 2,
          children: [
            for (final item in widget.inventory)
              Builder(builder: (context) {
                final dataItem =
                    DisplayService.getCardData(context, itemInstanceId: item.itemInstanceId!, itemHash: item.itemHash);
                return InkWell(
                  onTap: () {
                    ref.read(inspectProvider.notifier).setInspectItem(
                        itemDef: ManifestService.manifestParsed.destinyInventoryItemDefinition[item.itemHash]!,
                        item: item);
                    Navigator.pushNamed(context, routeInspectMobile);
                  },
                  child: ItemIcon(
                    imageSize: itemSize(context, widget.width),
                    displayHash: item.overrideStyleItemHash ?? item.itemHash!,
                    element: dataItem.elementIcon,
                    powerLevel: dataItem.powerLevel,
                    isMasterworked: item.state == ItemState.Masterwork || item.state == const ItemState(5),
                  ),
                );
              })
          ],
        )
      ],
    );
  }
}
