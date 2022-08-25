import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:bungie_api/models/destiny_item_plug.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/providers/plugs_provider.dart';
import 'package:quria/data/services/bungie_api/bungie_api.service.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/detailed_item/item/mod_modal.dart';

class SubclassMobileItems extends ConsumerWidget {
  final DestinyInventoryItemDefinition item;
  final double width;
  final int? plugSetHash;
  final void Function(DestinyInventoryItemDefinition) onSocketChange;
  const SubclassMobileItems(
      {required this.item, this.plugSetHash, required this.onSocketChange, Key? key, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<int> plugs = [];
    if (plugSetHash != null) {
      for (DestinyItemPlug plug in ref.watch(plugsSetsProvider(plugSetHash!))) {
        plugs.add(plug.plugItemHash!);
      }
    }

    return SizedBox(
      width: width - globalPadding(context) * 2,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              if (width == vw(context)) {
                showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) => ModModal(
                          width: width,
                          mod: item,
                        ));
                return;
              }
              showDialog(
                context: context,
                builder: (context) => Center(
                  child: SizedBox(
                    width: vw(context) * 0.4,
                    child: ModModal(
                      width: width,
                      mod: item,
                    ),
                  ),
                ),
              );
            },
            child: pictureBordered(
              size: width == vw(context) ? width * 0.192 : 90,
              image:
                  '${DestinyData.bungieLink}${item.displayProperties!.icon!}?t={${BungieApiService.randomUserInt}}123456',
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: globalPadding(context) / 2,
            ),
            width: width - width * 0.192 - globalPadding(context) * 3.5,
            child: Wrap(
              alignment: WrapAlignment.start,
              spacing: globalPadding(context) / 2,
              runSpacing: globalPadding(context) / 2,
              children: [
                for (int plug in plugs.toSet().toList())
                  if (plug != item.hash)
                    InkWell(
                      onTap: () {
                        if (width == vw(context)) {
                          showMaterialModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              expand: false,
                              context: context,
                              builder: (context) {
                                return ModModal(
                                    width: width,
                                    mod: ManifestService.manifestParsed.destinyInventoryItemDefinition[plug]!,
                                    onSocketChange: () {
                                      onSocketChange(
                                          ManifestService.manifestParsed.destinyInventoryItemDefinition[plug]!);
                                    });
                              });
                          return;
                        }
                        showDialog(
                          context: context,
                          builder: (context) => Center(
                            child: SizedBox(
                              width: vw(context) * 0.4,
                              child: ModModal(
                                  width: width,
                                  mod: ManifestService.manifestParsed.destinyInventoryItemDefinition[plug]!,
                                  onSocketChange: () {
                                    onSocketChange(
                                        ManifestService.manifestParsed.destinyInventoryItemDefinition[plug]!);
                                  }),
                            ),
                          ),
                        );
                      },
                      onLongPress: () {
                        onSocketChange(ManifestService.manifestParsed.destinyInventoryItemDefinition[plug]!);
                      },
                      child: pictureBordered(
                          image:
                              '${DestinyData.bungieLink}${ManifestService.manifestParsed.destinyInventoryItemDefinition[plug]!.displayProperties!.icon!}?t={${BungieApiService.randomUserInt}}123456',
                          size: 44),
                    )
              ],
            ),
          )
        ],
      ),
    );
  }
}
