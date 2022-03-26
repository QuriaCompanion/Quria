import 'package:bungie_api/enums/destiny_item_type.dart';
import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:bungie_api/models/destiny_item_instance_component.dart';
import 'package:bungie_api/models/destiny_stat.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/helpers/inspectData.model.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/bungie_api/profile.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/screens/inspect/components/mobile_inspect_armor_statistics.dart';
import 'package:quria/presentation/screens/inspect/components/mobile_inspect_weapon_statistics.dart';
import 'package:quria/presentation/screens/inspect/components/mobile_item_header.dart';

class MobileInspect extends StatefulWidget {
  final InspectData data;
  const MobileInspect({Key? key, required this.data}) : super(key: key);
  @override
  State<MobileInspect> createState() => _MobileInspectState();
}

@override
class _MobileInspectState extends State<MobileInspect> {
  late final DestinyInventoryItemDefinition itemDef;
  late final Map<String, DestinyStat>? stats;
  late final String imageLink;
  late final int powerLevel;
  late Widget content;
  late String selected;
  late String? elementIcon;
  @override
  void initState() {
    super.initState();
    ProfileService profile = ProfileService();
    itemDef = ManifestService
        .manifestParsed.destinyInventoryItemDefinition![widget.data.hash]!;
    stats = profile.getPrecalculatedStats(widget.data.instanceId);
    DestinyItemInstanceComponent instanceInfo =
        profile.getInstanceInfo(widget.data.instanceId);
    powerLevel = instanceInfo.primaryStat!.value!;
    imageLink = DestinyData.bungieLink + itemDef.screenshot!;
    elementIcon = ManifestService
            .manifestParsed
            .destinyDamageTypeDefinition?[itemDef.defaultDamageTypeHash]
            ?.displayProperties
            ?.icon ??
        ManifestService
            .manifestParsed
            .destinyEnergyTypeDefinition?[instanceInfo.energy?.energyTypeHash]
            ?.displayProperties
            ?.icon;
    content = itemDef.itemType == DestinyItemType.Weapon
        ? MobileInspectWeaponStatistics(
            item: itemDef,
            stats: stats,
            instanceId: widget.data.instanceId,
          )
        : MobileInspectArmorStatistics(
            item: itemDef,
            stats: stats,
            instanceId: widget.data.instanceId,
          );
    selected = 'Statistiques';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: black,
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton(
        backgroundColor: blackLight,
        onPressed: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Icon(
            Icons.chevron_left,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            mobileHeader(
              context,
              imageLink: imageLink,
              child: MobileItemHeader(
                name: itemDef.displayProperties!.name!,
                iconElement: elementIcon!,
                type: itemDef.itemTypeDisplayName!,
                power: powerLevel,
              ),
            ),
            content
          ],
        ),
      ),
    );
  }
}
