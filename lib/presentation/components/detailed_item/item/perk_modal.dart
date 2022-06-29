import 'package:bungie_api/enums/destiny_item_type.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:bungie_api/models/destiny_item_socket_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/services/bungie_api/bungie_api.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/detailed_item/item/perk_item_display.dart';
import 'package:quria/presentation/components/detailed_item/item/stat_progress_bar.dart';

class PerkModal extends StatelessWidget {
  final DestinyInventoryItemDefinition perk;
  final double width;
  final int? index;
  final bool? isSelected;
  final String? instanceId;
  final String? characterId;
  final Function(List<DestinyItemSocketState>?)? onSocketsChanged;

  const PerkModal({
    required this.perk,
    required this.width,
    this.onSocketsChanged,
    this.index,
    this.isSelected,
    this.instanceId,
    this.characterId,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          color: black,
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: globalPadding(context),
                left: globalPadding(context),
                right: globalPadding(context),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      PerkItemDisplay(
                        selected: isSelected ?? false,
                        perk: perk,
                        iconSize: itemSize(context, width),
                      ),
                      SizedBox(
                        width: globalPadding(context),
                      ),
                      SizedBox(
                        width: vw(context) - itemSize(context, width) - (globalPadding(context) * 3) - 40,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            textH3(perk.displayProperties?.name ?? ""),
                            textBodyRegular(perk.itemTypeDisplayName ?? ""),
                          ],
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const CircleAvatar(
                      backgroundColor: blackLight,
                      child: Icon(
                        Icons.clear,
                        size: 20,
                        color: Colors.white,
                      ),
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
                              name: ManifestService.manifestParsed.destinyStatDefinition[stat.statTypeHash]!
                                      .displayProperties!.name ??
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
                  if (instanceId != null && isSelected == false)
                    ElevatedButton(
                      onPressed: () {
                        BungieApiService().insertSocketPlugFree(instanceId!, perk.hash!, index!, characterId!).then(
                          (value) async {
                            onSocketsChanged!(value?.response?.item?.sockets?.data?.sockets);
                            Navigator.pop(context);
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        fixedSize: Size(
                          vw(context) - globalPadding(context) * 2,
                          (vw(context) - globalPadding(context) * 2) * 0.147,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: textBodyMedium(
                        AppLocalizations.of(context)!.equip,
                        color: black,
                        utf8: false,
                      ),
                    ),
                  SizedBox(
                    height: globalPadding(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
