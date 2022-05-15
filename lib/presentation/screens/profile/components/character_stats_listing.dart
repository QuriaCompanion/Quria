import 'package:flutter/material.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/display/display.service.dart';
import 'package:quria/presentation/components/misc/statistic_display.dart';

class CharacterStatsListing extends StatefulWidget {
  final Map<String, int> stats;
  final String characterId;
  final double fontSize;
  final double width;
  final Axis direction;
  const CharacterStatsListing({
    Key? key,
    required this.stats,
    required this.characterId,
    this.direction = Axis.vertical,
    this.fontSize = 30,
    this.width = 110,
  }) : super(key: key);

  @override
  CharacterStatsListingState createState() => CharacterStatsListingState();
}

class CharacterStatsListingState extends State<CharacterStatsListing> {
  late Map<String, String> data;
  @override
  initState() {
    super.initState();
    data = DisplayService().getStatsListing(widget.characterId, widget.stats);
  }

  @override
  void didUpdateWidget(covariant CharacterStatsListing oldWidget) {
    super.didUpdateWidget(oldWidget);
    data = DisplayService().getStatsListing(widget.characterId, widget.stats);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.direction == Axis.vertical) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          for (int i = 0; i < 6; i++)
            Tooltip(
              message: data[DestinyData.armorStats[i]] ?? '',
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
      return SizedBox(
        width: widget.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (int i = 0; i < 6; i++)
              Tooltip(
                message: data[DestinyData.armorStats[i]] ?? '',
                child: VerticalStatisticDisplay(
                    value: widget.stats[DestinyData.armorStats[i]]!,
                    icon: DestinyData.statsIcon[i],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    width: widget.width * 0.14,
                    fontsize: widget.fontSize),
              ),
          ],
        ),
      );
    }
  }
}
