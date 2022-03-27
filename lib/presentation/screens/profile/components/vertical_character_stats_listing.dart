import 'package:flutter/material.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/bungie_api/enums/grenade_cooldowns.dart';
import 'package:quria/data/services/bungie_api/enums/melee_cooldowns.enum.dart';
import 'package:quria/data/services/bungie_api/enums/super_coodowns.dart';
import 'package:quria/data/services/bungie_api/profile.service.dart';
import 'package:quria/presentation/components/misc/statistic_display.dart';

class VerticalCharacterStatsListing extends StatefulWidget {
  final Map<String, int> stats;
  final String characterId;
  final double fontSize;
  final double width;
  final Axis direction;
  const VerticalCharacterStatsListing({
    Key? key,
    required this.stats,
    required this.characterId,
    this.direction = Axis.vertical,
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
  }

  @override
  Widget build(BuildContext context) {
    int disciplineTier =
        (widget.stats[StatsStringHash.discipline]! / 10).floor();
    int superTier = (widget.stats[StatsStringHash.intellect]! / 10).floor();
    int strengthTier = (widget.stats[StatsStringHash.strength]! / 10).floor();

    int grenadeHash =
        ProfileService().getCurrentGrenadeHashForCharacter(widget.characterId)!;
    int? grenadeTimer =
        GrenadeCooldown.grenadeMap[grenadeHash]?[disciplineTier];

    int superHash =
        ProfileService().getCurrentSuperHashForCharacter(widget.characterId)!;
    int? superTimer = SuperCooldown.superMap[superHash]?[superTier];

    int meleeHash =
        ProfileService().getCurrentMeleeHashForCharacter(widget.characterId)!;
    int? meleeTimer = MeleeCooldown.meleeMap[meleeHash]?[strengthTier];

    timerStat = {
      StatsStringHash.discipline: formatTime(grenadeTimer),
      StatsStringHash.intellect: formatTime(superTimer),
      StatsStringHash.strength: formatTime(meleeTimer),
    };
    if (widget.direction == Axis.vertical) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          for (int i = 0; i < 6; i++)
            Tooltip(
              message: timerStat[DestinyData.armorStats[i]] ?? '',
              child: VerticalStatisticDisplay(
                  value: widget.stats[DestinyData.armorStats[i]]!,
                  icon: DestinyData.statsIcon[i],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  width: widget.width,
                  fontsize: widget.fontSize),
            ),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (int i = 0; i < 6; i++)
            Tooltip(
              message: timerStat[DestinyData.armorStats[i]] ?? '',
              child: VerticalStatisticDisplay(
                  value: widget.stats[DestinyData.armorStats[i]]!,
                  icon: DestinyData.statsIcon[i],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  width: widget.width * 0.064,
                  fontsize: widget.fontSize),
            ),
        ],
      );
    }
  }

  String formatTime(time) {
    var minutes = (time ~/ 60);
    var seconds = time % 60;
    if (minutes == 0) return "$seconds sec";
    return "$minutes min $seconds sec";
  }
}
