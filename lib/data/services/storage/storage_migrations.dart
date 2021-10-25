import 'dart:convert';
import 'dart:io';

import 'package:quria/data/services/storage/storage.service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:bungie_api/helpers/bungie_net_token.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:bungie_api/models/user_membership_data.dart';

class StorageMigrations {
  late String rootPath;
  late SharedPreferences prefs;
  constructor() {}
  run() async {
    prefs = await SharedPreferences.getInstance();
    await removeOldManifest();
    await updateAccountInfo();
  }

  removeOldManifest() async {
    await prefs.remove("manifestVersion");
  }

  updateAccountInfo() async {
    var latestMembership = prefs.getString("latestMembership");
    var latestToken = prefs.getString("latestToken");
    if (latestMembership == null) return;
    try {
      var membershipJson = jsonDecode(latestMembership);
      var tokenJson = jsonDecode(latestToken!);

      var membershipType = membershipJson['membershipType'];
      var membershipData = UserMembershipData.fromJson(membershipJson);
      var bungieNetToken = BungieNetToken.fromJson(tokenJson);
      var tokenDate = DateTime.parse(tokenJson['saved_date']);

      var selectedAccount = membershipData.bungieNetUser!.membershipId;
      var selectedMembership = membershipData.destinyMemberships!
          .firstWhere((m) => m.membershipType == membershipType)
          .membershipId;

      var accountStorage = StorageService.account(selectedAccount);
      var membershipStorage = StorageService.membership(selectedMembership);

      accountStorage.setJson(StorageKeys.latestToken, bungieNetToken);
      accountStorage.setJson(StorageKeys.membershipData, bungieNetToken);
      accountStorage.setDate(StorageKeys.latestTokenDate, tokenDate);
      StorageService.setAccount(selectedAccount);
      StorageService.setMembership(selectedMembership);

      membershipStorage.setString(
          StorageKeys.membershipSecret, prefs.getString("littlelight_secret"));
      membershipStorage.setString(
          StorageKeys.membershipUUID, prefs.getString("littlelight_device_id"));

      prefs.remove("latestMembership");
      prefs.remove("latestToken");
    } catch (e) {
      print(e);
    }
  }
}
