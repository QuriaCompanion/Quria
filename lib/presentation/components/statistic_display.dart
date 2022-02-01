import 'package:flutter/material.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.enum.dart';

class StatisticDisplay extends StatelessWidget {
  final int value;
  final String icon;
  final double width;
  final double fontsize;
  final MainAxisAlignment mainAxisAlignment;
  const StatisticDisplay(
      {Key? key,
      required this.value,
      required this.icon,
      this.mainAxisAlignment = MainAxisAlignment.start,
      this.width = 40,
      this.fontsize = 25})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String link = DestinyData.bungieLink + icon;
    return SizedBox(
      width: width,
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        children: [
          Image.network(link),
          Text('$value',
              style: TextStyle(color: Colors.white70, fontSize: fontsize))
        ],
      ),
    );
  }
}
