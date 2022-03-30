import 'package:bungie_api/enums/tier_type.dart';
import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:bungie_api/models/destiny_item_plug_base.dart';
import 'package:bungie_api/models/destiny_item_socket_state.dart';
import 'package:bungie_api/models/destiny_stat.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:quria/data/services/bungie_api/profile.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/detailed_item/item/armor_mods.dart';
import 'package:quria/presentation/screens/inspect/mobile_components/inspect_mobile_actions.dart';
import 'package:quria/presentation/screens/inspect/mobile_components/inspect_mobile_cosmetics.dart';
import 'package:quria/presentation/screens/inspect/mobile_components/inspect_mobile_exotic_armor.dart';
import 'package:quria/presentation/screens/inspect/mobile_components/inspect_mobile_origin.dart';
import 'package:quria/presentation/screens/inspect/mobile_components/inspect_mobile_stats.dart';

class InspectMobileArmorInfo extends StatefulWidget {
  final DestinyInventoryItemDefinition item;
  final String instanceId;
  final Map<String, DestinyStat>? stats;

  const InspectMobileArmorInfo(
      {required this.item,
      required this.instanceId,
      required this.stats,
      Key? key})
      : super(key: key);

  @override
  State<InspectMobileArmorInfo> createState() => _InspectMobileArmorInfoState();
}

class _InspectMobileArmorInfoState extends State<InspectMobileArmorInfo> {
  late Map<String, List<DestinyItemPlugBase>>? plugs;
  late List<DestinyItemSocketState>? sockets;
  late String afinityIcon;

  @override
  void initState() {
    super.initState();
    plugs = ProfileService().getItemReusablePlugs(widget.instanceId);
    sockets = ProfileService().getItemSockets(widget.instanceId);
    final instance = ProfileService().getInstanceInfo(widget.instanceId);
    afinityIcon = ManifestService
        .manifestParsed
        .destinyEnergyTypeDefinition![instance.energy!.energyTypeHash]!
        .displayProperties!
        .icon!;
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      mobileSection(context,
          title: "Actions rapide", child: const InspectMobileActions()),
      mobileSection(context,
          title: "Statistiques",
          child: InspectMobileStats(item: widget.item, stats: widget.stats)),
      if (widget.item.inventory?.tierType == TierType.Exotic)
        mobileSection(context,
            title: "Attribut exotique",
            child: InspectMobileExoticArmor(sockets: sockets)),
      mobileSection(context,
          title: "Mods d'armure",
          child: ArmorMods(
              instanceId: widget.instanceId,
              afinityIcon: afinityIcon,
              sockets: sockets!,
              item: widget.item)),
      mobileSection(context,
          title: "CosmÃ©tiques",
          child: MobileInspectCosmetics(sockets: sockets!)),
      mobileSection(context,
          title: "Obtention",
          child:
              InspectMobileOrigin(collectionHash: widget.item.collectibleHash!))
    ]);
  }
}
