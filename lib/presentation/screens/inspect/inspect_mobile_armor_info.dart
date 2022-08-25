import 'package:bungie_api/enums/tier_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:quria/data/providers/inspect/inspect_provider.dart';
import 'package:quria/data/providers/item_provider.dart';
import 'package:quria/presentation/components/detailed_item/item/armor_mods.dart';
import 'package:quria/presentation/screens/inspect/mobile_components/inspect_mobile_actions.dart';
import 'package:quria/presentation/screens/inspect/mobile_components/inspect_mobile_cosmetics.dart';
import 'package:quria/presentation/screens/inspect/mobile_components/inspect_mobile_exotic_armor.dart';
import 'package:quria/presentation/screens/inspect/mobile_components/inspect_mobile_origin.dart';
import 'package:quria/presentation/screens/inspect/mobile_components/inspect_mobile_stats.dart';

class InspectMobileArmorInfo extends ConsumerWidget {
  final double width;

  const InspectMobileArmorInfo({
    required this.width,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DestinyInventoryItemDefinition itemDef = ref.watch(inspectProvider.select((value) => value?.itemDef))!;
    String? afinityIcon =
        ref.watch(afinityIconProvider(ref.watch(inspectProvider.select((value) => value?.item))?.itemInstanceId));

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      if (isMobile(context))
        mobileSection(
          context,
          title: AppLocalizations.of(context)!.quick_actions,
          child: InspectMobileActions(width: width),
        ),
      mobileSection(
        context,
        title: AppLocalizations.of(context)!.statistics,
        child: InspectMobileStats(width: width),
      ),
      if (itemDef.inventory?.tierType == TierType.Exotic)
        mobileSection(
          context,
          title: AppLocalizations.of(context)!.exotic_perk,
          child: InspectMobileExoticArmor(width: width),
        ),
      if (afinityIcon != null)
        mobileSection(
          context,
          title: AppLocalizations.of(context)!.armor_mods,
          child: ArmorMods(width: width),
        ),
      mobileSection(
        context,
        title: AppLocalizations.of(context)!.cosmetics,
        child: MobileInspectCosmetics(
          width: width,
        ),
      ),
      mobileSection(context,
          title: AppLocalizations.of(context)!.origin,
          child: InspectMobileOrigin(collectionHash: itemDef.collectibleHash))
    ]);
  }
}
