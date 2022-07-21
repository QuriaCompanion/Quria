import 'package:provider/provider.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:bungie_api/models/destiny_item_plug.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/providers/plugs_provider.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/detailed_item/item/mod_modal.dart';

class SubclassMobileItems extends StatefulWidget {
  final DestinyInventoryItemDefinition item;
  final double width;
  final int? plugSetHash;
  final void Function(DestinyInventoryItemDefinition) onSocketChange;
  const SubclassMobileItems(
      {required this.item, this.plugSetHash, required this.onSocketChange, Key? key, required this.width})
      : super(key: key);

  @override
  State<SubclassMobileItems> createState() => _SubclassMobileItemsState();
}

class _SubclassMobileItemsState extends State<SubclassMobileItems> {
  @override
  Widget build(BuildContext context) {
    List<int> plugs = [];
    if (widget.plugSetHash != null) {
      for (DestinyItemPlug plug in Provider.of<PlugsProvider>(context).getPlugSets(context, widget.plugSetHash!)) {
        plugs.add(plug.plugItemHash!);
      }
    }

    return SizedBox(
      width: widget.width - globalPadding(context) * 2,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              if (widget.width == vw(context)) {
                showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) => ModModal(
                          width: widget.width,
                          mod: widget.item,
                        ));
                return;
              }
              showDialog(
                context: context,
                builder: (context) => Center(
                  child: SizedBox(
                    width: vw(context) * 0.4,
                    child: ModModal(
                      width: widget.width,
                      mod: widget.item,
                    ),
                  ),
                ),
              );
            },
            child: pictureBordered(
              size: widget.width == vw(context) ? widget.width * 0.192 : 90,
              image: DestinyData.bungieLink + widget.item.displayProperties!.icon!,
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: globalPadding(context) / 2,
            ),
            width: widget.width - widget.width * 0.192 - globalPadding(context) * 3.5,
            child: Wrap(
              alignment: WrapAlignment.start,
              spacing: globalPadding(context) / 2,
              runSpacing: globalPadding(context) / 2,
              children: [
                for (int plug in plugs.toSet().toList())
                  if (plug != widget.item.hash)
                    InkWell(
                      onTap: () {
                        if (widget.width == vw(context)) {
                          showMaterialModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              expand: false,
                              context: context,
                              builder: (context) {
                                return ModModal(
                                    width: widget.width,
                                    mod: ManifestService.manifestParsed.destinyInventoryItemDefinition[plug]!,
                                    onSocketChange: () {
                                      setState(() {
                                        widget.onSocketChange(
                                            ManifestService.manifestParsed.destinyInventoryItemDefinition[plug]!);
                                      });
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
                                  width: widget.width,
                                  mod: ManifestService.manifestParsed.destinyInventoryItemDefinition[plug]!,
                                  onSocketChange: () {
                                    setState(() {
                                      widget.onSocketChange(
                                          ManifestService.manifestParsed.destinyInventoryItemDefinition[plug]!);
                                    });
                                  }),
                            ),
                          ),
                        );
                      },
                      onLongPress: () {
                        widget.onSocketChange(ManifestService.manifestParsed.destinyInventoryItemDefinition[plug]!);
                      },
                      child: pictureBordered(
                          image: DestinyData.bungieLink +
                              ManifestService
                                  .manifestParsed.destinyInventoryItemDefinition[plug]!.displayProperties!.icon!,
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
