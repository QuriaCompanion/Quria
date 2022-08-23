import 'package:bungie_api/enums/item_state.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quria/constants/desktop_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:quria/data/providers/inspect/inspect_provider.dart';
import 'package:quria/data/providers/inventory_provider.dart';
import 'package:quria/data/providers/item_provider.dart';
import 'package:quria/data/services/display/display.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/misc/icon_item.dart';
import 'package:quria/presentation/screens/inspect/inspect_item.dart';

class DraggableInventoryItem extends ConsumerWidget {
  final DestinyItemComponent item;
  final double size;
  const DraggableInventoryItem({
    required this.item,
    required this.size,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final DestinyInventoryItemDefinition itemDefintion =
        ManifestService.manifestParsed.destinyInventoryItemDefinition[item.itemHash]!;
    final String? itemOwner = ref.watch(itemOwnerProvider(item.itemInstanceId));
    return Draggable<DestinyItemComponent>(
      // Data is the value this Draggable stores.
      data: item,
      feedback: ItemIcon(
        displayHash: item.overrideStyleItemHash ?? item.itemHash!,
        imageSize: size,
        itemOwner: itemOwner,
        isMasterworked: item.state == ItemState.Masterwork || item.state == const ItemState(5),
        element: ref.watch(itemElementProvider(item)),
        powerLevel: ref.watch(itemPowerLevelProvider(item.itemInstanceId)),
      ),
      childWhenDragging: const SizedBox(),
      child: InkWell(
        onTap: () {
          ref.read(inspectProvider.notifier).setInspectItem(itemDef: itemDefintion, item: item);
          showDialog(
            context: context,
            barrierColor: const Color.fromARGB(110, 0, 0, 0),
            builder: (context) {
              return desktopItemModal(
                context,
                child: InspectItem(
                  width: modalWidth(context),
                ),
              );
            },
          );
        },
        child: ItemIcon(
          displayHash: item.overrideStyleItemHash ?? item.itemHash!,
          isActive: DisplayService.isItemItemActive(ref, itemDefintion),
          imageSize: size,
          isMasterworked: item.state == ItemState.Masterwork || item.state == const ItemState(5),
          itemOwner: itemOwner,
          element: ref.watch(itemElementProvider(item)),
          powerLevel: ref.watch(itemPowerLevelProvider(item.itemInstanceId)),
        ),
      ),
    );
  }
}
