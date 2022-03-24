import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:bungie_api/models/destiny_character_component.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';

import '../../../../constants/styles.dart';

class MobileCharacterBanner extends StatefulWidget {
  final List<DestinyCharacterComponent> characters;
  final double width;
  final double fontSize;
  final int characterIndex;
  final Function(int) chooseCharacter;
  const MobileCharacterBanner(
      {Key? key,
      required this.characters,
      required this.characterIndex,
      required this.chooseCharacter,
      this.width = 500,
      this.fontSize = 50})
      : super(key: key);

  @override
  State<MobileCharacterBanner> createState() => _MobileCharacterBannerState();
}

class _MobileCharacterBannerState extends State<MobileCharacterBanner> {
  late List<int> order;
  bool chooseCharacter = false;
  @override
  void initState() {
    super.initState();
    order = [0, 1, 2];
  }

  @override
  Widget build(BuildContext context) {
    inspect(widget.characters);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CharacterBannerInfo(
              character: widget.characters[order[0]],
            ),
            IconButton(
              icon: Icon(Icons.arrow_drop_down),
              iconSize: MediaQuery.of(context).size.width * 0.064,
              color: greyLight,
              onPressed: () {
                setState(() {
                  chooseCharacter = !chooseCharacter;
                });
              },
            ),
          ],
        ),
        if (chooseCharacter)
          InkWell(
            onTap: () {
              widget.chooseCharacter(order[1]);
              setState(() {
                order = [1, 0, 2];
                chooseCharacter = false;
              });
            },
            child: CharacterBannerInfo(
              character: widget.characters[order[1]],
            ),
          ),
        if (chooseCharacter)
          InkWell(
            onTap: () {
              widget.chooseCharacter(order[2]);
              setState(() {
                order = [2, 0, 1];

                chooseCharacter = false;
              });
            },
            child: CharacterBannerInfo(
              character: widget.characters[order[2]],
            ),
          ),
      ],
    );
  }
}

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
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.064,
            height: MediaQuery.of(context).size.width * 0.064,
            child: Image(
              image:
                  NetworkImage(DestinyData.bungieLink + character.emblemPath!),
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.01),
          textH3(ManifestService
                  .manifestParsed
                  .destinyClassDefinition![character.classHash]!
                  .genderedClassNamesByGenderHash![
              character.genderHash.toString()]!),
          SizedBox(width: MediaQuery.of(context).size.width * 0.01),
          Row(children: [
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
                color: Colors.yellow,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.01),
            textH3(character.light.toString(), color: Colors.yellow)
          ])
        ],
      ),
    );
  }
}
