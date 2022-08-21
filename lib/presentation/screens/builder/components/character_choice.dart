import 'package:bungie_api/enums/destiny_class.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';

class CharacterChoice extends StatefulWidget {
  final double width;
  final Function(DestinyClass) callback;
  const CharacterChoice({required this.callback, required this.width, Key? key}) : super(key: key);

  @override
  CharacterChoiceState createState() => CharacterChoiceState();
}

class CharacterChoiceState extends State<CharacterChoice> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
            onTap: () {
              widget.callback(DestinyClass.Warlock);
            },
            child: Image(image: CachedNetworkImageProvider(ClassLogo.warlock.link))),
        InkWell(
            onTap: () {
              widget.callback(DestinyClass.Hunter);
            },
            child: Image(image: CachedNetworkImageProvider(ClassLogo.hunter.link))),
        InkWell(
            onTap: () {
              widget.callback(DestinyClass.Titan);
            },
            child: Image(image: CachedNetworkImageProvider(ClassLogo.titan.link))),
      ],
    );
  }
}
