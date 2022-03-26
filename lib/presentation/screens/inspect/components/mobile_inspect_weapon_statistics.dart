import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:bungie_api/models/destiny_item_plug_base.dart';
import 'package:bungie_api/models/destiny_item_socket_state.dart';
import 'package:bungie_api/models/destiny_stat.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/services/bungie_api/profile.service.dart';
import 'package:quria/presentation/screens/inspect/components/mobile_item_attribute.dart';
import 'package:quria/presentation/screens/inspect/components/mobile_item_origin.dart';
import 'package:quria/presentation/screens/inspect/components/mobile_item_other_attributes.dart';
import 'package:quria/presentation/screens/inspect/components/mobile_stats.dart';

class MobileInspectWeaponStatistics extends StatefulWidget {
  final DestinyInventoryItemDefinition item;
  final String instanceId;
  final Map<String, DestinyStat>? stats;

  const MobileInspectWeaponStatistics(
      {required this.item,
      required this.instanceId,
      required this.stats,
      Key? key})
      : super(key: key);

  @override
  State<MobileInspectWeaponStatistics> createState() =>
      _MobileInspectWeaponStatisticsState();
}

class _MobileInspectWeaponStatisticsState
    extends State<MobileInspectWeaponStatistics> {
  late Map<String, List<DestinyItemPlugBase>>? plugs;
  late List<DestinyItemSocketState>? sockets;
  @override
  void initState() {
    super.initState();
    plugs = ProfileService().getItemReusablePlugs(widget.instanceId);
    sockets = ProfileService().getItemSockets(widget.instanceId);
  }

  @override
  Widget build(BuildContext context) {
    double pagePadding = globalPadding(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: pagePadding),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(height: pagePadding),
        MobileItemStats(item: widget.item, stats: widget.stats),
        SizedBox(height: pagePadding),
        MobileItemAttributes(
            instanceId: widget.instanceId, sockets: sockets, plugs: plugs),
        SizedBox(height: pagePadding),
        MobileItemOtherAttributes(sockets: sockets),
        Builder(builder: (context) {
          if (widget.item.collectibleHash != null) {
            return Column(
              children: [
                MobileItemOrigin(collectionHash: widget.item.collectibleHash!),
                SizedBox(height: pagePadding),
              ],
            );
          }
          return Container();
        }),
      ]),
    );
  }
}
