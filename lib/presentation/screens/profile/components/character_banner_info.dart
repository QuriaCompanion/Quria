import 'dart:math';

import 'package:bungie_api/models/destiny_character_component.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';

class CharacterBannerInfo extends StatelessWidget {
  final DestinyCharacterComponent character;
  const CharacterBannerInfo({required this.character, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: vw(context) * 0.064,
      width: vw(context) * 0.5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: appBarItem(context),
                height: appBarItem(context),
                child: Image(
                  filterQuality: FilterQuality.high,
                  image: CachedNetworkImageProvider(
                      '${DestinyData.bungieLink}${character.emblemPath!}?t={${Random().nextInt(100)}}123456'),
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                width: vw(context) * 0.016,
              ),
              textH3(
                ManifestService.manifestParsed.destinyClassDefinition[character.classHash]!
                    .genderedClassNamesByGenderHash![character.genderHash.toString()]!,
              ),
            ],
          ),
          SizedBox(
            width: vw(context) * 0.18,
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              SizedBox(
                width: appBarItem(context),
                height: appBarItem(context),
                child: Image(
                  filterQuality: FilterQuality.high,
                  image: CachedNetworkImageProvider(
                      '${DestinyData.bungieLink}${ManifestService.manifestParsed.destinyStatDefinition[StatsHash.power]!.displayProperties!.icon!}?t={${Random().nextInt(100)}}123456'),
                  color: yellow,
                  fit: BoxFit.cover,
                ),
              ),
              textH3(
                character.light.toString(),
                color: yellow,
              )
            ]),
          )
        ],
      ),
    );
  }
}
