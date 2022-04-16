import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:bungie_api/models/destiny_item_plug_base.dart';
import 'package:bungie_api/models/destiny_item_socket_state.dart';
import 'package:bungie_api/models/destiny_stat.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:quria/presentation/screens/inspect/mobile_components/inspect_mobile_actions.dart';
import 'package:quria/presentation/screens/inspect/mobile_components/inspect_mobile_cosmetics.dart';
import 'package:quria/presentation/screens/inspect/mobile_components/inspect_mobile_perks.dart';
import 'package:quria/presentation/screens/inspect/mobile_components/inspect_mobile_origin.dart';
import 'package:quria/presentation/screens/inspect/mobile_components/inspect_mobile_intrinsics.dart';
import 'package:quria/presentation/screens/inspect/mobile_components/inspect_mobile_stats.dart';

class InspectMobileWeaponInfo extends StatefulWidget {
  final DestinyInventoryItemDefinition item;
  final String instanceId;
  final String characterId;
  final Map<String, DestinyStat>? stats;
  final List<DestinyItemSocketState>? sockets;
  final Map<String, List<DestinyItemPlugBase>>? plugs;

  const InspectMobileWeaponInfo(
      {required this.item,
      required this.instanceId,
      required this.stats,
      required this.characterId,
      required this.sockets,
      required this.plugs,
      Key? key})
      : super(key: key);

  @override
  State<InspectMobileWeaponInfo> createState() =>
      _InspectMobileWeaponInfoState();
}

class _InspectMobileWeaponInfoState extends State<InspectMobileWeaponInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      mobileSection(context,
          title: "Actions rapides", child: const InspectMobileActions()),
      mobileSection(context,
          title: "Statistiques",
          child: InspectMobileStats(item: widget.item, stats: widget.stats)),
      mobileSection(context,
          title: "Attributs de l'arme",
          child: InspectMobilePerks(
              instanceId: widget.instanceId,
              sockets: widget.sockets,
              plugs: widget.plugs,
              characterId: widget.characterId)),
      mobileSection(context,
          title: "Mods et attributs intrinsÃ¨ques",
          child: InspectMobileIntrinsics(sockets: widget.sockets)),
      mobileSection(context,
          title: "CosmÃ©tiques",
          child: MobileInspectCosmetics(sockets: widget.sockets!)),
      if (widget.item.collectibleHash != null)
        mobileSection(context,
            title: "Obtention",
            child: InspectMobileOrigin(
                collectionHash: widget.item.collectibleHash)),
    ]);
  }
}
