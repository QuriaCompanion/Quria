// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'dart:convert';
import 'dart:developer';
import 'package:bungie_api/models/destiny_character_component.dart';
import 'package:bungie_api/models/destiny_class_definition.dart';
import 'package:bungie_api/models/destiny_damage_type_definition.dart';
import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:bungie_api/models/destiny_stat_definition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quria/cubit/character_cubit.dart';
import 'package:quria/data/models/AllDestinyManifestComponents.model.dart';
import 'package:quria/data/models/helpers/profileHelper.model.dart';
import 'package:quria/data/services/bungie_api/account.service.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.enum.dart';
import 'package:quria/data/services/bungie_api/profile.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/data/services/storage/storage.service.dart';
import 'package:quria/presentation/components/loader.dart';
import 'package:quria/presentation/components/stat_progress_bar.dart';
import 'package:quria/presentation/components/header_weapon_details.dart';
import 'package:quria/presentation/components/statisticDisplay.dart';
import 'package:quria/presentation/components/weapon_details_bis.dart';
import 'package:quria/presentation/screens/profile/components/charcter_banner.dart';

int index = 0;

class ProfileWidget extends StatefulWidget {
  ProfileWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  final storage = StorageService();

  final account = AccountService();

  final profile = ProfileService();

  Future<ProfileHelper> getProfileData() async {
    try {
      await ManifestService.getManifest<DestinyInventoryItemDefinition>();
      await ManifestService.getManifest<DestinyDamageTypeDefinition>();
      await ManifestService.getManifest<DestinyStatDefinition>();
      await ManifestService.getManifest<DestinyClassDefinition>();

      final characters = profile.getCharacters();
      ProfileHelper returned = ProfileHelper(
          (await account.getMembership())!,
          characters,
          profile.getCharacterEquipment(characters[index].characterId!));
      return returned;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getProfileData(),
        builder: (BuildContext context, AsyncSnapshot<ProfileHelper> snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: BlocProvider(
                create: (_) => CharacterCubit(),
                child: BlocBuilder<CharacterCubit, CharacterState>(
                  builder: (context, state) {
                    int displayHash = snapshot.data!.characterEquipement[5]
                            .overrideStyleItemHash ??
                        snapshot.data!.characterEquipement[5].itemHash!;
                    return Center(
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage('https://www.bungie.net' +
                                    ManifestService
                                        .manifestParsed
                                        .destinyInventoryItemDefinition![
                                            displayHash]!
                                        .screenshot!),
                                fit: BoxFit.cover)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 150.0, top: 50),
                              child: Column(children: [
                                for (int i = 0;
                                    i < snapshot.data!.characters.length;
                                    i++)
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        index = i;
                                      });
                                    },
                                    child: SizedBox(
                                        width: index == i ? 400 : 561,
                                        child: CharacterBanner(
                                            character:
                                                snapshot.data!.characters[i])),
                                  ),
                              ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 120.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      ProfileNodeWidget(data: snapshot.data),
                                      SizedBox(width: 10),
                                      if (state is ShowDetailsState)
                                        DetailsWeaponWidget(item: state.item)
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          } else {
            return Container(
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 109, 102, 92)),
                child: const Loader());
          }
        });
  }
}

class ProfileNodeWidget extends StatelessWidget {
  final ProfileHelper? data;
  const ProfileNodeWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Align(
        alignment: Alignment.center,
        child: Container(
          margin: const EdgeInsets.only(left: 20),
          child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.start, // change ici pr le mode detail
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WeaponSectionWidget(data: data),
                SizedBox(width: 400),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        CharacterStatsWidget(data: data),
                        ArmorSectionWidget(data: data)
                      ],
                    ),
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}

class ArmorSectionWidget extends StatelessWidget {
  final ProfileHelper? data;
  const ArmorSectionWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Item(item: data!.characterEquipement[3]),
        Item(item: data!.characterEquipement[4]),
        Item(item: data!.characterEquipement[5]),
        Item(item: data!.characterEquipement[6]),
        Item(item: data!.characterEquipement[7]),
      ],
    );
  }
}

