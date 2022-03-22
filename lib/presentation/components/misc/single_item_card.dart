import 'dart:convert';

import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/storage/storage.service.dart';
import 'package:quria/presentation/var/routes.dart';

@immutable
class SingleItemCard extends StatelessWidget {
  final DestinyInventoryItemDefinition data;
  final double fontSize;
  final double sizes;
  const SingleItemCard(
      {required this.data, this.fontSize = 20, this.sizes = 150, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        StorageService.setLocalStorage("exotic", data.hash),
        Navigator.pushNamed(context, routeBuilder)
      },
      child: Container(
        decoration: regularShadow,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.network(
                DestinyData.bungieLink + data.displayProperties!.icon!,
                width: sizes,
                fit: BoxFit.fill),
            Text(utf8.decode(data.displayProperties!.name!.runes.toList()),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: fontSize, color: Colors.white),
                overflow: TextOverflow.clip),
          ],
        ),
      ),
    );
  }
}
