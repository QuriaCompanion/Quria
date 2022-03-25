import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';

class MobileItemHeader extends StatelessWidget {
  final String name;
  final String type;
  final String iconElement;
  final int power;

  const MobileItemHeader(
      {required this.name,
      required this.type,
      required this.iconElement,
      required this.power,
      Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(globalPadding(context)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textH1(name),
          SizedBox(
            height: 22,
            child: Row(
              children: [
                Image(
                    height: 16,
                    width: 16,
                    image: NetworkImage(DestinyData.bungieLink + iconElement)),
                const SizedBox(width: 8),
                textH2(power.toString()),
                divider,
                textBodyRegular(type),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
