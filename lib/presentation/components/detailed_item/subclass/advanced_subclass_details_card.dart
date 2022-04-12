import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:bungie_api/models/destiny_item_socket_state.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/bungie_api/profile.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';

@immutable
class AdvancedSubclassDetailsCard extends StatefulWidget {
  const AdvancedSubclassDetailsCard({
    required this.characterId,
    required this.subclass,
    this.attributeSocketId = 0,
    this.width = 800,
    this.fontSize = 20,
    this.titleFontSize = 30,
    this.sidePadding = 25,
    this.imageSize = 150,
    this.childPadding = 20,
    this.iconSize = 100,
    Key? key,
  }) : super(key: key);
  final int attributeSocketId;
  final double fontSize;
  final DestinyItemComponent subclass;
  final double width;
  final double sidePadding;
  final double imageSize;
  final String characterId;
  final double childPadding;
  final double iconSize;
  final double titleFontSize;
  @override
  _AdvancedSubclassDetailsCardState createState() =>
      _AdvancedSubclassDetailsCardState();
}

class _AdvancedSubclassDetailsCardState
    extends State<AdvancedSubclassDetailsCard> {
  late List currentSockets;
  late List<DestinyItemSocketState> abilities;
  late List<DestinyItemSocketState> aspects;
  late List<DestinyItemSocketState> fragments;
  late DestinyItemSocketState superSocket;
  late String isSelected;
  @override
  void initState() {
    super.initState();
    final profile = ProfileService();
    final sockets = profile.getItemSockets(widget.subclass.itemInstanceId!)!;
    abilities = [sockets[0], sockets[1], sockets[3], sockets[4]];
    aspects = [sockets[5], sockets[6]];
    fragments = [
      sockets[7],
      sockets[8],
      sockets[9],
      sockets[10],
      sockets[11],
      sockets[12]
    ];
    superSocket = sockets[2];
    currentSockets = abilities;
    isSelected = "Capacités";
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      height: 700,
      width: widget.width,
      decoration: blackTransparentBackground,
      child: RawScrollbar(
        radius: const Radius.circular(10),
        thumbColor: Colors.white30,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(widget.sidePadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: widget.imageSize,
                  child: Image(
                      image: NetworkImage(DestinyData.bungieLink +
                          ManifestService
                              .manifestParsed
                              .destinyInventoryItemDefinition![
                                  superSocket.plugHash]!
                              .displayProperties!
                              .icon!)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          currentSockets = abilities;
                          isSelected = "Capacités";
                        });
                      },
                      child: SocketSelectionButton(
                        isSelected: isSelected,
                        width: (widget.width - (2 * widget.sidePadding)) / 3,
                        fontSize: widget.titleFontSize,
                        childPadding: widget.childPadding,
                        text: "Capacités",
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          currentSockets = aspects;
                          isSelected = "Aspects";
                        });
                      },
                      child: SocketSelectionButton(
                        isSelected: isSelected,
                        width: (widget.width - (2 * widget.sidePadding)) / 3,
                        fontSize: widget.titleFontSize,
                        childPadding: widget.childPadding,
                        text: "Aspects",
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          currentSockets = fragments;
                          isSelected = "Fragments";
                        });
                      },
                      child: SocketSelectionButton(
                        isSelected: isSelected,
                        width: (widget.width - (2 * widget.sidePadding)) / 3,
                        fontSize: widget.titleFontSize,
                        childPadding: widget.childPadding,
                        text: "Fragments",
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: widget.childPadding,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: widget.childPadding,
                    ),
                    RawScrollbar(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (final socket in currentSockets)
                            SubclassSubItemDisplay(
                              childPadding: widget.childPadding,
                              sidePadding: widget.sidePadding,
                              width: widget.width,
                              attribute: socket,
                              fontSize: widget.fontSize,
                              iconSize: widget.iconSize,
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SocketSelectionButton extends StatelessWidget {
  const SocketSelectionButton({
    Key? key,
    required this.isSelected,
    required this.width,
    required this.fontSize,
    required this.childPadding,
    required this.text,
  }) : super(key: key);

  final String isSelected;
  final String text;
  final double width;
  final double fontSize;
  final double childPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: isSelected == text ? Colors.white : Colors.transparent,
            width: isSelected == text ? 2 : 0,
          ),
        ),
      ),
      width: width,
      child: Column(
        children: [
          Center(
            child: Text(text,
                style: TextStyle(
                  fontSize: fontSize,
                  color: Colors.white,
                )),
          ),
          SizedBox(
            height: childPadding,
          ),
        ],
      ),
    );
  }
}

class SubclassSubItemDisplay extends StatelessWidget {
  const SubclassSubItemDisplay({
    Key? key,
    required this.width,
    required this.iconSize,
    required this.attribute,
    required this.fontSize,
    required this.sidePadding,
    required this.childPadding,
  }) : super(key: key);
  final double iconSize;
  final double childPadding;
  final DestinyItemSocketState attribute;
  final double fontSize;
  final double width;
  final double sidePadding;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            width: iconSize,
            child: Image(
              image: NetworkImage(DestinyData.bungieLink +
                  ManifestService
                      .manifestParsed
                      .destinyInventoryItemDefinition![attribute.plugHash]!
                      .displayProperties!
                      .icon!),
            ),
          ),
          SizedBox(width: childPadding),
          SizedBox(
            width: width - (2 * sidePadding) - iconSize - childPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  utf8.decode(ManifestService
                      .manifestParsed
                      .destinyInventoryItemDefinition![attribute.plugHash]!
                      .displayProperties!
                      .name!
                      .runes
                      .toList()),
                  style: TextStyle(fontSize: fontSize + 5, color: Colors.white),
                ),
                SizedBox(height: childPadding),
                if (ManifestService
                        .manifestParsed
                        .destinyInventoryItemDefinition![attribute.plugHash]!
                        .perks!
                        .isNotEmpty &&
                    ManifestService
                            .manifestParsed
                            .destinySandboxPerkDefinition?[ManifestService
                                .manifestParsed
                                .destinyInventoryItemDefinition?[
                                    attribute.plugHash]
                                ?.perks?[0]
                                .perkHash]
                            ?.displayProperties
                            ?.description !=
                        null)
                  AutoSizeText(
                    utf8.decode(ManifestService
                        .manifestParsed
                        .destinySandboxPerkDefinition![ManifestService
                            .manifestParsed
                            .destinyInventoryItemDefinition![
                                attribute.plugHash]!
                            .perks![0]
                            .perkHash]!
                        .displayProperties!
                        .description!
                        .runes
                        .toList()),
                    style: TextStyle(fontSize: fontSize, color: Colors.white),
                  )
                else
                  AutoSizeText(
                    utf8.decode(ManifestService
                        .manifestParsed
                        .destinyInventoryItemDefinition![attribute.plugHash]!
                        .displayProperties!
                        .description!
                        .runes
                        .toList()),
                    style: TextStyle(fontSize: fontSize, color: Colors.white),
                  ),
              ],
            ),
          ),
        ]),
        SizedBox(height: childPadding),
      ],
    );
  }
}
