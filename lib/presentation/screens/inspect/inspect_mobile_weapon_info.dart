import 'package:provider/provider.dart';
import 'package:quria/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:quria/data/providers/inspect/inspect_provider.dart';
import 'package:quria/presentation/screens/inspect/mobile_components/inspect_mobile_actions.dart';
import 'package:quria/presentation/screens/inspect/mobile_components/inspect_mobile_cosmetics.dart';
import 'package:quria/presentation/screens/inspect/mobile_components/inspect_mobile_perks.dart';
import 'package:quria/presentation/screens/inspect/mobile_components/inspect_mobile_origin.dart';
import 'package:quria/presentation/screens/inspect/mobile_components/inspect_mobile_intrinsics.dart';
import 'package:quria/presentation/screens/inspect/mobile_components/inspect_mobile_stats.dart';

class InspectMobileWeaponInfo extends StatefulWidget {
  final double width;

  const InspectMobileWeaponInfo({
    required this.width,
    Key? key,
  }) : super(key: key);

  @override
  State<InspectMobileWeaponInfo> createState() => _InspectMobileWeaponInfoState();
}

class _InspectMobileWeaponInfoState extends State<InspectMobileWeaponInfo> {
  @override
  Widget build(BuildContext context) {
    final itemDef = Provider.of<InspectProvider>(context).itemDef!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        mobileSection(
          context,
          title: AppLocalizations.of(context)!.quick_actions,
          child: InspectMobileActions(
            width: widget.width,
          ),
        ),
        mobileSection(
          context,
          title: AppLocalizations.of(context)!.statistics,
          child: InspectMobileStats(
            width: widget.width - globalPadding(context) * 2,
          ),
        ),
        mobileSection(
          context,
          title: AppLocalizations.of(context)!.perks,
          child: InspectMobilePerks(
            width: widget.width,
          ),
        ),
        mobileSection(
          context,
          title: AppLocalizations.of(context)!.mods_and_intrinsics,
          child: InspectMobileIntrinsics(width: widget.width),
        ),
        mobileSection(
          context,
          title: AppLocalizations.of(context)!.cosmetics,
          child: MobileInspectCosmetics(
            width: widget.width,
          ),
        ),
        if (itemDef.collectibleHash != null)
          mobileSection(
            context,
            title: AppLocalizations.of(context)!.origin,
            child: InspectMobileOrigin(
              collectionHash: itemDef.collectibleHash,
            ),
          ),
      ],
    );
  }
}