class CharacterStatsWidget extends StatelessWidget {
  final ProfileHelper? data;
  const CharacterStatsWidget({
    Key? key,
    required this.data,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const double fontsize = 30;
    const double width = 110;
    const double height = 50;
    return Container(
      margin: const EdgeInsets.only(right: 50),
      child: SizedBox(
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (int i = 0; i < 6; i++)
              StatisticDisplay(
                value:
                    data!.characters[index].stats![DestinyData.armorStats[i]]!,
                icon: DestinyData.statsIcon[i],
                width: width,
                height: height,
                fontsize: fontsize,
                padding: 8.0,
              ),
          ],
        ),
      ),
    );
  }
}

class CharacterWidget extends StatelessWidget {
  const CharacterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            child: InkWell(
              onTap: () => context.read<CharacterCubit>().hideDetails(),
              child: Image(
                image: NetworkImage(
                    'https://ae01.alicdn.com/kf/Hf7c8a7d685e848bd84384b6112618286A/Mcfarlane-figurine-Destiny-LORD-SALADIN-figurine-de-luxe-10-pouces-S-Bungie-le-mod-le-de.jpg_q50.jpg'),
              ),
            ),
            margin: const EdgeInsets.only(left: 25, right: 25),
            width: 300,
            height: 500,
            decoration: BoxDecoration(border: Border.all(color: Colors.red))),
        Container(
            width: 250,
            height: 50,
            decoration: BoxDecoration(color: Colors.blueGrey),
            child: Center(
              child: Text(
                'toto',
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
            ))
      ],
    );
  }
}

class WeaponSectionWidget extends StatelessWidget {
  final ProfileHelper? data;
  const WeaponSectionWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Item(item: data!.characterEquipement[0]),
          Item(item: data!.characterEquipement[1]),
          Item(item: data!.characterEquipement[2]),
        ]);
  }
}

