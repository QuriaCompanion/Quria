import 'package:flutter/material.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.enum.dart';

class StatisticDisplay extends StatelessWidget {
  final int value;
  final String icon;
  final double width;
  final double height;
  final double fontsize;
  final double padding;
  const StatisticDisplay(
      {Key? key,
      required this.value,
      required this.icon,
      this.width = 40,
      this.height = 40,
      this.fontsize = 25,
      this.padding = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String link = DestinyData.bungieLink + icon;
    return SizedBox(
      width: width,
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(link),
          Padding(
            padding: EdgeInsets.only(left: padding),
            child: Text('$value',
                style: TextStyle(color: Colors.white70, fontSize: fontsize)),
          )
        ],
      ),
    );
  }
}
