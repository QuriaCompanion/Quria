import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:bungie_api/models/destiny_node_step_definition.dart';
import 'package:flutter/material.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';

@immutable
class TalentGridDisplay extends StatelessWidget {
  final double iconSize;
  final DestinyNodeStepDefinition nodeDef;
  final double width;
  final double sidePadding;
  final double childPadding;
  final double fontSize;
  final int nodeIndex;

  const TalentGridDisplay(
      {required this.nodeIndex,
      required this.nodeDef,
      this.width = 800,
      this.childPadding = 15,
      this.sidePadding = 25,
      this.fontSize = 20,
      this.iconSize = 50,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(childPadding),
      child: SizedBox(
        width: width - childPadding * 2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Tooltip(
              message: utf8.decode(nodeDef.displayProperties!.description!.runes.toList()),
              textStyle: TextStyle(
                fontSize: fontSize,
                color: Colors.white,
              ),
              child: CircleAvatar(
                radius: iconSize / 2,
                child: Image(
                  image: NetworkImage(DestinyData.bungieLink + nodeDef.displayProperties!.icon!),
                ),
              ),
            ),
            SizedBox(width: sidePadding),
            SizedBox(
              width: (width - childPadding * 2) - iconSize - sidePadding,
              child: AutoSizeText(
                utf8.decode(nodeDef.displayProperties!.name!.runes.toList()),
                style: TextStyle(fontSize: fontSize, color: Colors.white),
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
