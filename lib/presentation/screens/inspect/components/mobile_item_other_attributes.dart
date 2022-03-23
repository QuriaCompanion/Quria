import 'package:bungie_api/models/destiny_item_plug_base.dart';
import 'package:bungie_api/models/destiny_item_socket_state.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';

class MobileItemOtherAttributes extends StatefulWidget {
  final Map<String, List<DestinyItemPlugBase>>? plugs;
  final List<DestinyItemSocketState>? sockets;
  const MobileItemOtherAttributes(
      {required this.plugs, required this.sockets, Key? key})
      : super(key: key);

  @override
  State<MobileItemOtherAttributes> createState() =>
      _MobileItemOtherAttributesState();
}

class _MobileItemOtherAttributesState extends State<MobileItemOtherAttributes> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textH2("Mods et attributs intrinsÃ©ques"),
        const Divider(
          color: blackLight,
          height: 15,
          thickness: 1,
        ),
      ],
    );
  }
}
