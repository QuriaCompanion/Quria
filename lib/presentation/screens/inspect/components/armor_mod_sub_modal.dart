import 'package:bungie_api/enums/destiny_item_type.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_sandbox_perk_definition.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/detailed_item/item/armor_mod_icon_display.dart';
import 'package:quria/presentation/components/detailed_item/item/stat_progress_bar.dart';

class ArmorModSubModal extends StatelessWidget {
  final DestinyInventoryItemDefinition mod;
  final void Function()? onSocketsChanged;

  const ArmorModSubModal({
    Key? key,
    required this.mod,
    this.onSocketsChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DestinySandboxPerkDefinition? perkItem;

    if (mod.perks != null && mod.perks!.isNotEmpty) {
      perkItem = ManifestService
          .manifestParsed.destinySandboxPerkDefinition?[mod.perks?[0].perkHash];
    }
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(24)), color: black),
      child: Column(children: [
        Padding(
          padding: EdgeInsets.only(
              top: globalPadding(context),
              left: globalPadding(context),
              right: globalPadding(context)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ArmorModIconDisplay(
                    iconSize: mobileItemSize(context),
                    socket: mod,
                  ),
                  SizedBox(width: globalPadding(context)),
                  SizedBox(
                    width: vw(context) -
                        mobileItemSize(context) -
                        (globalPadding(context) * 3) -
                        40,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textH3(perkItem?.displayProperties?.name ??
                            mod.displayProperties?.name ??
                            ""),
                        textBodyRegular(mod.itemTypeDisplayName ?? "")
                      ],
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () => Navigator.pop(context),
                child: const CircleAvatar(
                  backgroundColor: blackLight,
                  child: Icon(Icons.clear, size: 20, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        const Divider(
          color: blackLight,
          height: 22,
          thickness: 1,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: globalPadding(context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textBodyRegular(perkItem?.displayProperties?.description ??
                  mod.displayProperties?.description ??
                  ""),
              const Divider(
                color: blackLight,
                height: 22,
                thickness: 1,
              ),
              Builder(
                builder: ((context) {
                  List<Widget> list = [];
                  if (mod.investmentStats?.isNotEmpty ?? false) {
                    for (var stat in mod.investmentStats!) {
                      list.add(StatProgressBar(
                          width: vw(context),
                          fontSize: 20,
                          name: ManifestService
                                  .manifestParsed
                                  .destinyStatDefinition![stat.statTypeHash]!
                                  .displayProperties!
                                  .name ??
                              'error',
                          value: stat.value?.abs() ?? 0,
                          type: DestinyItemType.Armor));
                    }
                    list.add(
                      const Divider(
                        color: blackLight,
                        height: 22,
                        thickness: 1,
                      ),
                    );
                  }
                  return Column(children: list);
                }),
              ),
              ElevatedButton(
                onPressed: () {
                  onSocketsChanged!();
                  Navigator.pop(context);
                },
                child: textBodyMedium("Equiper", color: black),
                style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    fixedSize: Size(vw(context) - globalPadding(context) * 2,
                        (vw(context) - globalPadding(context) * 2) * 0.147),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
