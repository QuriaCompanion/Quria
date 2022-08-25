import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quria/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quria/data/providers/inspect/inspect_provider.dart';
import 'package:quria/presentation/components/misc/mobile_components/mobile_nav_item.dart';
import 'package:quria/presentation/screens/inspect/inspect_mobile_weapon_recommendations.dart';
import 'package:quria/presentation/screens/inspect/inspect_mobile_weapon_statistics.dart';

class InspectMobileWeaponInfo extends ConsumerWidget {
  final double width;

  const InspectMobileWeaponInfo({
    required this.width,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentFilter = ref.watch(subtabInspectProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: globalPadding(context), bottom: globalPadding(context) * 2),
          child: SizedBox(
            height: 45,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                InkWell(
                    onTap: () {
                      if (currentFilter != InspectWeaponInfo.statistics) {
                        ref
                            .read(subtabInspectProvider.notifier)
                            .update((state) => state = InspectWeaponInfo.statistics);
                      }
                    },
                    child: MobileNavItem(
                      selected: currentFilter == InspectWeaponInfo.statistics,
                      value: AppLocalizations.of(context)!.statistics,
                    )),
                SizedBox(width: globalPadding(context)),
                InkWell(
                  onTap: () {
                    if (currentFilter != InspectWeaponInfo.recommendations) {
                      ref
                          .read(subtabInspectProvider.notifier)
                          .update((state) => state = InspectWeaponInfo.recommendations);
                    }
                  },
                  child: MobileNavItem(
                    selected: currentFilter == InspectWeaponInfo.recommendations,
                    value: AppLocalizations.of(context)!.recommendation_quria,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (currentFilter == InspectWeaponInfo.statistics) InspectMobileWeaponStatistics(width: width),
        if (currentFilter == InspectWeaponInfo.recommendations) InspectMobileWeaponRecommendations(width: width)
      ],
    );
  }
}
