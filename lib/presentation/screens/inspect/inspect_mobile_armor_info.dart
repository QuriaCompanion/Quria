import 'package:bungie_api/enums/tier_type.dart';
import 'package:bungie_api/models/destiny_item_socket_state.dart';
import 'package:bungie_api/models/destiny_stat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:quria/presentation/components/detailed_item/item/armor_mods.dart';
import 'package:quria/presentation/screens/inspect/mobile_components/inspect_mobile_actions.dart';
import 'package:quria/presentation/screens/inspect/mobile_components/inspect_mobile_cosmetics.dart';
import 'package:quria/presentation/screens/inspect/mobile_components/inspect_mobile_exotic_armor.dart';
import 'package:quria/presentation/screens/inspect/mobile_components/inspect_mobile_origin.dart';
import 'package:quria/presentation/screens/inspect/mobile_components/inspect_mobile_stats.dart';

class InspectMobileArmorInfo extends StatefulWidget {
  final DestinyInventoryItemDefinition item;
  final String instanceId;
  final String? characterId;
  final List<DestinyItemSocketState> sockets;
  final Map<String, DestinyStat>? stats;
  final String? afinityIcon;

  const InspectMobileArmorInfo(
      {required this.item,
      required this.instanceId,
      required this.stats,
      required this.characterId,
      required this.sockets,
      required this.afinityIcon,
      Key? key})
      : super(key: key);

  @override
  State<InspectMobileArmorInfo> createState() => _InspectMobileArmorInfoState();
}

class _InspectMobileArmorInfoState extends State<InspectMobileArmorInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      mobileSection(context,
          title: AppLocalizations.of(context)!.quick_actions,
          child: InspectMobileActions(
            itemHash: widget.item.hash!,
            instanceId: widget.instanceId,
          )),
      mobileSection(context,
          title: AppLocalizations.of(context)!.statistics,
          child: InspectMobileStats(item: widget.item, stats: widget.stats)),
      if (widget.item.inventory?.tierType == TierType.Exotic)
        mobileSection(context,
            title: AppLocalizations.of(context)!.exotic_perk,
            child: InspectMobileExoticArmor(sockets: widget.sockets)),
      if (widget.afinityIcon != null)
        mobileSection(context,
            title: AppLocalizations.of(context)!.armor_mods,
            child: ArmorMods(
                instanceId: widget.instanceId,
                afinityIcon: widget.afinityIcon!,
                sockets: widget.sockets,
                characterId: widget.characterId,
                item: widget.item)),
      mobileSection(context,
          title: AppLocalizations.of(context)!.cosmetics,
          child: MobileInspectCosmetics(sockets: widget.sockets)),
      mobileSection(context,
          title: AppLocalizations.of(context)!.origin,
          child:
              InspectMobileOrigin(collectionHash: widget.item.collectibleHash))
    ]);
  }
}
