import 'package:provider/provider.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:bungie_api/models/destiny_item_plug.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/providers/plugs_provider.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/detailed_item/item/mod_display.dart';
import 'package:quria/presentation/components/detailed_item/item/mod_with_type_name.dart';
import 'package:quria/presentation/components/detailed_item/item/mod_modal.dart';

class ArmorModsModal extends StatefulWidget {
  final DestinyInventoryItemDefinition socket;
  final void Function(int) onSocketChange;
  final int plugSetsHash;
  final double width;

  const ArmorModsModal(
      {required this.socket,
      required this.plugSetsHash,
      required this.onSocketChange,
      required this.width,
      Key? key})
      : super(key: key);

  @override
  State<ArmorModsModal> createState() => _ArmorModsModalState();
}

class _ArmorModsModalState extends State<ArmorModsModal> {
  late List<DestinyItemPlug>? plugs;
  @override
  void initState() {
    super.initState();
    plugs = Provider.of<PlugsProvider>(context, listen: false)
        .getPlugSets(context, widget.plugSetsHash)
        .toSet()
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(
            top: globalPadding(context),
            left: globalPadding(context),
            right: globalPadding(context)),
        decoration: const BoxDecoration(color: black),
        child: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: globalPadding(context)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      textH2(AppLocalizations.of(context)!.mod_equip,
                          utf8: false),
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: const CircleAvatar(
                          backgroundColor: blackLight,
                          child:
                              Icon(Icons.clear, size: 20, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    color: blackLight,
                    height: 22,
                    thickness: 1,
                  ),
                  Column(
                    children: [
                      ModDisplay(
                          width: vw(context) -
                              globalPadding(context) * 3 -
                              iconSize(context, widget.width),
                          padding: globalPadding(context),
                          iconSize: iconSize(context, widget.width),
                          item: widget.socket),
                      const Divider(
                        color: blackLight,
                        height: 22,
                        thickness: 1,
                      ),
                      for (var plug in plugs!)
                        Padding(
                          padding:
                              EdgeInsets.only(bottom: globalPadding(context)),
                          child: InkWell(
                            onTap: () {
                              showMaterialModalBottomSheet(
                                  backgroundColor: Colors.transparent,
                                  expand: false,
                                  context: context,
                                  builder: (context) {
                                    return ModModal(
                                      mod: ManifestService.manifestParsed
                                              .destinyInventoryItemDefinition[
                                          plug.plugItemHash]!,
                                      onSocketChange: () {
                                        Navigator.pop(context);
                                        widget
                                            .onSocketChange(plug.plugItemHash!);
                                      },
                                      width: widget.width,
                                    );
                                  });
                            },
                            child: ModWithTypeName(
                                iconSize: iconSize(context, widget.width),
                                item: ManifestService.manifestParsed
                                        .destinyInventoryItemDefinition[
                                    plug.plugItemHash]!),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
