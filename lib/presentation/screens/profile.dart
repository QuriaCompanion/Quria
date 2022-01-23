// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'dart:convert';
import 'dart:developer';
import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:quria/cubit/character_cubit.dart';
import 'package:quria/data/services/bungie_api/account.service.dart';
import 'package:quria/data/services/bungie_api/profile.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/data/services/storage/storage.service.dart';
import 'package:quria/presentation/components/statisticDisplay.dart';

Map<int, DestinyInventoryItemDefinition> _manifestParsed = {};

class ProfileWidget extends StatefulWidget {
  ProfileWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  final manifest = ManifestService();

  final storage = StorageService();

  final account = AccountService();

  final profile = ProfileService();

  var index = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getProfileData(index: index),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return BlocProvider(
              create: (_) => CharacterCubit(),
              child: BlocBuilder<CharacterCubit, CharacterState>(
                builder: (context, state) {
                  int displayHash = snapshot.data['characterEquipement'][5]
                          .overrideStyleItemHash ??
                      snapshot.data['characterEquipement'][5].itemHash;
                  return Center(
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage('https://www.bungie.net' +
                                  _manifestParsed[displayHash]!.screenshot!),
                              fit: BoxFit.cover)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 150.0, top: 50),
                            child: Column(children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    index = 0;
                                  });
                                },
                                child: SizedBox(
                                    width: 561,
                                    child: ProfileTitleWidget(
                                        data: snapshot.data)),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    index = 1;
                                  });
                                },
                                child: SizedBox(
                                    width: 561,
                                    child: ProfileTitleWidget(
                                        data: snapshot.data)),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    index = 2;
                                  });
                                },
                                child: SizedBox(
                                    width: 561,
                                    child: ProfileTitleWidget(
                                        data: snapshot.data)),
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  getProfileData({index: 0}) async {
    _manifestParsed = await manifest.getManifest();
    final characters = profile.getCharacters();
    final Map<String, dynamic> data = {
      'profile': await account.getMembership(),
      'character': characters[index],
      'characterEquipement':
          profile.getCharacterEquipment(characters[index].characterId!)
    };
    inspect('data');
    inspect(characters);
    inspect('data');
    print('data');
    print(data);
    print('data');
    return data;
  }
}

class ProfileNodeWidget extends StatelessWidget {
  final data;
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
  final data;
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
        Item(item: data['characterEquipement'][3]),
        Item(item: data['characterEquipement'][4]),
        Item(item: data['characterEquipement'][5]),
        Item(item: data['characterEquipement'][6]),
        Item(item: data['characterEquipement'][7]),
      ],
    );
  }
}

class CharacterStatsWidget extends StatelessWidget {
  final data;
  const CharacterStatsWidget({
    Key? key,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double fontsize = 30;
    const double width = 50;
    const double height = 50;
    return Container(
      // TODO : Refactoring SizedBox value
      margin: const EdgeInsets.only(right: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          StatisticDisplay(
            value: data['character'].stats['2996146975'],
            i: 0,
            width: width,
            height: height,
            fontsize: fontsize,
            paddingLeft: 8.0,
          ),
          SizedBox(height: 50),
          StatisticDisplay(
            value: data['character'].stats['392767087'],
            i: 1,
            width: width,
            height: height,
            fontsize: fontsize,
            paddingLeft: 8.0,
          ),
          SizedBox(height: 50),
          StatisticDisplay(
            value: data['character'].stats['1943323491'],
            i: 2,
            width: width,
            height: height,
            fontsize: fontsize,
            paddingLeft: 8.0,
          ),
          SizedBox(height: 50),
          StatisticDisplay(
            value: data['character'].stats['1735777505'],
            i: 3,
            width: width,
            height: height,
            fontsize: fontsize,
            paddingLeft: 8.0,
          ),
          SizedBox(height: 50),
          StatisticDisplay(
            value: data['character'].stats['144602215'],
            i: 4,
            width: width,
            height: height,
            fontsize: fontsize,
            paddingLeft: 8.0,
          ),
          SizedBox(height: 50),
          StatisticDisplay(
            value: data['character'].stats['4244567218'],
            i: 5,
            width: width,
            height: height,
            fontsize: fontsize,
            paddingLeft: 8.0,
          ),
        ],
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
  final data;
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
          Item(item: data['characterEquipement'][0]),
          Item(item: data['characterEquipement'][1]),
          Item(item: data['characterEquipement'][2]),
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
                _manifestParsed[displayHash]!.displayProperties!.icon!),
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

class ProfileTitleWidget extends StatefulWidget {
  final data;

  const ProfileTitleWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  _ProfileTitleState createState() => _ProfileTitleState();
}

class _ProfileTitleState extends State<ProfileTitleWidget> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
          width: 500,
          height: 125,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage('https://www.bungie.net' +
                    widget.data['character'].emblemBackgroundPath),
                fit: BoxFit.fill),
          ),
          alignment: Alignment.topLeft,
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 33, left: 0),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 75.0),
                child: Text('Arcaniste',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 50,
                    )),
              ),
              Spacer(),
              Text('${widget.data['character'].stats['1935470627']}',
                  style: TextStyle(color: Colors.yellow, fontSize: 50))
            ],
          ),
          padding: const EdgeInsets.all(8.0)),
    );
  }
}

