import 'package:flutter/material.dart';
import 'package:quria/data/models/helpers/profileHelper.model.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.enum.dart';
import 'package:quria/data/services/bungie_api/enums/grenade_cooldowns.enum.dart';
import 'package:quria/data/services/bungie_api/enums/super_coodowns.enum.dart';
import 'package:quria/data/services/bungie_api/profile.service.dart';
import 'package:quria/presentation/components/misc/statistic_display.dart';

class VerticalCharacterStatsListing extends StatefulWidget {
  final ProfileHelper? data;
  final int characterIndex;
  final double fontSize;
  final double width;
  const VerticalCharacterStatsListing({
    Key? key,
    required this.data,
    required this.characterIndex,
    this.fontSize = 30,
    this.width = 110,
  }) : super(key: key);

  @override
  _VerticalCharacterStatsListingState createState() =>
      _VerticalCharacterStatsListingState();
}

class _VerticalCharacterStatsListingState
    extends State<VerticalCharacterStatsListing> {
  late Map<String, dynamic> timerStat;
  @override
  initState() {
    super.initState();
    int disciplineTier =
        (widget.data!.characters[widget.characterIndex].stats!["1735777505"]! /
                10)
            .floor();
    int superTier =
        (widget.data!.characters[widget.characterIndex].stats!["144602215"]! /
                10)
            .floor();

    int? grenadeHash = ProfileService().getCurrentGrenadeHashForCharacter(
        widget.data!.characters[widget.characterIndex].characterId!);
    int? grenadeTimer =
        GrenadeCooldown.grenadeMap[grenadeHash]?[disciplineTier];

    int? superHash = ProfileService().getCurrentSuperHashForCharacter(
        widget.data!.characters[widget.characterIndex].characterId!);
    int? superTimer = SuperCooldown.superMap[superHash]?[superTier];

    timerStat = {
      '1735777505': formatTime(grenadeTimer),
      '144602215': formatTime(superTimer),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        for (int i = 0; i < 6; i++)
          Tooltip(
            message: timerStat[DestinyData.armorStats[i]] ?? '',
            child: StatisticDisplay(
                value: widget.data!.characters[widget.characterIndex]
                    .stats![DestinyData.armorStats[i]]!,
                icon: DestinyData.statsIcon[i],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                width: widget.width,
                fontsize: widget.fontSize),
          ),
      ],
    );
  }

  String formatTime(time) {
    var minutes = (time ~/ 60);
    var seconds = time % 60;
    if (minutes == 0) return "$seconds sec";
    return "$minutes min $seconds sec";
  }
}
