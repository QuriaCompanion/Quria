import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.enum.dart';
import 'package:quria/data/services/bungie_api/profile.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/talent_grid_display.dart';

@immutable
class SubclassDetailCardWidget extends StatelessWidget {
  final profile = ProfileService();
  final int attributeSocketId;
  final double fontSize;
  final DestinyItemComponent subclass;
  final double width;
  final double sidePadding;
  final double imageSize;
  final String characterId;
  final double childPadding;
  final double iconSize;
  SubclassDetailCardWidget({
    required this.characterId,
    required this.subclass,
    this.attributeSocketId = 0,
    this.width = 800,
    this.fontSize = 20,
    this.sidePadding = 25,
    this.imageSize = 150,
    this.childPadding = 20,
    this.iconSize = 100,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final info = profile.getTalentGrid(subclass.itemInstanceId!);

    return Container(
      width: width,
      padding: EdgeInsets.all(sidePadding),
      decoration: blackTransparentBackground,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: NetworkImage(DestinyData.bungieLink +
                ManifestService
                    .manifestParsed
                    .destinyInventoryItemDefinition![subclass.itemHash]!
                    .displayProperties!
                    .icon!),
          ),
          SizedBox(
            height: (5 * iconSize) + (5 * childPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    for (int i = 0; i < 11; i++)
                      if (info!.nodes![i].isActivated == true &&
                          info.nodes![i].hidden != true)
                        TalentGridDisplay(
                            width: (width / 2) - (sidePadding * 2) - 1,
                            sidePadding: sidePadding,
                            childPadding: childPadding,
                            nodeIndex: i,
                            iconSize: iconSize,
                            nodeDef: ManifestService
                                .manifestParsed
                                .destinyTalentGridDefinition![
                                    info.talentGridHash!]!
                                .nodes![info.nodes![i].nodeIndex!]
                                .steps![0])
                  ],
                ),
                const VerticalDivider(
                  color: Colors.white,
                  thickness: 2,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    for (int i = 11; i < 24; i++)
                      if (info!.nodes![i].isActivated == true &&
                          info.nodes![i].hidden != true)
                        TalentGridDisplay(
                            width: (width / 2) - (sidePadding * 2) - 1,
                            fontSize: fontSize,
                            sidePadding: sidePadding,
                            childPadding: childPadding,
                            nodeIndex: i,
                            iconSize: iconSize,
                            nodeDef: ManifestService
                                .manifestParsed
                                .destinyTalentGridDefinition![
                                    info.talentGridHash!]!
                                .nodes![info.nodes![i].nodeIndex!]
                                .steps![0])
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
