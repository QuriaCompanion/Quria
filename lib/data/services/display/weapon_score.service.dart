import 'dart:developer';

import 'package:bungie_api/enums/plug_ui_styles.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:bungie_api/models/destiny_item_socket_state.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:quria/data/models/RatedScore.model.dart';
import 'package:quria/data/models/Synergy.model.dart';
import 'package:quria/data/models/WeaponScore.model.model.dart';
import 'package:http/http.dart' as http;
import 'package:quria/data/models/helpers/inspectHelper.model.dart';
import 'package:quria/data/models/perk.model.dart';
import 'package:quria/data/providers/item_provider.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';

class WeaponScoreService {
  final String _backendURl = 'https://quria-companion-back-end.herokuapp.com/';
  Future<WeaponScore?> getWeaponScore(String id) async {
    final response = await http.get(Uri.parse("${_backendURl}weapon-score/$id"));
    inspect(response);
    if (response.statusCode == 200) {
      return WeaponScore.fromJson(response.body);
    }
    return null;
  }

  RatedScore? getRatedScore(BuildContext context, DestinyItemComponent weapon, WeaponScore weaponScore) {
    final sockets = Provider.of<ItemProvider>(context, listen: false).getItemSockets(weapon.itemInstanceId);
    if (sockets.isEmpty) return null;
    final List<DestinyItemSocketState> perkList =
        sockets.where((element) => Conditions.perkSockets(element.plugHash)).toList();
    int pveScore = 0;
    int pvpScore = 0;
    final Perk? perkOne = weaponScore.columnOne
        .firstWhereOrNull((element) => element.itemHash == perkList[0].plugHash && perkList[0].isEnabled == true);
    pveScore += perkOne?.valuePve ?? 0;
    pvpScore += perkOne?.valuePvp ?? 0;
    final Perk? perkTwo = weaponScore.columnTwo
        .firstWhereOrNull((element) => element.itemHash == perkList[1].plugHash && perkList[1].isEnabled == true);
    pveScore += perkTwo?.valuePve ?? 0;
    pvpScore += perkTwo?.valuePvp ?? 0;
    final Perk? perkThree = weaponScore.columnThree
        .firstWhereOrNull((element) => element.itemHash == perkList[2].plugHash && perkList[2].isEnabled == true);
    pveScore += perkThree?.valuePve ?? 0;
    pvpScore += perkThree?.valuePvp ?? 0;
    final Perk? perkFour = weaponScore.columnFour
        .firstWhereOrNull((element) => element.itemHash == perkList[3].plugHash && perkList[3].isEnabled == true);
    pveScore += perkFour?.valuePve ?? 0;
    pvpScore += perkFour?.valuePvp ?? 0;
    final Perk? perkFive = weaponScore.columnFive
        .firstWhereOrNull((element) => element.itemHash == perkList[4].plugHash && perkList[4].isEnabled == true);
    pveScore += perkFive?.valuePve ?? 0;
    pvpScore += perkFive?.valuePvp ?? 0;

    for (Synergy synergy in weaponScore.synergies) {
      if (synergy.perkOne == perkList[3].plugHash && synergy.perkOne == perkList[4].plugHash) {
        pveScore += synergy.valuePve;
        pvpScore += synergy.valuePvp;
      }
    }
    final DestinyItemSocketState? masterworkSocket = sockets.firstWhereOrNull((element) =>
        ManifestService.manifestParsed.destinyInventoryItemDefinition[element.plugHash]?.plug?.plugStyle ==
            PlugUiStyles.Masterwork ||
        ManifestService.manifestParsed.destinyInventoryItemDefinition[element.plugHash]?.plug?.plugCategoryIdentifier
                ?.contains('masterworks.stat') ==
            true);
    final Perk? masterwork =
        weaponScore.masterwork.firstWhereOrNull((element) => element.itemHash == masterworkSocket?.plugHash);
    pveScore += masterwork?.valuePve ?? 0;
    pvpScore += masterwork?.valuePvp ?? 0;
    return RatedScore(scorePve: pveScore / weaponScore.ratioPve, scorePvp: pvpScore / weaponScore.ratioPvp);
  }

  RatedScore? getRatedScoreCollection(BuildContext context, InspectWeaponStatus? weapon, WeaponScore weaponScore) {
    if (weapon == null) return null;
    int pveScore = 0;
    int pvpScore = 0;
    final Perk? perkOne =
        weaponScore.columnOne.firstWhereOrNull((element) => element.itemHash == weapon.firstColumn?.itemHash);
    pveScore += perkOne?.valuePve ?? 0;
    pvpScore += perkOne?.valuePvp ?? 0;
    final Perk? perkTwo =
        weaponScore.columnTwo.firstWhereOrNull((element) => element.itemHash == weapon.secondColumn?.itemHash);
    pveScore += perkTwo?.valuePve ?? 0;
    pvpScore += perkTwo?.valuePvp ?? 0;
    final Perk? perkThree =
        weaponScore.columnThree.firstWhereOrNull((element) => element.itemHash == weapon.thirdColumn?.itemHash);
    pveScore += perkThree?.valuePve ?? 0;
    pvpScore += perkThree?.valuePvp ?? 0;
    final Perk? perkFour =
        weaponScore.columnFour.firstWhereOrNull((element) => element.itemHash == weapon.fourthColumn?.itemHash);
    pveScore += perkFour?.valuePve ?? 0;
    pvpScore += perkFour?.valuePvp ?? 0;
    final Perk? perkFive =
        weaponScore.columnFive.firstWhereOrNull((element) => element.itemHash == weapon.fifthColumn?.itemHash);
    pveScore += perkFive?.valuePve ?? 0;
    pvpScore += perkFive?.valuePvp ?? 0;

    for (Synergy synergy in weaponScore.synergies) {
      if (synergy.perkOne == weapon.thirdColumn?.itemHash && synergy.perkTwo == weapon.fourthColumn?.itemHash) {
        pveScore += synergy.valuePve;
        pvpScore += synergy.valuePvp;
      }
    }

    return RatedScore(scorePve: pveScore / weaponScore.ratioPve, scorePvp: pvpScore / weaponScore.ratioPvp);
  }
}
