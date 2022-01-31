// Quentin tu le fais -> coucou je lai fait
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
  AttributsDetails({
    required this.item,
    this.socketId = 0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sockets = profile.getItemSockets(item.itemInstanceId!);
    const double imgSize = 80;

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 10),
          child: Row(
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
                    child: SizedBox(
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
        ),
        const SizedBox(height: 30),
        Container(
          margin: const EdgeInsets.only(left: 10),
          child: Row(
            children: [
              SizedBox(
                width: 600,
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
                      style: TextStyle(fontSize: 20, color: Colors.white),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      utf8.decode(ManifestService
                          .manifestParsed
                          .destinyInventoryItemDefinition![
                              sockets[socketId].plugHash]!
                          .displayProperties!
                          .description!
                          .runes
                          .toList()),
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
