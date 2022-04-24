import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'dart:math' as math;

import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/bungie_api/Profile.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/screens/Profile/components/character_stats_listing.dart';

class CollectionMobileHeader extends StatefulWidget {
  final String characterId;
  final Map<String, int>? stats;

  const CollectionMobileHeader({
    Key? key,
    required this.stats,
    required this.characterId,
  }) : super(key: key);

  @override
  State<CollectionMobileHeader> createState() => _CollectionMobileHeaderState();
}

class _CollectionMobileHeaderState extends State<CollectionMobileHeader> {
  @override
  Widget build(BuildContext context) {
    int superHash =
        ProfileService().getCurrentSuperHashForCharacter(widget.characterId)!;
    String characterSuper = ManifestService
            .manifestParsed
            .destinyInventoryItemDefinition[superHash]
            ?.displayProperties
            ?.icon ??
        ManifestService
            .manifestParsed
            .destinySandboxPerkDefinition[
                DestinyData.superNodeToSandbox[superHash]]
            ?.displayProperties
            ?.icon ??
        "";
    return Padding(
      padding: EdgeInsets.only(bottom: globalPadding(context)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Transform.rotate(
                angle: -math.pi / 4,
                child: Container(
                  height: vw(context) * 0.15,
                  width: vw(context) * 0.15,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.white)),
                ),
              ),
              Image(
                image: NetworkImage(DestinyData.bungieLink + characterSuper),
                height: vw(context) * 0.17,
                width: vw(context) * 0.17,
                fit: BoxFit.fill,
              ),
            ],
          ),
          SizedBox(
            height: vw(context) * 0.17,
            child: CharacterStatsListing(
              stats: widget.stats!,
              characterId: widget.characterId,
              direction: Axis.horizontal,
              width: vw(context) * 0.6,
            ),
          ),
        ],
      ),
    );
  }
}
