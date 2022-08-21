import 'package:quria/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quria/presentation/components/misc/mobile_components/mobile_nav_item.dart';
import 'package:quria/presentation/screens/inspect/inspect_mobile_weapon_recommendations.dart';
import 'package:quria/presentation/screens/inspect/inspect_mobile_weapon_statistics.dart';

class InspectMobileWeaponInfo extends StatefulWidget {
  final double width;

  const InspectMobileWeaponInfo({
    required this.width,
    Key? key,
  }) : super(key: key);

  @override
  State<InspectMobileWeaponInfo> createState() => _InspectMobileWeaponInfoState();
}

enum InspectWeaponInfo {
  statistics,
  recommendations,
}

class _InspectMobileWeaponInfoState extends State<InspectMobileWeaponInfo> {
  InspectWeaponInfo weaponInfo = InspectWeaponInfo.statistics;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: globalPadding(context), bottom: globalPadding(context) * 2),
          child: SizedBox(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                InkWell(
                    onTap: () {
                      if (weaponInfo != InspectWeaponInfo.statistics) {
                        setState(
                          () {
                            weaponInfo = InspectWeaponInfo.statistics;
                          },
                        );
                      }
                    },
                    child: MobileNavItem(
                      selected: weaponInfo == InspectWeaponInfo.statistics,
                      value: AppLocalizations.of(context)!.statistics,
                    )),
                SizedBox(width: globalPadding(context)),
                InkWell(
                  onTap: () {
                    if (weaponInfo != InspectWeaponInfo.recommendations) {
                      setState(
                        () {
                          weaponInfo = InspectWeaponInfo.recommendations;
                        },
                      );
                    }
                  },
                  child: MobileNavItem(
                    selected: weaponInfo == InspectWeaponInfo.recommendations,
                    value: AppLocalizations.of(context)!.recommendation_quria,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (weaponInfo == InspectWeaponInfo.statistics) InspectMobileWeaponStatistics(width: widget.width),
        if (weaponInfo == InspectWeaponInfo.recommendations) InspectMobileWeaponRecommendations(width: widget.width)
      ],
    );
  }
}
