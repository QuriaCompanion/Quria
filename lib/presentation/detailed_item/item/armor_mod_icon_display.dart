import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';

class ArmorModIconDisplay extends StatelessWidget {
  final DestinyInventoryItemDefinition socket;
  const ArmorModIconDisplay({required this.socket, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: mobileItemSize(context),
      height: mobileItemSize(context),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Image(
            width: mobileItemSize(context),
            height: mobileItemSize(context),
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
              width: mobileItemSize(context),
              height: mobileItemSize(context),
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
