import 'dart:async';
import 'package:quria/data/services/storage/storage.service.dart';
import 'package:bungie_api/models/group_user_info_card.dart';
import 'package:bungie_api/models/user_membership_data.dart';
import 'package:collection/collection.dart';

import 'bungie_api.service.dart';

class AccountService {
  static GroupUserInfoCard? currentMembership;
  static UserMembershipData? membershipData;

  static final AccountService _singleton = AccountService._internal();

  factory AccountService() {
    return _singleton;
  }
  AccountService._internal();

  static Future<void> setCurrentMembershipId(String membershipId) async {
    await StorageService.setLocalStorage('currentMembership', membershipId);
  }

  static Future<String?> getCurrentMembershipId() async {
    return await StorageService.getLocalStorage('currentMembership');
  }

  static Future<UserMembershipData?> updateMembershipData() async {
    membershipData = await BungieApiService().getMemberships();
    await StorageService.setLocalStorage('membershipData', membershipData);
    return membershipData;
  }

  static Future<UserMembershipData?> getMembershipData() async {
    return membershipData ?? await _getStoredMembershipData();
  }

  static Future<UserMembershipData?> _getStoredMembershipData() async {
    Map<String, dynamic>? json =
        await StorageService.getLocalStorage('membershipData')
            as Map<String, dynamic>?;
    if (json == null) return null;
    membershipData = UserMembershipData.fromJson(json);
    return membershipData;
  }

  static void reset() {
    StorageService.removeLocalStorage("bungie_token");
    StorageService.removeLocalStorage("last_refresh");
    StorageService.removeLocalStorage("membershipData");
    StorageService.removeLocalStorage("currentMembership");
    currentMembership = null;
    membershipData = null;
  }

  static Future<GroupUserInfoCard?> getMembership() async {
    if (currentMembership == null) {
      var membershipData = await _getStoredMembershipData();
      membershipData ??= await updateMembershipData();
      var membershipId = await getCurrentMembershipId();
      currentMembership = getMembershipById(membershipData, membershipId!);
    }
    return currentMembership;
  }

  static GroupUserInfoCard? getMembershipById(
      UserMembershipData? membershipData, String membershipId) {
    return membershipData?.destinyMemberships?.firstWhereOrNull(
        (membership) => membership.membershipId == membershipId);
  }

  static Future<void> saveMembership(
      UserMembershipData membershipData, String membershipId) async {
    currentMembership = getMembershipById(membershipData, membershipId);
    await setCurrentMembershipId(membershipId);
  }
}
