import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/helpers/inspectSubclassHelper.model.dart';
import 'dart:math' as math;

import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/presentation/screens/profile/components/character_stats_listing.dart';
import 'package:quria/presentation/var/routes.dart';

class ProfileMobileHeader extends StatefulWidget {
  final String characterId;
  final String characterSuper;
  final String subclassId;
  final Map<String, int>? stats;
  final bool isNewSubclass;

  const ProfileMobileHeader({
    required this.stats,
    required this.characterId,
    required this.characterSuper,
    required this.subclassId,
    required this.isNewSubclass,
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileMobileHeader> createState() => _ProfileMobileHeaderState();
}

class _ProfileMobileHeaderState extends State<ProfileMobileHeader> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: globalPadding(context)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(
                routeInspectSubclass,
                arguments: InspectSubclassHelper(
                    isNewSubclass: widget.isNewSubclass,
                    subclassId: widget.subclassId,
                    characterId: widget.characterId),
              );
            },
            child: Stack(
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
                  image: NetworkImage(
                      DestinyData.bungieLink + widget.characterSuper),
                  height: vw(context) * 0.17,
                  width: vw(context) * 0.17,
                  fit: BoxFit.fill,
                ),
              ],
            ),
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
