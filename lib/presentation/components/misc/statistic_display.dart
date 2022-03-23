import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: width,
              child: Image.network(link),
            ),
            SizedBox(
              width: width,
              child: AutoSizeText('$value',
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  minFontSize: 5,
                  style: TextStyle(color: Colors.white70, fontSize: fontsize)),
            ),
          ],
        )
        // child: Row(
        //   mainAxisAlignment: mainAxisAlignment,
        //   children: [
        //
        //     SizedBox(
        //       width: width * 0.5,
        //       child: AutoSizeText('$value',
        //           textAlign: TextAlign.center,
        //           maxLines: 1,
        //           minFontSize: 5,
        //           style: TextStyle(color: Colors.white70, fontSize: fontsize)),
        //     )
        //   ],
        // ),
        );
  }
}
