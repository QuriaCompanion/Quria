import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'dart:math' as math;

class SubclassMobileCard extends StatelessWidget {
  final DestinyItemComponent subclass;
  final Function(DestinyInventoryItemDefinition) onTap;
  final double width;
  final Color color;
  const SubclassMobileCard({
    required this.subclass,
    required this.width,
    required this.onTap,
    this.color = blackLight,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DestinyInventoryItemDefinition subclassDef =
        ManifestService.manifestParsed.destinyInventoryItemDefinition[subclass.itemHash]!;
    return InkWell(
      onTap: () => onTap(subclassDef),
      child: Container(
          width: width,
          height: width,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
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
                        height: width / 2,
                        width: width / 2,
                        decoration: BoxDecoration(border: Border.all(color: Colors.white)),
                      ),
                    ),
                    Image(
                      filterQuality: FilterQuality.high,
                      image: NetworkImage('${DestinyData.bungieLink}${subclassDef.displayProperties!.icon!}?t=123456'),
                      height: width / 2 * 1.2,
                      width: width / 2 * 1.2,
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
