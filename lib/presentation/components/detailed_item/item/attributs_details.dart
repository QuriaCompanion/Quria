import 'dart:convert';

import 'package:bungie_api/enums/destiny_item_sub_type.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:bungie_api/models/destiny_item_socket_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quria/cubit/attributs_details_cubit.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/bungie_api/profile.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';

@immutable
class AttributsDetails extends StatelessWidget {
  final int socketId;
  final profile = ProfileService();
  final DestinyItemComponent item;
  final double width;
  final double fontSize;
  final double iconSize;
  final double padding;
  AttributsDetails({
    required this.item,
    required this.fontSize,
    this.width = 800,
    this.iconSize = 100,
    this.socketId = 0,
    this.padding = 8,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<DestinyItemSocketState> sockets =
        profile.getItemSockets(item.itemInstanceId!)!;
    sockets = sockets
        .where((socket) => (ManifestService
                    .manifestParsed
                    .destinyInventoryItemDefinition![socket.plugHash]
                    ?.itemSubType ==
                DestinyItemSubType.None &&
            socket.isVisible == true &&
            ManifestService
                    .manifestParsed
                    .destinyInventoryItemDefinition![socket.plugHash]
                    ?.plug
                    ?.plugCategoryHash !=
                2947756142))
        .toList();
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: padding,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              for (var index = 0; index < sockets.length; index++)
                InkWell(
                  onTap: () {
                    context.read<AttributsDetailsCubit>().changeId(index);
                  },
                  child: Container(
                      color: index == socketId
                          ? Colors.grey.withOpacity(0.3)
                          : Colors.transparent,
                      margin: EdgeInsets.symmetric(horizontal: padding / 2),
                      height: iconSize,
                      width: iconSize,
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
                    if (ManifestService
                            .manifestParsed
                            .destinyInventoryItemDefinition![
                                sockets[socketId].plugHash]!
                            .perks!
                            .isNotEmpty &&
                        ManifestService
                                .manifestParsed
                                .destinySandboxPerkDefinition?[ManifestService
                                    .manifestParsed
                                    .destinyInventoryItemDefinition?[
                                        sockets[socketId].plugHash]
                                    ?.perks?[0]
                                    .perkHash]
                                ?.displayProperties
                                ?.description !=
                            null)
                      Text(
                        utf8.decode(ManifestService
                            .manifestParsed
                            .destinySandboxPerkDefinition![ManifestService
                                .manifestParsed
                                .destinyInventoryItemDefinition![
                                    sockets[socketId].plugHash]!
                                .perks![0]
                                .perkHash]!
                            .displayProperties!
                            .description!
                            .runes
                            .toList()),
                        style:
                            TextStyle(fontSize: fontSize, color: Colors.white),
                      )
                    else
                      Text(
                        utf8.decode(ManifestService
                            .manifestParsed
                            .destinyInventoryItemDefinition![
                                sockets[socketId].plugHash]!
                            .displayProperties!
                            .description!
                            .runes
                            .toList()),
                        style:
                            TextStyle(fontSize: fontSize, color: Colors.white),
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
