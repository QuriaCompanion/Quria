import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';

class NamedItem extends StatelessWidget {
  final DestinyInventoryItemDefinition value;
  final double width;
  final Color txtColor;
  final double sideTextPadding;

  const NamedItem(
      {Key? key,
      required this.value,
      this.sideTextPadding = 15,
      this.width = 150,
      this.txtColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: regularShadow,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Hero(
            tag: value.hash!,
            child: Stack(children: [
              Image.network(
                  DestinyData.bungieLink + value.displayProperties!.icon!,
                  width: width,
                  fit: BoxFit.fill),
              if (value.iconWatermark != null)
                Image(
                  image: NetworkImage(
                      DestinyData.bungieLink + value.iconWatermark!),
                  height: width,
                  fit: BoxFit.fill,
                ),
            ]),
          ),
          SizedBox(
            height: width / 2,
            width: width,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: sideTextPadding),
              child: SizedBox(
                width: width - sideTextPadding * 2,
                height: width / 2,
                child: Center(
                  child: AutoSizeText(
                    utf8.decode(value.displayProperties!.name!.runes.toList()),
                    style: TextStyle(color: txtColor),
                    maxLines: 2,
                    stepGranularity: 2,
                    textAlign: TextAlign.center,
                    maxFontSize: 20,
                    minFontSize: 4,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
