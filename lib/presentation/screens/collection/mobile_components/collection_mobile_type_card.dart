import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';

class CollectionMobileTypeCard extends StatelessWidget {
  final String title;
  final String logo;
  final int number;
  final int total;

  const CollectionMobileTypeCard(
      {Key? key, required this.logo, required this.title, required this.number, required this.total})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    double cardMargin = 8;

    return Container(
      decoration: const BoxDecoration(color: blackLight, borderRadius: BorderRadius.all(Radius.circular(8))),
      width: vw(context) * 0.5 - cardMargin * 2,
      height: vh(context) * 0.2,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedBox(height: vh(context) * 0.2 * 0.43, child: const Image(image: modsHeader)),
        SizedBox(
          height: cardMargin,
        ),
        textBodyBold(title),
        SizedBox(
          height: cardMargin * 0.5,
        ),
        textCaption('$number/$total', color: grey)
      ]),
    );
  }
}
