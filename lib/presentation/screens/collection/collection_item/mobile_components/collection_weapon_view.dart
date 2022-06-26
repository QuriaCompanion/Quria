import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:quria/data/models/helpers/inspectHelper.model.dart';
import 'package:quria/presentation/screens/inspect/components/perk_list.dart';
import 'package:quria/presentation/screens/inspect/mobile_components/inspect_mobile_origin.dart';
import 'package:quria/presentation/screens/inspect/mobile_components/inspect_mobile_stats.dart';

class CollectionWeaponView extends StatelessWidget {
  final DestinyInventoryItemDefinition item;
  final double width;
  const CollectionWeaponView({
    required this.item,
    required this.width,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final InspectHelper selectedPerks = InspectHelper();
    return Column(
      children: [
        mobileSection(
          context,
          title: AppLocalizations.of(context)!.statistics,
          child: InspectMobileStats(
            item: item,
            width: width,
          ),
        ),
        mobileSection(
          context,
          title: AppLocalizations.of(context)!.perks,
          child: PerkList(
            item: item,
            selectedPerks: selectedPerks,
            width: width,
          ),
        ),
        mobileSection(context,
            title: AppLocalizations.of(context)!.origin,
            child: InspectMobileOrigin(collectionHash: item.collectibleHash)),
        SizedBox(
          height: globalPadding(context) * 3,
        )
      ],
    );
  }
}
