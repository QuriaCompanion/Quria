import 'package:bungie_api/enums/destiny_item_type.dart';
import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:bungie_api/models/destiny_item_socket_state.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/services/bungie_api/bungie_api.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/detailed_item/item/perk_item_display.dart';
import 'package:quria/presentation/components/detailed_item/item/stat_progress_bar.dart';

class PerkModal extends StatelessWidget {
  final DestinyInventoryItemDefinition perk;
  final int? index;
  final String? instanceId;
  final Function(List<DestinyItemSocketState>?)? onSocketsChanged;

  const PerkModal({
    Key? key,
    required this.perk,
    this.onSocketsChanged,
    this.index,
    this.instanceId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  PerkItemDisplay(
                      perk: perk, iconSize: mobileItemSize(context)),
                  SizedBox(width: globalPadding(context)),
                  SizedBox(
                    width: vw(context) -
                        mobileItemSize(context) -
                        (globalPadding(context) * 3) -
                        40,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textH3(perk.displayProperties?.name ?? ""),
                        textBodyRegular(perk.itemTypeDisplayName ?? "")
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
              textBodyRegular(perk.displayProperties?.description ?? ""),
              const Divider(
                color: blackLight,
                height: 22,
                thickness: 1,
              ),
              Builder(
                builder: ((context) {
                  List<Widget> list = [];
                  if (perk.investmentStats?.isNotEmpty ?? false) {
                    for (var stat in perk.investmentStats!) {
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
              if (instanceId != null)
                ElevatedButton(
                  onPressed: () {
                    BungieApiService()
                        .insertSocketPlugFree(instanceId!, perk.hash!, index!)
                        .then((value) async {
                      onSocketsChanged!(
                          value?.response?.item?.sockets?.data?.sockets);
                      Navigator.pop(context);
                    });
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
