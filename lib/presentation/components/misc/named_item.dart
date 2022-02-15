import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.enum.dart';

class NamedItem extends StatelessWidget {
  final DestinyInventoryItemDefinition value;
  final double? width;
  final Color? txtColor;

  const NamedItem(
      {Key? key,
      required this.value,
      this.width = 150,
      this.txtColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        width: width,
        decoration: regularShadow,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Stack(children: [
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
            SizedBox(
              height: width! / 2,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Center(
                  child: AutoSizeText(
                      utf8.decode(
                          value.displayProperties!.name!.runes.toList()),
                      wrapWords: false,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, color: txtColor),
                      overflow: TextOverflow.clip),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
