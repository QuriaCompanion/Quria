import 'package:bungie_api/enums/item_state.dart';
import 'package:provider/provider.dart';
import 'package:quria/constants/desktop_widgets.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/BuildResponse.model.dart';
import 'package:quria/data/providers/inspect/inspect_provider.dart';
import 'package:quria/data/providers/inventory_provider.dart';
import 'package:quria/data/providers/item_provider.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
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
    // loops through the mods in this armor

    return Column(
      children: [
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
          ],
        ),
      ],
    );
  }
}
