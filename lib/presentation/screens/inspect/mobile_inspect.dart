import 'package:bungie_api/models/destiny_damage_type_definition.dart';
import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:bungie_api/models/destiny_stat.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:quria/data/models/helpers/inspectData.model.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/bungie_api/profile.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/screens/inspect/components/mobile_inspect_statistics.dart';
import 'package:quria/presentation/screens/inspect/components/mobile_item_header.dart';

class MobileInspect extends StatefulWidget {
  final InspectData data;
  const MobileInspect({Key? key, required this.data}) : super(key: key);
  @override
  State<MobileInspect> createState() => _MobileInspectState();
}

@override
class _MobileInspectState extends State<MobileInspect> {
  late final DestinyInventoryItemDefinition item;
  late final Map<String, DestinyStat>? stats;
  late final DestinyDamageTypeDefinition damageType;
  late final String imageLink;
  late final int powerLevel;
  late Widget content;
  late String selected;
  @override
  void initState() {
    super.initState();
    ProfileService profile = ProfileService();
    item = ManifestService
        .manifestParsed.destinyInventoryItemDefinition![widget.data.hash]!;
    stats = profile.getPrecalculatedStats(widget.data.instanceId);

    powerLevel =
        profile.getInstanceInfo(widget.data.instanceId).primaryStat!.value!;
    imageLink = DestinyData.bungieLink + item.screenshot!;
    damageType = ManifestService.manifestParsed
        .destinyDamageTypeDefinition![item.defaultDamageTypeHash!]!;
    content = MobileInspectStatistics(
      item: item,
      stats: stats,
      instanceId: widget.data.instanceId,
    );
    selected = 'Statistiques';
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          mobileHeader(
            context,
            imageLink: imageLink,
            child: MobileItemHeader(
              name: item.displayProperties!.name!,
              damage: damageType.displayProperties!.icon!,
              type: item.itemTypeDisplayName!,
              power: powerLevel,
            ),
          ),
          content
        ],
      ),
    );
  }
}
