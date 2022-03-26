import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:bungie_api/models/destiny_item_socket_state.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';

class ArmorAfinity extends StatelessWidget {
  final String afinityIcon;
  final DestinyItemSocketState afinity;
  const ArmorAfinity({
    required this.afinityIcon,
    required this.afinity,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final DestinyInventoryItemDefinition afinityDef = ManifestService
        .manifestParsed.destinyInventoryItemDefinition![afinity.plugHash!]!;
    return Column(
      children: [
        Container(
            width: double.infinity,
            height: mobileItemSize(context),
            decoration: const BoxDecoration(
                color: solar,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8))),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: globalPadding(context)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image(
                          width: 18,
                          height: 18,
                          image: NetworkImage(
                              DestinyData.bungieLink + afinityIcon)),
                      SizedBox(
                          width: (MediaQuery.of(context).size.width -
                                  (globalPadding(context) * 2)) *
                              0.005),
                      textH2(afinityDef.investmentStats![0].value.toString()),
                    ],
                  ),
                  textBodyRegular('InutilisÃ©: ' +
                      (10 - afinityDef.investmentStats![0].value!).toString()),
                ],
              ),
            )),
        SizedBox(
            height: (MediaQuery.of(context).size.width -
                    (globalPadding(context) * 2)) *
                0.005),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: mobileItemSize(context) / 3,
              width: (MediaQuery.of(context).size.width -
                      (globalPadding(context) * 2)) /
                  10.5,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8)),
              ),
            ),
            for (int i = 2; i < 10; i++)
              Container(
                height: mobileItemSize(context) / 3,
                width: (MediaQuery.of(context).size.width -
                        (globalPadding(context) * 2)) /
                    10.5,
                decoration: BoxDecoration(
                  color: afinityDef.investmentStats![0].value! >= i
                      ? Colors.white
                      : greyLight,
                ),
              ),
            Container(
              height: mobileItemSize(context) / 3,
              width: (MediaQuery.of(context).size.width -
                      (globalPadding(context) * 2)) /
                  10.5,
              decoration: BoxDecoration(
                color: afinityDef.investmentStats![0].value! == 10
                    ? Colors.white
                    : greyLight,
                borderRadius:
                    const BorderRadius.only(bottomRight: Radius.circular(8)),
              ),
            ),
          ],
        )
      ],
    );
  }
}
