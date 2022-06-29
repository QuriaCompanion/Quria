import 'package:provider/provider.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/providers/builder/builder_subclass_provider.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/var/routes.dart';
import 'dart:math' as math;

class SubclassMobileCard extends StatelessWidget {
  final DestinyItemComponent subclass;
  const SubclassMobileCard({
    required this.subclass,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DestinyInventoryItemDefinition subclassDef =
        ManifestService.manifestParsed.destinyInventoryItemDefinition[subclass.itemHash]!;
    return InkWell(
      onTap: () {
        Provider.of<BuilderSubclassProvider>(context, listen: false).setSubclass(subclass.itemInstanceId, subclassDef);
        subclassDef.talentGrid?.talentGridHash == 0
            ? Navigator.pushNamed(
                context,
                routeSubclassMod,
              )
            : Navigator.pushNamed(
                context,
                routeClassItemChoice,
              );
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
                        decoration: BoxDecoration(border: Border.all(color: Colors.white)),
                      ),
                    ),
                    Image(
                      image: NetworkImage(DestinyData.bungieLink + subclassDef.displayProperties!.icon!),
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