class Item extends StatelessWidget {
  final DestinyItemComponent item;
  const Item({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final displayHash = item.overrideStyleItemHash ?? item.itemHash;
    return Container(
      child: InkWell(
        onTap: () => context.read<CharacterCubit>().showDetails(item),
        child: Container(
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
          child: Image(
            image: NetworkImage('https://www.bungie.net' +
                ManifestService
                    .manifestParsed
                    .destinyInventoryItemDefinition![displayHash]!
                    .displayProperties!
                    .icon!),
            fit: BoxFit.fill,
            width: 150,
            height: 150,
          ),
        ),
      ),
      margin: const EdgeInsets.only(top: 10, bottom: 10),
    );
  }
}

@immutable
class DetailsWeaponWidget extends StatelessWidget {
  final profile = ProfileService();
  final DestinyItemComponent item;
  DetailsWeaponWidget({
    required this.item,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sockets = profile.getItemSockets(item.itemInstanceId!);
    final stats = profile.getPrecalculatedStats(item.itemInstanceId!);
    return Offstage(
      offstage: false,
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
            width: 800,
            height: 800,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(right: 80),
            decoration: BoxDecoration(
              color: Colors.black54,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Container(
              margin: const EdgeInsets.only(left: 14),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 140,
                        width: 140,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade700,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Image(
                            image: NetworkImage('https://www.bungie.net' +
                                ManifestService
                                    .manifestParsed
                                    .destinyInventoryItemDefinition![
                                        item.itemHash]!
                                    .displayProperties!
                                    .icon!),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      // HeaderWeaponDetails(
                      //     name: utf8.decode(ManifestService.manifestParsed
                      //         .destinyInventoryItemDefinition![item.itemHash]!
                      //         .displayProperties!
                      //         .name!
                      //         .runes
                      //         .toList()),
                      //     typeOfAmmo: 'typeOfAmmo',
                      //     typeOfAmmoImg:
                      //         'https://www.bungie.net/common/destiny2_content/screenshots/1715842350.jpg',
                      //     typeOfWeapon: 'typeOfWeapon',
                      //     type: 'type',
                      //     typeImg:
                      //         'https://www.bungie.net/common/destiny2_content/screenshots/1715842350.jpg',
                      //     value: 100),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (int statHash in DestinyData.linearStatBySubType[
                              ManifestService
                                  .manifestParsed
                                  .destinyInventoryItemDefinition![
                                      item.itemHash]!
                                  .itemSubType!]!)
                            StatProgressBar(
                                name: ManifestService
                                        .manifestParsed
                                        .destinyStatDefinition![statHash]!
                                        .displayProperties!
                                        .name ??
                                    'error',
                                value: stats![statHash.toString()]?.value ??
                                    ManifestService
                                        .manifestParsed
                                        .destinyInventoryItemDefinition![
                                            item.itemHash]!
                                        .stats
                                        ?.stats![statHash.toString()]
                                        ?.value ??
                                    0,
                                type: ManifestService
                                    .manifestParsed
                                    .destinyInventoryItemDefinition![
                                        item.itemHash]!
                                    .itemType!),
                        ]),
                  ),
                  SizedBox(height: 30),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        SizedBox(
                            height: 80,
                            width: 80,
                            child: Image(
                              image: NetworkImage('https://www.bungie.net' +
                                  ManifestService
                                      .manifestParsed
                                      .destinyInventoryItemDefinition![
                                          sockets![1].plugHash]!
                                      .displayProperties!
                                      .icon!),
                              fit: BoxFit.fill,
                            )),
                        SizedBox(width: 30),
                        SizedBox(
                            height: 80,
                            width: 80,
                            child: Image(
                              image: NetworkImage('https://www.bungie.net' +
                                  ManifestService
                                      .manifestParsed
                                      .destinyInventoryItemDefinition![
                                          sockets[2].plugHash]!
                                      .displayProperties!
                                      .icon!),
                              fit: BoxFit.fill,
                            )),
                        SizedBox(width: 30),
                        SizedBox(
                            height: 80,
                            width: 80,
                            child: Image(
                              image: NetworkImage('https://www.bungie.net' +
                                  ManifestService
                                      .manifestParsed
                                      .destinyInventoryItemDefinition![
                                          sockets[3].plugHash]!
                                      .displayProperties!
                                      .icon!),
                              fit: BoxFit.fill,
                            )),
                        SizedBox(width: 15),
                        SizedBox(
                            height: 80,
                            width: 80,
                            child: Image(
                              image: NetworkImage('https://www.bungie.net' +
                                  ManifestService
                                      .manifestParsed
                                      .destinyInventoryItemDefinition![
                                          sockets[4].plugHash]!
                                      .displayProperties!
                                      .icon!),
                              fit: BoxFit.fill,
                            )),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        SizedBox(
                            height: 80,
                            width: 80,
                            child: Image(
                              image: NetworkImage('https://www.bungie.net' +
                                  ManifestService
                                      .manifestParsed
                                      .destinyInventoryItemDefinition![
                                          sockets[0].plugHash]!
                                      .displayProperties!
                                      .icon!),
                              fit: BoxFit.fill,
                            )),
                        SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                          width: 600,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                utf8.decode(ManifestService
                                    .manifestParsed
                                    .destinyInventoryItemDefinition![
                                        sockets[0].plugHash]!
                                    .displayProperties!
                                    .name!
                                    .runes
                                    .toList()),
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(height: 6),
                              Text(
                                utf8.decode(ManifestService
                                    .manifestParsed
                                    .destinyInventoryItemDefinition![
                                        sockets[0].plugHash]!
                                    .displayProperties!
                                    .description!
                                    .runes
                                    .toList()),
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  WeaponDetailsBis(
                      charger: stats!['3871231066']?.value,
                      zoom: ManifestService
                          .manifestParsed
                          .destinyInventoryItemDefinition![item.itemHash]!
                          .stats
                          ?.stats!['3555269338']
                          ?.value,
                      strokesMinutes: stats['4284893193']?.value,
                      retreatDirection: ManifestService
                          .manifestParsed
                          .destinyInventoryItemDefinition![item.itemHash]!
                          .stats
                          ?.stats!['2715839340']
                          ?.value)
                ],
              ),
            )),
      ),
    );
  }
}
