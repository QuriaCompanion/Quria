import 'package:auto_size_text/auto_size_text.dart';
import 'package:bungie_api/models/destiny_character_component.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:quria/data/services/bungie_api/bungie_api.service.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';

class CharacterBanner extends StatelessWidget {
  final DestinyCharacterComponent character;
  final double width;
  final double fontSize;
  const CharacterBanner({Key? key, required this.character, this.width = 500, this.fontSize = 50}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: width / 4.9375,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: CachedNetworkImageProvider(
                '${DestinyData.bungieLink}${character.emblemBackgroundPath!}?t={${BungieApiService.randomUserInt}}123456'),
            fit: BoxFit.cover),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: (width / 100) * 20,
          right: (width / 100) * 1,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AutoSizeText(
                ManifestService.manifestParsed.destinyClassDefinition[character.classHash]!
                    .genderedClassNamesByGenderHash![character.genderHash.toString()]!,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: fontSize,
                )),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AutoSizeText(character.light.toString(), style: TextStyle(color: Colors.yellow, fontSize: fontSize)),
                Image(
                  filterQuality: FilterQuality.high,
                  image: CachedNetworkImageProvider(
                      '${DestinyData.bungieLink}${ManifestService.manifestParsed.destinyStatDefinition[StatsHash.power]!.displayProperties!.icon!}?t={${BungieApiService.randomUserInt}}123456'),
                  color: Colors.yellow,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
