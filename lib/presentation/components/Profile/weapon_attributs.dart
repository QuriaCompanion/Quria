import 'dart:convert';

import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:quria/cubit/weapon_details_cubit.dart';
import 'package:quria/data/services/bungie_api/profile.service.dart';

Map<int, DestinyInventoryItemDefinition> _manifestParsed = {};

class WeaponAttributsWidget extends StatelessWidget {
  final int socketId;
  final profile = ProfileService();
  DestinyItemComponent item;
  WeaponAttributsWidget({
    required this.item,
    this.socketId = 0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(this.socketId);
    final sockets = profile.getItemSockets(item.itemInstanceId!);
    const double imgSize = 80;
    int socketId = 0;

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 10),
          child: Row(
            children: [
              InkWell(
                onTap: () => context.read<WeaponDetailsCubit>().changeId(0),
                child: SizedBox(
                    height: imgSize,
                    width: imgSize,
                    child: Image(
                      image: NetworkImage('https://www.bungie.net' +
                          _manifestParsed[sockets![0].plugHash]!
                              .displayProperties!
                              .icon!),
                      fit: BoxFit.fill,
                    )),
              ),
              const SizedBox(width: 30),
              InkWell(
                onTap: () => context.read<WeaponDetailsCubit>().changeId(1),
                child: SizedBox(
                    height: imgSize,
                    width: imgSize,
                    child: Image(
                      image: NetworkImage('https://www.bungie.net' +
                          _manifestParsed[sockets[1].plugHash]!
                              .displayProperties!
                              .icon!),
                      fit: BoxFit.fill,
                    )),
              ),
              const SizedBox(width: 30),
              SizedBox(
                  height: imgSize,
                  width: imgSize,
                  child: Image(
                    image: NetworkImage('https://www.bungie.net' +
                        _manifestParsed[sockets[2].plugHash]!
                            .displayProperties!
                            .icon!),
                    fit: BoxFit.fill,
                  )),
              const SizedBox(width: 30),
              SizedBox(
                  height: imgSize,
                  width: imgSize,
                  child: Image(
                    image: NetworkImage('https://www.bungie.net' +
                        _manifestParsed[sockets[3].plugHash]!
                            .displayProperties!
                            .icon!),
                    fit: BoxFit.fill,
                  )),
              const SizedBox(width: 15),
              SizedBox(
                  height: imgSize,
                  width: imgSize,
                  child: Image(
                    image: NetworkImage('https://www.bungie.net' +
                        _manifestParsed[sockets[4].plugHash]!
                            .displayProperties!
                            .icon!),
                    fit: BoxFit.fill,
                  )),
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
                      utf8.decode(_manifestParsed[sockets[socketId].plugHash]!
                          .displayProperties!
                          .name!
                          .runes
                          .toList()),
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      utf8.decode(_manifestParsed[sockets[socketId].plugHash]!
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

// class _WeaponAttributsWidget extends State<WeaponAttributsWidget> {
  
//   @override
//   Widget build(BuildContext context) {

//       final profile = ProfileService();

//     const double imgSize = 80;
//     final sockets = profile.getItemSockets(item.itemInstanceId!);


//     return Container(
//       child: Column(children: [
//          Container(
//                       margin: const EdgeInsets.only(left: 10),
//                       child: Row(
//                         children: [
//                           InkWell(
//                             onTap: () => socketId = 0,
//                             child: SizedBox(
//                                 height: imgSize,
//                                 width: imgSize,
//                                 child: Image(
//                                   image: NetworkImage('https://www.bungie.net' +
//                                       _manifestParsed[sockets![0].plugHash]!
//                                           .displayProperties!
//                                           .icon!),
//                                   fit: BoxFit.fill,
//                                 )),
//                           ),
//                           SizedBox(width: 30),
//                           InkWell(
//                             onTap: () => socketId = 1,
//                             child: SizedBox(
//                                 height: imgSize,
//                                 width: imgSize,
//                                 child: Image(
//                                   image: NetworkImage('https://www.bungie.net' +
//                                       _manifestParsed[sockets[1].plugHash]!
//                                           .displayProperties!
//                                           .icon!),
//                                   fit: BoxFit.fill,
//                                 )),
//                           ),
//                           SizedBox(width: 30),
//                           SizedBox(
//                               height: imgSize,
//                               width: imgSize,
//                               child: Image(
//                                 image: NetworkImage('https://www.bungie.net' +
//                                     _manifestParsed[sockets[2].plugHash]!
//                                         .displayProperties!
//                                         .icon!),
//                                 fit: BoxFit.fill,
//                               )),
//                           SizedBox(width: 30),
//                           SizedBox(
//                               height: imgSize,
//                               width: imgSize,
//                               child: Image(
//                                 image: NetworkImage('https://www.bungie.net' +
//                                     _manifestParsed[sockets[3].plugHash]!
//                                         .displayProperties!
//                                         .icon!),
//                                 fit: BoxFit.fill,
//                               )),
//                           SizedBox(width: 15),
//                           SizedBox(
//                               height: imgSize,
//                               width: imgSize,
//                               child: Image(
//                                 image: NetworkImage('https://www.bungie.net' +
//                                     _manifestParsed[sockets[4].plugHash]!
//                                         .displayProperties!
//                                         .icon!),
//                                 fit: BoxFit.fill,
//                               )),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: 30),
//                     Container(
//       ],),
//     )
//   }
// }