class DetailsWeaponWidget extends StatelessWidget {
  final profile = ProfileService();
  DestinyItemComponent item;
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
                                _manifestParsed[item.itemHash]!
                                    .displayProperties!
                                    .icon!),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              utf8.decode(_manifestParsed[item.itemHash]!
                                  .displayProperties!
                                  .name!
                                  .runes
                                  .toList()),
                              style:
                                  TextStyle(fontSize: 40, color: Colors.white),
                            ),
                            if (stats!['3871231066']?.value != null)
                              SizedBox(
                                width: 400,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        'Chargeur : ${stats['3871231066']?.value}',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white)),
                                    Text(
                                      'Zoom : ${_manifestParsed[item.itemHash]!.stats?.stats!['3555269338']?.value}',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            if (stats['3871231066']?.value != null)
                              SizedBox(
                                width: 400,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        'Coup par minute : ${stats['4284893193']?.value}',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white)),
                                    Text(
                                      'Direction du recul : ${_manifestParsed[item.itemHash]!.stats?.stats!['2715839340']?.value}',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                  ],
                                ),
                              )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (stats['2996146975']?.value != null)
                              Text(
                                'Mobilité : ${stats['2996146975']?.value}',
                                style: TextStyle(
                                    fontSize: 28, color: Colors.white),
                              ),
                            if (stats['392767087']?.value != null)
                              Text(
                                'Résistance : ${stats['392767087']?.value}',
                                style: TextStyle(
                                    fontSize: 28, color: Colors.white),
                              ),
                            if (stats['1943323491']?.value != null)
                              Text(
                                'Récupération : ${stats['1943323491']?.value}',
                                style: TextStyle(
                                    fontSize: 28, color: Colors.white),
                              ),
                            if (stats['1735777505']?.value != null)
                              Text(
                                'Discipline : ${stats['1735777505']?.value}',
                                style: TextStyle(
                                    fontSize: 28, color: Colors.white),
                              ),
                            if (stats['144602215']?.value != null)
                              Text(
                                'Intelligence : ${stats['144602215']?.value}',
                                style: TextStyle(
                                    fontSize: 28, color: Colors.white),
                              ),
                            if (stats['4244567218']?.value != null)
                              Text(
                                'Force : ${stats['4244567218']?.value}',
                                style: TextStyle(
                                    fontSize: 28, color: Colors.white),
                              ),
                            if (stats['3614673599']?.value != null)
                              Text(
                                'Rayon de souffle : ${stats['3614673599']?.value}',
                                style: TextStyle(
                                    fontSize: 28, color: Colors.white),
                              ),
                            if (stats['3614673599']?.value != null)
                              SizedBox(height: 9),
                            if (stats['2523465841']?.value != null)
                              Text(
                                'Vélocité : ${stats['2523465841']?.value}',
                                style: TextStyle(
                                    fontSize: 28, color: Colors.white),
                              ),
                            if (stats['2523465841']?.value != null)
                              SizedBox(height: 9),
                            if (stats['4043523819']?.value != null)
                              Text(
                                'Impact: ${stats['4043523819']?.value}',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 28),
                              ),
                            if (stats['4043523819']?.value != null)
                              SizedBox(height: 9),
                            if (stats['1240592695']?.value != null)
                              Text(
                                'Portée: ${stats['1240592695']?.value}',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 28),
                              ),
                            if (stats['1240592695']?.value != null)
                              SizedBox(height: 9),
                            if (stats['155624089']?.value != null)
                              Text('Stabilité: ${stats['155624089']?.value}',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 28)),
                            if (stats['155624089']?.value != null)
                              SizedBox(height: 9),
                            if (stats['943549884']?.value != null)
                              Text('Maniement: ${stats['943549884']?.value}',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 28)),
                            if (stats['943549884']?.value != null)
                              SizedBox(height: 9),
                            if (stats['4188031367']?.value != null)
                              Text(
                                  'Rechargement: ${stats['4188031367']?.value}',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 28)),
                            if (stats['4188031367']?.value != null)
                              SizedBox(height: 9),
                            if (stats['1345609583']?.value != null)
                              Text(
                                  'Aide à la visée: ${stats['1345609583']?.value}',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 28)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Column(
                          children: [
                            // mobility
                            if (stats['2996146975']?.value != null)
                              LinearPercentIndicator(
                                percent: stats['2996146975']!.value! / 42,
                                progressColor: Colors.white,
                                lineHeight: 24,
                                width: 350,
                              ),
                            if (stats['2996146975']?.value != null)
                              SizedBox(height: 16),
                            // resistance
                            if (stats['392767087']?.value != null)
                              LinearPercentIndicator(
                                percent: stats['392767087']!.value! / 42,
                                progressColor: Colors.white,
                                lineHeight: 24,
                                width: 350,
                              ),
                            if (stats['392767087']?.value != null)
                              SizedBox(height: 16),
                            // recovery
                            if (stats['1943323491']?.value != null)
                              LinearPercentIndicator(
                                percent: stats['1943323491']!.value! / 42,
                                progressColor: Colors.white,
                                lineHeight: 24,
                                width: 350,
                              ),
                            if (stats['1943323491']?.value != null)
                              SizedBox(height: 16),
                            // discipline
                            if (stats['1735777505']?.value != null)
                              LinearPercentIndicator(
                                percent: stats['1735777505']!.value! / 42,
                                progressColor: Colors.white,
                                lineHeight: 24,
                                width: 350,
                              ),
                            if (stats['1735777505']?.value != null)
                              SizedBox(height: 16),
                            // intelligence
                            if (stats['144602215']?.value != null)
                              LinearPercentIndicator(
                                percent: stats['144602215']!.value! / 42,
                                progressColor: Colors.white,
                                lineHeight: 24,
                                width: 350,
                              ),
                            if (stats['144602215']?.value != null)
                              SizedBox(height: 16),
                            // force
                            if (stats['4244567218']?.value != null)
                              LinearPercentIndicator(
                                percent: stats['4244567218']!.value! / 42,
                                progressColor: Colors.white,
                                lineHeight: 24,
                                width: 350,
                              ),
                            if (stats['4244567218']?.value != null)
                              SizedBox(height: 16),
                            // stop
                            if (stats['3614673599']?.value != null)
                              LinearPercentIndicator(
                                percent: stats['3614673599']!.value! / 100,
                                progressColor: Colors.white,
                                lineHeight: 24,
                                width: 350,
                              ),
                            if (stats['3614673599']?.value != null)
                              SizedBox(height: 16),
                            if (stats['2523465841']?.value != null)
                              LinearPercentIndicator(
                                percent: stats['2523465841']!.value! / 100,
                                progressColor: Colors.white,
                                lineHeight: 24,
                                width: 350,
                              ),
                            if (stats['2523465841']?.value != null)
                              SizedBox(height: 16),
                            if (stats['4043523819']?.value != null)
                              LinearPercentIndicator(
                                percent: stats['4043523819']!.value! / 100,
                                progressColor: Colors.white,
                                lineHeight: 24,
                                width: 350,
                              ),
                            if (stats['4043523819']?.value != null)
                              SizedBox(height: 16),
                            if (stats['1240592695']?.value != null)
                              LinearPercentIndicator(
                                percent: stats['1240592695']!.value! / 100,
                                progressColor: Colors.white,
                                lineHeight: 24,
                                width: 350,
                              ),
                            if (stats['1240592695']?.value != null)
                              SizedBox(height: 16),
                            if (stats['155624089']?.value != null)
                              LinearPercentIndicator(
                                percent: stats['155624089']!.value! / 100,
                                progressColor: Colors.white,
                                lineHeight: 24,
                                width: 350,
                              ),
                            if (stats['155624089']?.value != null)
                              SizedBox(height: 16),
                            if (stats['943549884']?.value != null)
                              LinearPercentIndicator(
                                percent: stats['943549884']!.value! / 100,
                                progressColor: Colors.white,
                                lineHeight: 24,
                                width: 350,
                              ),
                            if (stats['943549884']?.value != null)
                              SizedBox(height: 16),
                            if (stats['4188031367']?.value != null)
                              LinearPercentIndicator(
                                percent: stats['4188031367']!.value! / 100,
                                progressColor: Colors.white,
                                lineHeight: 24,
                                width: 350,
                              ),
                            if (stats['4188031367']?.value != null)
                              SizedBox(height: 16),
                            if (stats['1345609583']?.value != null)
                              LinearPercentIndicator(
                                percent: stats['1345609583']!.value! / 100,
                                progressColor: Colors.white,
                                lineHeight: 24,
                                width: 350,
                              ),
                          ],
                        ),
                      )
                    ],
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
                                  _manifestParsed[sockets![1].plugHash]!
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
                                  _manifestParsed[sockets[2].plugHash]!
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
                                  _manifestParsed[sockets[3].plugHash]!
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
                                  _manifestParsed[sockets[4].plugHash]!
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
                                  _manifestParsed[sockets[0].plugHash]!
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
                                utf8.decode(
                                    _manifestParsed[sockets[0].plugHash]!
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
                                utf8.decode(
                                    _manifestParsed[sockets[0].plugHash]!
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
                  )
                ],
              ),
            )),
      ),
    );
  }
}
