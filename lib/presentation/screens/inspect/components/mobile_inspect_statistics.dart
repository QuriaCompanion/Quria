import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:bungie_api/models/destiny_item_plug_base.dart';
import 'package:bungie_api/models/destiny_item_socket_state.dart';
import 'package:bungie_api/models/destiny_stat.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/services/bungie_api/profile.service.dart';
import 'package:quria/presentation/screens/inspect/components/mobile_item_attribute.dart';
import 'package:quria/presentation/screens/inspect/components/mobile_item_other_attributes.dart';
import 'package:quria/presentation/screens/inspect/components/mobile_stats.dart';

class MobileInspectStatistics extends StatefulWidget {
  final DestinyInventoryItemDefinition item;
  final String instanceId;

  final Map<String, DestinyStat>? stats;

  const MobileInspectStatistics(
      {required this.item,
      required this.instanceId,
      required this.stats,
      Key? key})
      : super(key: key);

  @override
  State<MobileInspectStatistics> createState() =>
      _MobileInspectStatisticsState();
}

class _MobileInspectStatisticsState extends State<MobileInspectStatistics> {
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
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * globalPadding),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(height: 22),
        MobileItemStats(item: widget.item, stats: widget.stats),
        const SizedBox(height: 22),
        MobileItemAttributes(sockets: sockets, plugs: plugs),
        const SizedBox(height: 22),
        MobileItemOtherAttributes(sockets: sockets, plugs: plugs),
      ]),
    );
  }
}
