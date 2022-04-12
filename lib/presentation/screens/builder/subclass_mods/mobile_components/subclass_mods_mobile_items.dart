import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:bungie_api/models/destiny_item_plug.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/bungie_api/profile.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/detailed_item/subclass/subclass_mod_modal.dart';

class SubclassMobileItems extends StatefulWidget {
  final DestinyInventoryItemDefinition item;
  final int? plugSetHash;
  final void Function(DestinyInventoryItemDefinition) onSocketChange;
  const SubclassMobileItems(
      {required this.item,
      required this.plugSetHash,
      required this.onSocketChange,
      Key? key})
      : super(key: key);

  @override
  State<SubclassMobileItems> createState() => _SubclassMobileItemsState();
}

class _SubclassMobileItemsState extends State<SubclassMobileItems> {
  @override
  Widget build(BuildContext context) {
    List<int> plugs = [];
    if (widget.plugSetHash != null) {
      for (DestinyItemPlug plug
          in ProfileService().getPlugSets(widget.plugSetHash!)) {
        plugs.add(plug.plugItemHash!);
      }
    }

    return SizedBox(
      width: vw(context) - globalPadding(context) * 2,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          pictureBordered(
            size: vw(context) * 0.192,
            image: NetworkImage(
                DestinyData.bungieLink + widget.item.displayProperties!.icon!),
          ),
          Container(
            padding: EdgeInsets.only(
              left: globalPadding(context) / 2,
            ),
            width: vw(context) -
                vw(context) * 0.192 -
                globalPadding(context) * 2.5,
            child: Wrap(
              alignment: WrapAlignment.start,
              spacing: globalPadding(context) / 2,
              runSpacing: globalPadding(context) / 2,
              children: [
                for (int plug in plugs.toSet().toList())
                  if (plug != widget.item.hash)
                    InkWell(
                      onTap: () {
                        showMaterialModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            expand: false,
                            context: context,
                            builder: (context) {
                              return SubclassModModal(
                                  mod: ManifestService.manifestParsed
                                      .destinyInventoryItemDefinition![plug]!,
                                  onSocketChange: () {
                                    setState(() {
                                      widget.onSocketChange(ManifestService
                                              .manifestParsed
                                              .destinyInventoryItemDefinition![
                                          plug]!);
                                    });
                                  });
                            });
                      },
                      onLongPress: () {
                        widget.onSocketChange(ManifestService.manifestParsed
                            .destinyInventoryItemDefinition![plug]!);
                      },
                      child: pictureBordered(
                          image: NetworkImage(DestinyData.bungieLink +
                              ManifestService
                                  .manifestParsed
                                  .destinyInventoryItemDefinition![plug]!
                                  .displayProperties!
                                  .icon!),
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
