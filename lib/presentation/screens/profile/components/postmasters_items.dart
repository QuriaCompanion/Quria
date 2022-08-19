import 'package:bungie_api/enums/destiny_item_type.dart';
import 'package:bungie_api/enums/item_state.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:quria/constants/desktop_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/providers/characters_provider.dart';
import 'package:quria/data/providers/inspect/inspect_provider.dart';
import 'package:quria/data/providers/inventory_provider.dart';
import 'package:quria/data/providers/item_provider.dart';
import 'package:quria/data/services/display/display.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/misc/icon_item.dart';
import 'package:quria/presentation/screens/inspect/inspect_item.dart';
import 'package:quria/presentation/screens/profile/mobile_components/pull_postmaster_modal.dart';
import 'package:quria/presentation/var/routes.dart';

class PostmasterItems extends StatelessWidget {
  const PostmasterItems({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    List<DestinyItemComponent> postmasterItems = Provider.of<InventoryProvider>(context)
        .getPostmasterItemsForCharacter(Provider.of<CharactersProvider>(context).currentCharacter!.characterId!);
    return Wrap(
      alignment: WrapAlignment.start,
      runSpacing: 8,
      spacing: 8,
      children: [
        for (final item in postmasterItems)
          InkWell(
            onTap: () {
              final itemDef = ManifestService.manifestParsed.destinyInventoryItemDefinition[item.itemHash];
              if (itemDef?.itemType == DestinyItemType.Weapon || itemDef?.itemType == DestinyItemType.Armor) {
                Provider.of<InspectProvider>(context, listen: false).setInspectItem(
                  itemDef: itemDef!,
                  item: item,
                );
                if (width != vw(context)) {
                  showDialog(
                      context: context,
                      barrierColor: const Color.fromARGB(110, 0, 0, 0),
                      builder: (context) {
                        return desktopPostmasterModal(
                          context,
                          child: InspectItem(
                            width: modalWidth(context),
                          ),
                        );
                      });
                } else {
                  showMaterialModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      isDismissible: false,
                      expand: false,
                      builder: ((context) {
                        return PullPostmasterModal(
                          item: item,
                          onClick: (inspect) {
                            Provider.of<InspectProvider>(context, listen: false).setInspectItem(
                                itemDef: ManifestService.manifestParsed.destinyInventoryItemDefinition[item.itemHash]!,
                                item: item);
                            Navigator.pushNamed(context, routeInspectMobile, arguments: inspect);
                          },
                        );
                      }));
                }
              }
            },
            child: ItemIcon(
              displayHash: item.overrideStyleItemHash ?? item.itemHash!,
              imageSize: isMobile(context) ? itemSize(context, width) : 56,
              isMasterworked: item.state == ItemState.Masterwork || item.state == const ItemState(5),
              element: Provider.of<ItemProvider>(context).getItemElement(item),
              isActive: DisplayService.isItemItemActive(
                  context, ManifestService.manifestParsed.destinyInventoryItemDefinition[item.itemHash]!),
              powerLevel: Provider.of<ItemProvider>(context).getItemPowerLevel(item.itemInstanceId),
            ),
          )
      ],
    );
  }
}
