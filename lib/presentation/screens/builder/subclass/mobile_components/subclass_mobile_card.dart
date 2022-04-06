import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/helpers/modHelper.model.dart';
import 'package:quria/data/models/helpers/subclassHelper.model.dart';
import 'package:quria/data/models/helpers/subclassModHelper.model.dart';
import 'dart:math' as math;

import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/var/routes.dart';

class SubclassMobileCard extends StatelessWidget {
  final DestinyItemComponent subclass;
  final SubclassHelper data;
  const SubclassMobileCard(
      {required this.subclass, required this.data, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DestinyInventoryItemDefinition subclassDef = ManifestService
        .manifestParsed.destinyInventoryItemDefinition![subclass.itemHash]!;
    return InkWell(
      onTap: () {
        subclassDef.talentGrid?.talentGridHash == 0
            ? Navigator.pushNamed(context, routeBuilderMod,
                arguments: SubclassModHelper(
                    characterId: data.characterId,
                    subclassInstanceId: subclass.itemInstanceId!,
                    subclass: subclassDef,
                    statOrder: data.statOrder,
                    exoticHash: data.exoticHash))
            : Navigator.pushNamed(context, routeMod,
                arguments: ModHelper(
                    characterId: data.characterId,
                    subclassInstanceId: subclass.itemInstanceId!,
                    statOrder: data.statOrder,
                    subclassMods: [],
                    exoticHash: data.exoticHash));
      },
      child: Container(
          width: (vw(context) - globalPadding(context) * 3) / 2,
          height: ((vw(context) - globalPadding(context) * 3) / 2) * 0.69,
          decoration: BoxDecoration(
            color: blackLight,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Transform.rotate(
                      angle: -math.pi / 4,
                      child: Container(
                        height: vw(context) * 0.15,
                        width: vw(context) * 0.15,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white)),
                      ),
                    ),
                    Image(
                      image: NetworkImage(DestinyData.bungieLink +
                          subclassDef.displayProperties!.icon!),
                      height: vw(context) * 0.17,
                      width: vw(context) * 0.17,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
