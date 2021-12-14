import 'package:flutter/material.dart';

class StatisticDisplay extends StatefulWidget {
  final int value;
  final int i;
  const StatisticDisplay({Key? key, required this.value, required this.i})
      : super(key: key);

  @override
  _StatisticDisplayState createState() => _StatisticDisplayState();
}

class _StatisticDisplayState extends State<StatisticDisplay> {
  @override
  Widget build(BuildContext context) {
    String link =
        "https://www.bungie.net/common/destiny2_content/icons/e26e0e93a9daf4fdd21bf64eb9246340.png";
    switch (widget.i) {
      case 1:
        link =
            "https://www.bungie.net/common/destiny2_content/icons/202ecc1c6febeb6b97dafc856e863140.png";
        break;
      case 2:
        link =
            "https://www.bungie.net/common/destiny2_content/icons/128eee4ee7fc127851ab32eac6ca91cf.png";
        break;
      case 3:
        link =
            "https://www.bungie.net/common/destiny2_content/icons/ca62128071dc254fe75891211b98b237.png";
        break;
      case 4:
        link =
            "https://www.bungie.net/common/destiny2_content/icons/59732534ce7060dba681d1ba84c055a6.png";
        break;
      case 5:
        link =
            "https://www.bungie.net/common/destiny2_content/icons/c7eefc8abbaa586eeab79e962a79d6ad.png";
        break;
    }
    return SizedBox(
      width: 85,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(link, width: 40, height: 40),
          Text('${widget.value}',
              style: TextStyle(color: Colors.white, fontSize: 25))
        ],
      ),
    );
  }
}
