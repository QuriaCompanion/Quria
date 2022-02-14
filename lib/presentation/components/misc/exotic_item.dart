import 'dart:convert';

import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:flutter/material.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.enum.dart';
import 'package:quria/data/services/storage/storage.service.dart';
import 'package:quria/presentation/var/routes.dart';

class ExoticItem extends StatelessWidget {
  final DestinyInventoryItemDefinition value;
  final double? width;
  final Color? txtColor;

  const ExoticItem(
      {Key? key,
      required this.value,
      this.width = 150,
      this.txtColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        StorageService.setLocalStorage("exotic", value.hash),
        Navigator.pushNamed(context, routeBuilder)
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          width: width,
          decoration: BoxDecoration(
            color: Colors.grey.shade700,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.network(
                  DestinyData.bungieLink + value.displayProperties!.icon!,
                  width: width,
                  fit: BoxFit.fill),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                    utf8.decode(value.displayProperties!.name!.runes.toList()),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: txtColor),
                    overflow: TextOverflow.clip),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
