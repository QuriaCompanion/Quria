import 'dart:convert';

import 'package:bungie_api/enums/destiny_item_sub_type.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quria/cubit/attributs_details_cubit.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.enum.dart';
import 'package:quria/data/services/bungie_api/profile.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';

@immutable
class AttributsDetails extends StatelessWidget {
  final int socketId;
  final profile = ProfileService();
  final DestinyItemComponent item;
  final double width;
  final double fontSize;
  final double padding;
  AttributsDetails({
    required this.item,
    required this.fontSize,
    this.width = 800,
    this.socketId = 0,
    this.padding = 8,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sockets = profile.getItemSockets(item.itemInstanceId!);
    const double imgSize = 80;

    return Container(
      margin: EdgeInsets.symmetric(
        vertical: padding,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              for (var index = 0; index < sockets!.length; index++)
                if (ManifestService
                            .manifestParsed
                            .destinyInventoryItemDefinition![
                                sockets[index].plugHash]
                            ?.itemSubType ==
                        DestinyItemSubType.None &&
                    sockets[index].isVisible == true)
                  InkWell(
                    onTap: () =>
                        context.read<AttributsDetailsCubit>().changeId(index),
                    child: Container(
                        color: index == socketId
                            ? Colors.grey.withOpacity(0.3)
                            : Colors.transparent,
                        margin: EdgeInsets.symmetric(horizontal: padding / 2),
                        height: imgSize,
                        width: imgSize,
                        child: Image(
                          image: NetworkImage(DestinyData.bungieLink +
                              ManifestService
                                  .manifestParsed
                                  .destinyInventoryItemDefinition![
                                      sockets[index].plugHash]!
                                  .displayProperties!
                                  .icon!),
                          fit: BoxFit.fill,
                        )),
                  ),
            ],
          ),
          SizedBox(height: padding),
          Row(
            children: [
              SizedBox(
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      utf8.decode(ManifestService
                          .manifestParsed
                          .destinyInventoryItemDefinition![
                              sockets[socketId].plugHash]!
                          .displayProperties!
                          .name!
                          .runes
                          .toList()),
                      style: TextStyle(fontSize: fontSize, color: Colors.white),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: padding),
                    Text(
                      utf8.decode(ManifestService
                          .manifestParsed
                          .destinyInventoryItemDefinition![
                              sockets[socketId].plugHash]!
                          .displayProperties!
                          .description!
                          .runes
                          .toList()),
                      style: TextStyle(fontSize: fontSize, color: Colors.white),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
