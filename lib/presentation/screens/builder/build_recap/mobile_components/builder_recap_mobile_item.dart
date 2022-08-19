import 'package:bungie_api/enums/item_state.dart';
import 'package:provider/provider.dart';
import 'package:quria/constants/desktop_widgets.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:bungie_api/models/destiny_item_instance_component.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/BuildResponse.model.dart';
import 'package:quria/data/providers/inspect/inspect_provider.dart';
import 'package:quria/data/providers/inventory_provider.dart';
import 'package:quria/data/providers/item_provider.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/detailed_item/item/armor_afinity.dart';
import 'package:quria/presentation/components/detailed_item/item/armor_mod_icon_display.dart';
import 'package:quria/presentation/components/misc/icon_item.dart';
import 'package:quria/presentation/screens/inspect/inspect_item.dart';
import 'package:quria/presentation/var/routes.dart';

class BuilderRecapMobileItem extends StatelessWidget {
  final Armor item;
  final List<DestinyInventoryItemDefinition?> mods;
  final double width;
  const BuilderRecapMobileItem({
    required this.item,
    required this.mods,
    Key? key,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DestinyItemInstanceComponent instanceInfo =
        Provider.of<ItemProvider>(context).getInstanceInfo(item.itemInstanceId)!;
    //instanciate armor mod space (starts at 10 points for each armor assuming everything is masterworked)
    int armorModspace = 0;
    // loops through the mods in this armor
    for (DestinyInventoryItemDefinition? mod in mods) {
      // check if the mod has bonus stats
      if (mod != null && mod.investmentStats != null && mod.investmentStats!.isNotEmpty) {
        // loops through the bonus stats
        for (var stat in mod.investmentStats!) {
          // if it has a cost to the armor it reduces the armor mod space
          if (stat.statTypeHash == 3779394102 ||
              stat.statTypeHash == 3344745325 ||
              stat.statTypeHash == 107977982 ||
              stat.statTypeHash == 3950461274 ||
              stat.statTypeHash == 998798867 ||
              stat.statTypeHash == 2399985800 ||
              stat.statTypeHash == 3176563510 ||
              stat.statTypeHash == 3578062600) {
            armorModspace += stat.value!;
          }
        }
      }
    }
    if (item.mod != null) {
      for (var stat in item.mod!.investmentStats!) {
        // if it has a cost to the armor it reduces the armor mod space
        if (stat.statTypeHash == 3779394102 ||
            stat.statTypeHash == 3344745325 ||
            stat.statTypeHash == 107977982 ||
            stat.statTypeHash == 3950461274 ||
            stat.statTypeHash == 998798867 ||
            stat.statTypeHash == 2399985800 ||
            stat.statTypeHash == 3176563510 ||
            stat.statTypeHash == 3578062600) {
          armorModspace += stat.value!;
        }
      }
    }

    return Column(
      children: [
        if (instanceInfo.energy?.energyTypeHash != null)
          ArmorAfinity(
            width: width,
            pointsAvailable: armorModspace,
            remaining: 10 - armorModspace,
            afinityIcon: ManifestService.manifestParsed
                .destinyEnergyTypeDefinition[instanceInfo.energy!.energyTypeHash]!.displayProperties!.icon!,
          ),
        SizedBox(height: globalPadding(context)),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Provider.of<InspectProvider>(context, listen: false).setInspectItem(
                    itemDef: ManifestService.manifestParsed.destinyInventoryItemDefinition[item.hash]!,
                    item: Provider.of<InventoryProvider>(context, listen: false)
                        .getItemByInstanceId(item.itemInstanceId));
                if (vw(context) == width) {
                  Navigator.pushNamed(context, routeInspectMobile);
                } else {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return desktopItemModal(context,
                          child: InspectItem(
                            width: modalWidth(context),
                          ));
                    },
                  );
                }
              },
              child: ItemIcon(
                displayHash: item.displayHash,
                imageSize: width == vw(context) ? width * 0.192 : 100,
                isMasterworked:
                    Provider.of<InventoryProvider>(context).getItemByInstanceId(item.itemInstanceId)?.state ==
                            const ItemState(5) ||
                        Provider.of<InventoryProvider>(context).getItemByInstanceId(item.itemInstanceId)?.state ==
                            ItemState.Masterwork,
                powerLevel: Provider.of<ItemProvider>(context).getItemPowerLevel(item.itemInstanceId),
                element: Provider.of<ItemProvider>(context)
                    .getItemElement(Provider.of<InventoryProvider>(context).getItemByInstanceId(item.itemInstanceId)!),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: globalPadding(context) / 2),
              child: ArmorModIconDisplay(
                iconSize: 44,
                socket: ManifestService.manifestParsed.destinyInventoryItemDefinition[item.mod?.hash] ??
                    ManifestService.manifestParsed.destinyInventoryItemDefinition[481675395]!,
              ),
            ),
            for (DestinyInventoryItemDefinition? mod in mods)
              if (mod != null)
                Padding(
                  padding: EdgeInsets.only(right: globalPadding(context) / 2),
                  child: ArmorModIconDisplay(
                    iconSize: 44,
                    socket: ManifestService.manifestParsed.destinyInventoryItemDefinition[mod.hash] ??
                        ManifestService.manifestParsed.destinyInventoryItemDefinition[481675395]!,
                  ),
                ),
          ],
        ),
      ],
    );
  }
}
