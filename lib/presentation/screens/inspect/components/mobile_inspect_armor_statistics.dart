import 'package:bungie_api/enums/tier_type.dart';
import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:bungie_api/models/destiny_item_plug_base.dart';
import 'package:bungie_api/models/destiny_item_socket_state.dart';
import 'package:bungie_api/models/destiny_stat.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/services/bungie_api/profile.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/detailed_item/item/armor_mods.dart';
import 'package:quria/presentation/screens/inspect/components/mobile_inspect_cosmetics.dart';
import 'package:quria/presentation/screens/inspect/components/mobile_inspect_exotic_armor.dart';
import 'package:quria/presentation/screens/inspect/components/mobile_item_origin.dart';
import 'package:quria/presentation/screens/inspect/components/mobile_stats.dart';

class MobileInspectArmorStatistics extends StatefulWidget {
  final DestinyInventoryItemDefinition item;
  final String instanceId;
  final Map<String, DestinyStat>? stats;

  const MobileInspectArmorStatistics(
      {required this.item,
      required this.instanceId,
      required this.stats,
      Key? key})
      : super(key: key);

  @override
  State<MobileInspectArmorStatistics> createState() =>
      _MobileInspectArmorStatisticsState();
}

class _MobileInspectArmorStatisticsState
    extends State<MobileInspectArmorStatistics> {
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
    double pagePadding = globalPadding(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: pagePadding),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(height: pagePadding),
        MobileItemStats(item: widget.item, stats: widget.stats),
        Builder(builder: (context) {
          if (widget.item.inventory?.tierType == TierType.Exotic) {
            DestinyInventoryItemDefinition? exoticPerk =
                ManifestService.manifestParsed.destinyInventoryItemDefinition![
                    sockets
                        ?.firstWhere((element) =>
                            ManifestService
                                    .manifestParsed
                                    .destinyInventoryItemDefinition?[
                                        element.plugHash]
                                    ?.plug
                                    ?.plugCategoryHash ==
                                1744546145 &&
                            ManifestService
                                    .manifestParsed
                                    .destinyInventoryItemDefinition?[
                                        element.plugHash]
                                    ?.inventory
                                    ?.tierType ==
                                TierType.Exotic)
                        .plugHash];
            return Column(
              children: [
                SizedBox(height: pagePadding),
                MobileInspectExoticArmor(
                    iconSize: mobileItemSize(context), item: exoticPerk!),
              ],
            );
          }
          return Container();
        }),
        SizedBox(height: pagePadding),
        ArmorMods(
            instanceId: widget.instanceId,
            afinityIcon: afinityIcon,
            sockets: sockets!,
            item: widget.item),
        SizedBox(height: pagePadding),
        MobileInspectCosmetics(sockets: sockets!),
        Builder(builder: (context) {
          if (widget.item.collectibleHash != null) {
            return Column(
              children: [
                SizedBox(height: pagePadding),
                MobileItemOrigin(collectionHash: widget.item.collectibleHash!),
              ],
            );
          }
          return Container();
        }),
      ]),
    );
  }
}
