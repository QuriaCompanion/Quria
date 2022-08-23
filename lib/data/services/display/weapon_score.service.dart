import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:collection/collection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quria/data/models/RatedScore.model.dart';
import 'package:quria/data/models/Synergy.model.dart';
import 'package:quria/data/models/WeaponScore.model.model.dart';
import 'package:http/http.dart' as http;
import 'package:quria/data/models/helpers/inspectHelper.model.dart';
import 'package:quria/data/models/perk.model.dart';
import 'package:quria/data/providers/inspect/inspect_provider.dart';
import 'package:quria/data/providers/item_provider.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';

const String backendURl = 'https://quria-companion-back-end.herokuapp.com/';

final futureWeaponScoreProvider = FutureProvider<WeaponScore>((ref) async {
  final id = ref.watch(inspectProvider.select((value) => value?.itemDef.hash));
  if (id == null) throw Exception('No item hash found');
  final response = await http.get(Uri.parse("${backendURl}weapon-score/$id"));
  if (response.statusCode == 200) {
    final weaponScore = WeaponScore.fromJson(response.body);
    ref.read(inspectProvider.notifier).setWeaponScore(weaponScore);
    return weaponScore;
  }
  throw Exception('Failed to load weapon score');
});
final ratedScoreProvider = FutureProviderFamily<RatedScore, DestinyItemComponent?>((ref, itemComponent) async {
  try {
    final weaponScore = await ref.watch(futureWeaponScoreProvider.future);

    final List<int> sockets = [];
    if (itemComponent != null) {
      sockets.addAll(ref
          .watch(itemSocketsProvider(itemComponent.itemInstanceId))
          .where(
            (element) => Conditions.perkSockets(element.plugHash),
          )
          .map((e) => e.plugHash!));
    } else {
      final itemDef = ref.watch(inspectProvider.select((value) => value?.itemDef));
      if (itemDef?.sockets?.socketEntries != null) {
        for (int index = 0; index < itemDef!.sockets!.socketEntries!.length; index++) {
          final perkHash = itemDef.sockets!.socketEntries?[index].singleInitialItemHash;

          if (Conditions.perkSockets(perkHash)) {
            sockets.add(perkHash!);
          }
        }
      }
    }

    double pveScore = 0;
    double pvpScore = 0;
    final Perk? perkOne = weaponScore.columnOne.firstWhereOrNull((element) => element.itemHash == sockets[0]);
    pveScore += perkOne?.valuePve ?? 0;
    pvpScore += perkOne?.valuePvp ?? 0;
    Perk? perkTwo;
    if (sockets.length >= 2) {
      perkTwo = weaponScore.columnTwo.firstWhereOrNull((element) => element.itemHash == sockets[1]);
      pveScore += perkTwo?.valuePve ?? 0;
      pvpScore += perkTwo?.valuePvp ?? 0;
    }
    Perk? perkThree;
    if (sockets.length >= 3) {
      perkThree = weaponScore.columnThree.firstWhereOrNull((element) => element.itemHash == sockets[2]);
      pveScore += perkThree?.valuePve ?? 0;
      pvpScore += perkThree?.valuePvp ?? 0;
    }
    Perk? perkFour;
    if (sockets.length >= 4) {
      Perk? perkFour = weaponScore.columnFour.firstWhereOrNull((element) => element.itemHash == sockets[3]);
      pveScore += perkFour?.valuePve ?? 0;
      pvpScore += perkFour?.valuePvp ?? 0;
      for (Synergy synergy in weaponScore.synergies) {
        if (synergy.perkOne == sockets[3] && synergy.perkOne == sockets[4]) {
          pveScore += synergy.valuePve;
          pvpScore += synergy.valuePvp;
        }
      }
    }
    Perk? perkFive;
    if (sockets.length >= 5) {
      perkFive = weaponScore.columnFive.firstWhereOrNull((element) => element.itemHash == sockets[4]);
      pveScore += perkFive?.valuePve ?? 0;
      pvpScore += perkFive?.valuePvp ?? 0;
    }
    InspectWeaponStatus initStatus = InspectWeaponStatus(
      firstColumn: perkOne,
      secondColumn: perkTwo,
      thirdColumn: perkOne,
      fourthColumn: perkFour,
      fifthColumn: perkFive,
    );
    ref.read(inspectProvider.notifier).setWeaponStatus(initStatus);

    return RatedScore(scorePve: pveScore, scorePvp: pvpScore);
  } catch (e) {
    final List<Perk> sockets = [];
    final itemDef = ref.watch(inspectProvider.select((value) => value?.itemDef));
    if (itemDef?.sockets?.socketEntries != null) {
      for (int index = 0; index < itemDef!.sockets!.socketEntries!.length; index++) {
        final perkHash = itemDef.sockets!.socketEntries?[index].singleInitialItemHash;

        if (Conditions.perkSockets(perkHash)) {
          sockets.add(Perk(itemHash: perkHash!));
        }
      }
    }
    final socketMap = sockets.asMap();
    InspectWeaponStatus initStatus = InspectWeaponStatus(
      firstColumn: socketMap.containsKey(0) ? socketMap[0] : null,
      secondColumn: socketMap.containsKey(1) ? socketMap[1] : null,
      thirdColumn: socketMap.containsKey(2) ? socketMap[2] : null,
      fourthColumn: socketMap.containsKey(3) ? socketMap[3] : null,
      fifthColumn: socketMap.containsKey(4) ? socketMap[4] : null,
    );
    ref.read(inspectProvider.notifier).setWeaponStatus(initStatus);
    rethrow;
  }
});
