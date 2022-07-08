import 'package:bungie_api/enums/tier_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:quria/data/providers/inspect/inspect_provider.dart';
import 'package:quria/presentation/components/detailed_item/item/armor_mods.dart';
import 'package:quria/presentation/screens/inspect/mobile_components/inspect_mobile_actions.dart';
import 'package:quria/presentation/screens/inspect/mobile_components/inspect_mobile_cosmetics.dart';
import 'package:quria/presentation/screens/inspect/mobile_components/inspect_mobile_exotic_armor.dart';
import 'package:quria/presentation/screens/inspect/mobile_components/inspect_mobile_origin.dart';
import 'package:quria/presentation/screens/inspect/mobile_components/inspect_mobile_stats.dart';

class InspectMobileArmorInfo extends StatefulWidget {
  final double width;

  const InspectMobileArmorInfo({
    required this.width,
    Key? key,
  }) : super(key: key);

  @override
  State<InspectMobileArmorInfo> createState() => _InspectMobileArmorInfoState();
}

class _InspectMobileArmorInfoState extends State<InspectMobileArmorInfo> {
  @override
  Widget build(BuildContext context) {
    DestinyInventoryItemDefinition itemDef = Provider.of<InspectProvider>(context).itemDef!;
    String? afinityIcon = Provider.of<InspectProvider>(context).getAfinityIcon(context);

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      if (vw(context) < 1000)
        mobileSection(
          context,
          title: AppLocalizations.of(context)!.quick_actions,
          child: InspectMobileActions(width: widget.width),
        ),
      mobileSection(
        context,
        title: AppLocalizations.of(context)!.statistics,
        child: InspectMobileStats(width: widget.width),
      ),
      if (itemDef.inventory?.tierType == TierType.Exotic)
        mobileSection(context,
            title: AppLocalizations.of(context)!.exotic_perk, child: InspectMobileExoticArmor(width: widget.width)),
      if (afinityIcon != null)
        mobileSection(
          context,
          title: AppLocalizations.of(context)!.armor_mods,
          child: ArmorMods(width: widget.width),
        ),
      mobileSection(
        context,
        title: AppLocalizations.of(context)!.cosmetics,
        child: MobileInspectCosmetics(
          width: widget.width,
        ),
      ),
      mobileSection(context,
          title: AppLocalizations.of(context)!.origin,
          child: InspectMobileOrigin(collectionHash: itemDef.collectibleHash))
    ]);
  }
}
