import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';

class CharacterTransferItem extends StatelessWidget {
  final String imageLink;
  final String name;
  final String icon;
  final int? powerLevel;
  const CharacterTransferItem(
      {required this.imageLink, required this.icon, required this.name, this.powerLevel, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: blackLight,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(globalPadding(context) / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 44,
                child: Image(
                  image: NetworkImage(imageLink),
                ),
              ),
              SizedBox(
                width: globalPadding(context) / 2,
              ),
              textBodyBold(name),
              SizedBox(
                width: globalPadding(context) / 2,
              ),
              if (powerLevel != null) textBodyBold("$powerLevel", color: yellow),
            ],
          ),
          SvgPicture.asset(
            icon,
            height: vw(context) * 0.06,
            width: vw(context) * 0.06,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
