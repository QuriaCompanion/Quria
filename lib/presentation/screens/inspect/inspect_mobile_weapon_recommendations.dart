import 'package:bungie_api/models/destiny_item_socket_state.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/WeaponScore.model.model.dart';
import 'package:quria/data/models/helpers/inspectHelper.model.dart';
import 'package:quria/data/models/perk.model.dart';
import 'package:quria/data/providers/inspect/inspect_provider.dart';
import 'package:quria/data/providers/item_provider.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/display/weapon_score.service.dart';
import 'package:quria/presentation/components/misc/loader.dart';
import 'package:quria/presentation/screens/inspect/components/perk_list.dart';
import 'package:quria/presentation/screens/inspect/mobile_components/inspect_mobile_stats.dart';

class InspectMobileWeaponRecommendations extends StatefulWidget {
  final double width;
  const InspectMobileWeaponRecommendations({Key? key, required this.width}) : super(key: key);

  @override
  State<InspectMobileWeaponRecommendations> createState() => _InspectMobileWeaponRecommendationsState();
}

class _InspectMobileWeaponRecommendationsState extends State<InspectMobileWeaponRecommendations> {
  late Future<WeaponScore?> _future;
  @override
  void initState() {
    super.initState();
    _future =
        WeaponScoreService().getWeaponScore('${Provider.of<InspectProvider>(context, listen: false).itemDef?.hash}');
    _future.then((value) {
      if (value != null) {
        Provider.of<InspectProvider>(context, listen: false).setWeaponScore(value);
        final weapon = Provider.of<InspectProvider>(context, listen: false).item;
        final sockets = Provider.of<ItemProvider>(context, listen: false).getItemSockets(weapon?.itemInstanceId);
        if (sockets.isEmpty) return;
        final List<DestinyItemSocketState> perkList =
            sockets.where((element) => Conditions.perkSockets(element.plugHash)).toList();
        final Perk? perkOne = value.columnOne
            .firstWhereOrNull((element) => element.itemHash == perkList[0].plugHash && perkList[0].isEnabled == true);
        Perk? perkTwo;
        if (perkList.length >= 2) {
          perkTwo = value.columnTwo
              .firstWhereOrNull((element) => element.itemHash == perkList[1].plugHash && perkList[1].isEnabled == true);
        }
        Perk? perkThree;
        if (perkList.length >= 3) {
          perkThree = value.columnThree
              .firstWhereOrNull((element) => element.itemHash == perkList[2].plugHash && perkList[2].isEnabled == true);
        }
        Perk? perkFour;
        if (perkList.length >= 4) {
          perkFour = value.columnFour
              .firstWhereOrNull((element) => element.itemHash == perkList[3].plugHash && perkList[3].isEnabled == true);
        }
        Perk? perkFive;
        if (perkList.length >= 5) {
          perkFive = value.columnFive
              .firstWhereOrNull((element) => element.itemHash == perkList[3].plugHash && perkList[3].isEnabled == true);
        }
        InspectWeaponStatus initStatus = InspectWeaponStatus(
          firstColumn: perkOne,
          secondColumn: perkTwo,
          thirdColumn: perkThree,
          fourthColumn: perkFour,
          fifthColumn: perkFive,
        );
        Provider.of<InspectProvider>(context, listen: false).setWeaponStatus(initStatus);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _future,
        builder: ((context, AsyncSnapshot<WeaponScore?> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              final WeaponScore weaponScore = snapshot.data!;

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
                            decoration: const BoxDecoration(
                                color: blackLight, borderRadius: BorderRadius.all(Radius.circular(8))),
                            child: Center(
                              child: textCaption(
                                AppLocalizations.of(context)!.ajust_perks,
                                utf8: false,
                              ),
                            ),
                          ),
                          SizedBox(height: globalPadding(context)),
                          InspectMobileStats(
                            bonusStats: Provider.of<InspectProvider>(context).getBonusStats(),
                            width: widget.width - globalPadding(context) * 2,
                          ),
                          const Divider(
                            color: blackLight,
                            height: 22,
                            thickness: 1,
                          ),
                          PerkList(
                            width: widget.width,
                          ),
                        ],
                      )),
                ],
              );
            } else {
              return Container(
                padding: EdgeInsets.all(globalPadding(context)) * 0.875,
                decoration: const BoxDecoration(color: blackLight, borderRadius: BorderRadius.all(Radius.circular(8))),
                child: Center(
                  child: textCaption(
                    AppLocalizations.of(context)!.no_score,
                    utf8: false,
                  ),
                ),
              );
            }
          } else {
            return const Center(child: Loader());
          }
        }));
  }
}
