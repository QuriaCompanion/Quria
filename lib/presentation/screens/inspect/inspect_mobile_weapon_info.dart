import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:bungie_api/models/destiny_item_plug_base.dart';
import 'package:bungie_api/models/destiny_item_socket_state.dart';
import 'package:bungie_api/models/destiny_stat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
  final String? characterId;
  final Map<String, DestinyStat>? stats;
  final List<DestinyItemSocketState>? sockets;
  final Map<String, List<DestinyItemPlugBase>>? plugs;
  final double width;

  const InspectMobileWeaponInfo({
    required this.item,
    required this.instanceId,
    required this.stats,
    required this.characterId,
    required this.sockets,
    required this.plugs,
    required this.width,
    Key? key,
  }) : super(key: key);

  @override
  State<InspectMobileWeaponInfo> createState() =>
      _InspectMobileWeaponInfoState();
}

class _InspectMobileWeaponInfoState extends State<InspectMobileWeaponInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        mobileSection(
          context,
          title: AppLocalizations.of(context)!.quick_actions,
          child: InspectMobileActions(
            width: widget.width,
            itemHash: widget.item.hash!,
            instanceId: widget.instanceId,
          ),
        ),
        mobileSection(
          context,
          title: AppLocalizations.of(context)!.statistics,
          child: InspectMobileStats(
            item: widget.item,
            stats: widget.stats,
            width: widget.width - globalPadding(context) * 2,
          ),
        ),
        mobileSection(
          context,
          title: AppLocalizations.of(context)!.perks,
          child: InspectMobilePerks(
            instanceId: widget.instanceId,
            sockets: widget.sockets,
            plugs: widget.plugs,
            characterId: widget.characterId,
            width: widget.width,
          ),
        ),
        mobileSection(
          context,
          title: AppLocalizations.of(context)!.mods_and_intrinsics,
          child: InspectMobileIntrinsics(sockets: widget.sockets),
        ),
        mobileSection(
          context,
          title: AppLocalizations.of(context)!.cosmetics,
          child: MobileInspectCosmetics(
            sockets: widget.sockets!,
            width: widget.width,
          ),
        ),
        if (widget.item.collectibleHash != null)
          mobileSection(
            context,
            title: AppLocalizations.of(context)!.origin,
            child: InspectMobileOrigin(
              collectionHash: widget.item.collectibleHash,
            ),
          ),
      ],
    );
  }
}
