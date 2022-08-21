import 'package:bungie_api/models/destiny_character_component.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/services/bungie_api/bungie_api.service.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';

class CharacterDesktopBannerInfo extends StatelessWidget {
  final DestinyCharacterComponent character;
  const CharacterDesktopBannerInfo({
    required this.character,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
              filterQuality: FilterQuality.high,
              width: 32,
              height: 32,
              image: CachedNetworkImageProvider(
                  '${DestinyData.bungieLink}${character.emblemPath!}?t={${BungieApiService.randomUserInt}}123456')),
          textBodyBold(ManifestService.manifestParsed.destinyClassDefinition[character.classHash]!
              .genderedClassNamesByGenderHash![character.genderHash.toString()]!),
          Row(
            children: [
              Image(
                filterQuality: FilterQuality.high,
                width: 20,
                height: 20,
                image: CachedNetworkImageProvider(
                    '${DestinyData.bungieLink}${ManifestService.manifestParsed.destinyStatDefinition[StatsHash.power]!.displayProperties!.icon!}?t={${BungieApiService.randomUserInt}}123456'),
                color: yellow,
                fit: BoxFit.cover,
              ),
              textBodyBold(character.light.toString(), color: yellow),
              const Icon(
                Icons.arrow_drop_down,
                color: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
