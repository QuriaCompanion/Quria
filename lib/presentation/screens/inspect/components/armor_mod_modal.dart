import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:bungie_api/models/destiny_item_plug.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/services/bungie_api/profile.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/detailed_item/item/item_with_type_name.dart';
import 'package:quria/presentation/detailed_item/item/mod_display.dart';
import 'package:quria/presentation/detailed_item/item/mod_with_type_name.dart';
import 'package:quria/presentation/screens/inspect/components/armor_mod_sub_modal.dart';

class ArmorModModal extends StatefulWidget {
  final DestinyInventoryItemDefinition socket;
  final void Function(int) onSocketChange;
  final int plugSetsHash;

  const ArmorModModal(
      {required this.socket,
      required this.plugSetsHash,
      required this.onSocketChange,
      Key? key})
      : super(key: key);

  @override
  State<ArmorModModal> createState() => _ArmorModModalState();
}

class _ArmorModModalState extends State<ArmorModModal> {
  late List<DestinyItemPlug>? plugs;
  @override
  void initState() {
    super.initState();
    plugs = ProfileService().getPlugSets(widget.plugSetsHash).toSet().toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.only(
          top: globalPadding(context),
          left: globalPadding(context),
          right: globalPadding(context)),
      decoration: const BoxDecoration(color: black),
      child: SingleChildScrollView(
        child: Column(children: [
          mobileSection(context,
              title: "Ãquiper un mod",
              child: Column(
                children: [
                  ModDisplay(
                      width: vw(context) -
                          globalPadding(context) * 3 -
                          mobileItemSize(context),
                      padding: globalPadding(context),
                      iconSize: mobileItemSize(context),
                      item: widget.socket),
                  const Divider(
                    color: blackLight,
                    height: 22,
                    thickness: 1,
                  ),
                  for (var plug in plugs!)
                    Padding(
                      padding: EdgeInsets.only(bottom: globalPadding(context)),
                      child: InkWell(
                        onTap: () {
                          showMaterialModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              expand: false,
                              context: context,
                              builder: (context) {
                                return ArmorModSubModal(
                                  mod: ManifestService.manifestParsed
                                          .destinyInventoryItemDefinition![
                                      plug.plugItemHash]!,
                                  onSocketsChanged: () {
                                    Navigator.pop(context);
                                    widget.onSocketChange(plug.plugItemHash!);
                                  },
                                );
                              });
                        },
                        child: ModWithTypeName(
                            iconSize: mobileItemSize(context),
                            item: ManifestService.manifestParsed
                                    .destinyInventoryItemDefinition![
                                plug.plugItemHash]!),
                      ),
                    ),
                ],
              ))
        ]),
      ),
    );
  }
}