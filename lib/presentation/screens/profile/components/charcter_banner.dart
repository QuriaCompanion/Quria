import 'package:bungie_api/models/destiny_character_component.dart';
import 'package:flutter/material.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';

class CharacterBanner extends StatelessWidget {
  final DestinyCharacterComponent character;
  const CharacterBanner({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
          width: 500,
          height: 125,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://www.bungie.net' + character.emblemBackgroundPath!),
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
                child: Text(
                    ManifestService
                            .manifestParsed
                            .destinyClassDefinition![character.classHash]!
                            .genderedClassNamesByGenderHash![
                        character.genderHash.toString()]!,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 50,
                    )),
              ),
              Text(character.stats!['1935470627'].toString(),
                  style: const TextStyle(color: Colors.yellow, fontSize: 50))
            ],
          ),
          padding: const EdgeInsets.all(8.0)),
    );
  }
}
