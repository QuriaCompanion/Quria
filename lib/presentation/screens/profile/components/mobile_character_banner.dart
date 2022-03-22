import 'package:auto_size_text/auto_size_text.dart';
import 'package:bungie_api/models/destiny_character_component.dart';
import 'package:flutter/material.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';

class MobileCharacterBanner extends StatelessWidget {
  final DestinyCharacterComponent character;
  final double width;
  final double fontSize;
  MobileCharacterBanner(
      {Key? key, required this.character, this.width = 500, this.fontSize = 50})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
///////////////////////////////////////////////////////////////////////////////////////////////////
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
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
              SizedBox(width: MediaQuery.of(context).size.width * 0.01),
              AutoSizeText(
                  ManifestService
                          .manifestParsed
                          .destinyClassDefinition![character.classHash]!
                          .genderedClassNamesByGenderHash![
                      character.genderHash.toString()]!,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: fontSize,
                    fontWeight: FontWeight.w700,
                  )),
              SizedBox(width: MediaQuery.of(context).size.width * 0.01),
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
              AutoSizeText(character.light.toString(),
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.yellow,
                    fontSize: fontSize,
                  )),
            ],
          ),
          value: "USA"),
//////////////////////////////////////////////////////////////////////////////////////////////////
      const DropdownMenuItem(child: Text("Canada"), value: "Canada"),
      const DropdownMenuItem(child: Text("Brazil"), value: "Brazil"),
      const DropdownMenuItem(child: Text("England"), value: "England"),
    ];
    String selectedValue = "USA";
    return Container(
        child: DropdownButton(
      dropdownColor: Colors.transparent,
      value: selectedValue,
      items: menuItems,
      iconEnabledColor: Colors.white,
      iconSize: MediaQuery.of(context).size.width * 0.064,
      onChanged: (String? newValue) {
        selectedValue = newValue!;
      },
    ));
  }
}
