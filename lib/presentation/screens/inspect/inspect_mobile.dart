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
import 'package:quria/presentation/components/misc/mobile_components/mobile_nav_item.dart';
import 'package:quria/presentation/screens/inspect/inspect_mobile_armor_info.dart';
import 'package:quria/presentation/screens/inspect/inspect_mobile_weapon_info.dart';
import 'package:quria/presentation/screens/inspect/mobile_components/inspect_mobile_header.dart';

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
        ? InspectMobileWeaponInfo(
            item: itemDef,
            stats: stats,
            instanceId: widget.data.instanceId,
          )
        : InspectMobileArmorInfo(
            item: itemDef,
            stats: stats,
            instanceId: widget.data.instanceId,
          );
    selected = 'Informations';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            mobileHeader(
              context,
              image: NetworkImage(imageLink),
              child: InspectMobileHeader(
                name: itemDef.displayProperties!.name!,
                iconElement: elementIcon!,
                type: itemDef.itemTypeDisplayName!,
                power: powerLevel,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: globalPadding(context),
                  bottom: globalPadding(context) * 2),
              child: SizedBox(
                height: 45,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                        onTap: () {
                          setState(() {
                            selected = "Informations";
                            content = itemDef.itemType == DestinyItemType.Weapon
                                ? InspectMobileWeaponInfo(
                                    item: itemDef,
                                    stats: stats,
                                    instanceId: widget.data.instanceId,
                                  )
                                : InspectMobileArmorInfo(
                                    item: itemDef,
                                    stats: stats,
                                    instanceId: widget.data.instanceId,
                                  );
                          });
                        },
                        child: MobileNavItem(
                          selected: selected == "Informations",
                          value: "Informations",
                          width: 171,
                        )),
                    InkWell(
                        onTap: () {
                          setState(() {
                            selected = "Recomendations";
                          });
                        },
                        child: MobileNavItem(
                          selected: "Recomendations" == selected,
                          value: "Recomendations",
                          width: 171,
                        )),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: globalPadding(context),
                  right: globalPadding(context),
                  bottom: globalPadding(context)),
              child: content,
            )
          ],
        ),
      ),
    );
  }
}
