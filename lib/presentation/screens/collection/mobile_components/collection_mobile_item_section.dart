import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:quria/presentation/screens/collection/mobile_components/collection_mobile_item_line.dart';
import 'package:quria/presentation/var/routes.dart';
import 'dart:math';

import 'package:sliver_tools/sliver_tools.dart';

class CollectionMobileItemSection extends StatefulWidget {
  final String sectionName;
  final List<DestinyInventoryItemDefinition> items;

  const CollectionMobileItemSection({Key? key, required this.sectionName, required this.items}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CollectionMobileItemSectionState();
}

class _CollectionMobileItemSectionState extends State<CollectionMobileItemSection> with TickerProviderStateMixin {
  late bool dropDownActivated = true;
  late AnimationController controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 100));
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
    return SliverStack(
      children: [
        SliverPositioned.fill(
          child: Container(
            decoration: const BoxDecoration(color: blackLight, borderRadius: BorderRadius.all(Radius.circular(8))),
          ),
        ),
        MultiSliver(
          pushPinnedChildren: true,
          children: [
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: globalPadding(context)),
              sliver: SliverPinnedHeader(
                child: InkWell(
                  onTap: () => {
                    dropDownActivated ? controller.forward(from: 0) : controller.reverse(from: 1),
                    setRotation(180),
                    setState(() {
                      dropDownActivated = !dropDownActivated;
                    })
                  },
                  child: Container(
                    decoration:
                        const BoxDecoration(color: blackLight, borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: Column(
                      children: [
                        SizedBox(
                          height: vh(context) * 0.073,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  textH3(widget.sectionName),
                                  SizedBox(width: globalPadding(context)),
                                  textCaptionBold("${widget.items.length}", color: greyLight),
                                ],
                              ),
                              AnimatedBuilder(
                                  animation: animation,
                                  builder: (context, child) {
                                    return Transform.rotate(angle: animation.value, child: child);
                                  },
                                  child: const Icon(
                                    Icons.arrow_drop_down_sharp,
                                    color: Colors.white,
                                  ))
                            ],
                          ),
                        ),
                        if (!dropDownActivated)
                          const Divider(
                            height: 1,
                            color: grey,
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            if (!dropDownActivated)
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: globalPadding(context)),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(((context, index) {
                    return InkWell(
                      onTap: () =>
                          Navigator.pushNamed(context, routeCollectionItem, arguments: widget.items[index].hash),
                      child: Padding(
                          padding: EdgeInsets.symmetric(vertical: globalPadding(context) / 2),
                          child: CollectionItemLine(
                            item: widget.items[index],
                            width: vw(context),
                          )),
                    );
                  }), childCount: widget.items.length),
                ),
              )
          ],
        ),
      ],
    );
  }
}
