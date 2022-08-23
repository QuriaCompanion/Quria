import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/WeaponScore.model.model.dart';
import 'package:quria/data/providers/inspect/inspect_provider.dart';
import 'package:quria/data/services/display/weapon_score.service.dart';
import 'package:quria/presentation/components/misc/loader.dart';
import 'package:quria/presentation/screens/inspect/components/perk_list.dart';
import 'package:quria/presentation/screens/inspect/mobile_components/inspect_mobile_stats.dart';

class InspectMobileWeaponRecommendations extends ConsumerWidget {
  final double width;
  const InspectMobileWeaponRecommendations({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<WeaponScore> future = ref.watch(futureWeaponScoreProvider);
    return future.when(
      data: (weaponScore) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textBodyRegular('${weaponScore.notes}', utf8: false, color: greyLight),
            textBodyBold('- ${weaponScore.author}', utf8: false, color: greyLight),
            mobileSection(context,
                title: AppLocalizations.of(context)!.optimise_my_weapon,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(globalPadding(context)) * 0.875,
                      decoration:
                          const BoxDecoration(color: blackLight, borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: Center(
                        child: textCaption(
                          AppLocalizations.of(context)!.ajust_perks,
                          utf8: false,
                        ),
                      ),
                    ),
                    SizedBox(height: globalPadding(context)),
                    InspectMobileStats(
                      bonusStats: ref.watch(inspectBonusStatProvider),
                      width: width - globalPadding(context) * 2,
                    ),
                    const Divider(
                      color: blackLight,
                      height: 22,
                      thickness: 1,
                    ),
                    PerkList(
                      width: width,
                    ),
                  ],
                )),
          ],
        );
      },
      error: (_, __) => Container(
        padding: EdgeInsets.all(globalPadding(context)) * 0.875,
        decoration: const BoxDecoration(color: blackLight, borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Center(
          child: textCaption(
            AppLocalizations.of(context)!.no_score,
            utf8: false,
          ),
        ),
      ),
      loading: () => const Center(
        child: Loader(),
      ),
    );
  }
}
