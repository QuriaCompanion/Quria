import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';

class ArmorModIconDisplay extends StatelessWidget {
  final DestinyInventoryItemDefinition socket;
  final double iconSize;
  const ArmorModIconDisplay(
      {required this.iconSize, required this.socket, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.white)),
      width: iconSize,
      height: iconSize,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Image(
            width: iconSize,
            height: iconSize,
            image: NetworkImage(
                DestinyData.bungieLink + socket.displayProperties!.icon!),
          ),
          if (socket.investmentStats!.isNotEmpty &&
              ManifestService
                      .manifestParsed
                      .destinyStatDefinition?[
                          socket.investmentStats?[0].statTypeHash]
                      ?.displayProperties
                      ?.hasIcon ==
                  true)
            Image(
              width: iconSize,
              height: iconSize,
              image: NetworkImage(DestinyData.bungieLink +
                  ManifestService
                      .manifestParsed
                      .destinyStatDefinition![
                          socket.investmentStats![0].statTypeHash]!
                      .displayProperties!
                      .icon!),
            ),
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: textBodyBold(
                socket.plug?.energyCost?.energyCost.toString() ?? ""),
          ),
        ],
      ),
    );
  }
}
