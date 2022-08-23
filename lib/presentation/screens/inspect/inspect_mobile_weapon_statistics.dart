import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/providers/inspect/inspect_provider.dart';
import 'package:quria/data/providers/inventory_provider.dart';
import 'package:quria/presentation/screens/inspect/mobile_components/inspect_mobile_actions.dart';
import 'package:quria/presentation/screens/inspect/mobile_components/inspect_mobile_cosmetics.dart';
import 'package:quria/presentation/screens/inspect/mobile_components/inspect_mobile_intrinsics.dart';
import 'package:quria/presentation/screens/inspect/mobile_components/inspect_mobile_origin.dart';
import 'package:quria/presentation/screens/inspect/mobile_components/inspect_mobile_perks.dart';
import 'package:quria/presentation/screens/inspect/mobile_components/inspect_mobile_specimens.dart';
import 'package:quria/presentation/screens/inspect/mobile_components/inspect_mobile_stats.dart';

class InspectMobileWeaponStatistics extends ConsumerStatefulWidget {
  final double width;
  const InspectMobileWeaponStatistics({Key? key, required this.width}) : super(key: key);

  @override
  InspectMobileWeaponStatisticsState createState() => InspectMobileWeaponStatisticsState();
}

class InspectMobileWeaponStatisticsState extends ConsumerState<InspectMobileWeaponStatistics> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      ref.read(inspectProvider.notifier).setWeaponStatus(null);
    });
  }

  @override
  Widget build(BuildContext context) {
    final itemDef = ref.watch(inspectProvider.select((value) => value?.itemDef));
    final item = ref.watch(inspectProvider.select((value) => value?.item));
    return Column(
      children: [
        if (isMobile(context))
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
        if (ref.watch(allSpecimensProvider(item)).isNotEmpty)
          mobileSection(
            context,
            title: AppLocalizations.of(context)!.other_specimens,
            child: InspectMobileSpecimens(
              width: widget.width,
            ),
          ),
        if (itemDef?.collectibleHash != null)
          mobileSection(
            context,
            title: AppLocalizations.of(context)!.origin,
            child: InspectMobileOrigin(
              collectionHash: itemDef?.collectibleHash,
            ),
          ),
      ],
    );
  }
}
