import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/presentation/screens/collection/mobile_components/collection_mobile_item_line.dart';
import 'dart:math';

class CollectionMobileItemSection extends StatefulWidget {
  final sectionName;
  final number;
  final total;
  final items;

  const CollectionMobileItemSection(
      {Key? key,
      required this.sectionName,
      required this.number,
      required this.total,
      required this.items})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _CollectionMobileItemSectionState();
}

class _CollectionMobileItemSectionState
    extends State<CollectionMobileItemSection> with TickerProviderStateMixin {
  late bool dropDownActivated = true;
  late AnimationController controller = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 100));
  late Animation<double> animation;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  setRotation(int degres) {
    final angle = degres * pi / 180;
    animation = Tween<double>(begin: 0, end: angle).animate(controller);
  }

  @override
  void initState() {
    super.initState();
    setRotation(90);
  }

  @override
  Widget build(BuildContext context) {
    double cardMargin = 8;

    return InkWell(
      onTap: () => {
        dropDownActivated
            ? controller.forward(from: 0)
            : controller.reverse(from: 1),
        setRotation(180),
        setState(() {
          dropDownActivated = !dropDownActivated;
        })
      },
      child: Container(
        padding: EdgeInsets.all(cardMargin),
        margin: EdgeInsets.only(bottom: cardMargin),
        decoration: const BoxDecoration(
            color: blackLight,
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Column(
          children: [
            Container(
              height: vh(context) * 0.073,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      textH3(widget.sectionName),
                      SizedBox(width: cardMargin),
                      textCaptionBold(
                          widget.number.toString() +
                              "/" +
                              widget.total.toString(),
                          color: greyLight),
                    ],
                  ),
                  AnimatedBuilder(
                      animation: animation,
                      builder: (context, child) {
                        return Transform.rotate(
                            angle: animation.value, child: child);
                      },
                      child: const Icon(
                        Icons.arrow_drop_down_sharp,
                        color: Colors.white,
                      ))
                ],
              ),
            ),
            if (!dropDownActivated)
              Column(
                children: [
                  const CollectionMobileItemLine(
                    logo: 'test',
                    name: 'test',
                    isFirst: true,
                  ),
                  const CollectionMobileItemLine(
                    logo: 'test',
                    name: 'test',
                    isFirst: false,
                  )
                ],
              )
          ],
        ),
      ),
    );
  }
}
