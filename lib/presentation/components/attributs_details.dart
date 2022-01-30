// Quentin tu le fais -> coucou je lai fait
import 'dart:convert';

import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quria/cubit/attributs_details_cubit.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.enum.dart';
import 'package:quria/data/services/bungie_api/profile.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';

class AttributsDetails extends StatelessWidget {
  final int socketId;
  final profile = ProfileService();
  DestinyItemComponent item;
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
              InkWell(
                onTap: () => context.read<AttributsDetailsCubit>().changeId(0),
                child: SizedBox(
                    height: imgSize,
                    width: imgSize,
                    child: Image(
                      image: NetworkImage(DestinyData.bungieLink +
                          ManifestService
                              .manifestParsed
                              .destinyInventoryItemDefinition![
                                  sockets![0].plugHash]!
                              .displayProperties!
                              .icon!),
                      fit: BoxFit.fill,
                    )),
              ),
              const SizedBox(width: 30),
              InkWell(
                onTap: () => context.read<AttributsDetailsCubit>().changeId(1),
                child: SizedBox(
                    height: imgSize,
                    width: imgSize,
                    child: Image(
                      image: NetworkImage(DestinyData.bungieLink +
                          ManifestService
                              .manifestParsed
                              .destinyInventoryItemDefinition![
                                  sockets[1].plugHash]!
                              .displayProperties!
                              .icon!),
                      fit: BoxFit.fill,
                    )),
              ),
              const SizedBox(width: 30),
              InkWell(
                onTap: () => context.read<AttributsDetailsCubit>().changeId(2),
                child: SizedBox(
                    height: imgSize,
                    width: imgSize,
                    child: Image(
                      image: NetworkImage(DestinyData.bungieLink +
                          ManifestService
                              .manifestParsed
                              .destinyInventoryItemDefinition![
                                  sockets[2].plugHash]!
                              .displayProperties!
                              .icon!),
                      fit: BoxFit.fill,
                    )),
              ),
              const SizedBox(width: 30),
              InkWell(
                onTap: () => context.read<AttributsDetailsCubit>().changeId(3),
                child: SizedBox(
                    height: imgSize,
                    width: imgSize,
                    child: Image(
                      image: NetworkImage(DestinyData.bungieLink +
                          ManifestService
                              .manifestParsed
                              .destinyInventoryItemDefinition![
                                  sockets[3].plugHash]!
                              .displayProperties!
                              .icon!),
                      fit: BoxFit.fill,
                    )),
              ),
              const SizedBox(width: 15),
              InkWell(
                onTap: () => context.read<AttributsDetailsCubit>().changeId(4),
                child: SizedBox(
                    height: imgSize,
                    width: imgSize,
                    child: Image(
                      image: NetworkImage(DestinyData.bungieLink +
                          ManifestService
                              .manifestParsed
                              .destinyInventoryItemDefinition![
                                  sockets[4].plugHash]!
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
                      style: const TextStyle(fontSize: 20, color: Colors.white),
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
                      style: const TextStyle(fontSize: 20, color: Colors.white),
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
