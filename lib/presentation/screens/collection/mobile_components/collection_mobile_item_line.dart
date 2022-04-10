import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';

class CollectionMobileItemLine extends StatefulWidget {
  final logo;
  final String name;
  final bool isFirst;
  const CollectionMobileItemLine(
      {Key? key, required this.logo, required this.name, required this.isFirst})
      : super(key: key);
  @override
  State<StatefulWidget> createState() => _CollectionMobileItemLineState();
}

class _CollectionMobileItemLineState extends State<CollectionMobileItemLine> {
  double cardMargin = 8;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: cardMargin),
          padding: EdgeInsets.only(top: cardMargin),
          decoration: BoxDecoration(
              border: widget.isFirst
                  ? const Border(top: BorderSide(color: grey, width: 2))
                  : null),
          child: Row(children: [
            Container(
                height: vw(context) * 0.15,
                padding: EdgeInsets.all(cardMargin),
                child: const Image(image: modsHeader)),
            textH3(widget.name)
          ]),
        )
      ],
    );
  }
}
