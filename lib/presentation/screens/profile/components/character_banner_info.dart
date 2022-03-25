import 'package:bungie_api/models/destiny_character_component.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';

class CharacterBannerInfo extends StatelessWidget {
  final DestinyCharacterComponent character;
  const CharacterBannerInfo({required this.character, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.064,
                height: MediaQuery.of(context).size.width * 0.064,
                child: Image(
                  image: NetworkImage(
                      DestinyData.bungieLink + character.emblemPath!),
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.016,
              ),
              textH3(ManifestService
                      .manifestParsed
                      .destinyClassDefinition![character.classHash]!
                      .genderedClassNamesByGenderHash![
                  character.genderHash.toString()]!),
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.17,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.064,
                    height: MediaQuery.of(context).size.width * 0.064,
                    child: Image(
                      image: NetworkImage(DestinyData.bungieLink +
                          ManifestService
                              .manifestParsed
                              .destinyStatDefinition![StatsHash.power]!
                              .displayProperties!
                              .icon!),
                      color: yellow,
                      fit: BoxFit.cover,
                    ),
                  ),
                  textH3(character.light.toString(), color: yellow)
                ]),
          )
        ],
      ),
    );
  }
}