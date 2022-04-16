import 'dart:async';
import 'package:quria/data/services/storage/storage.service.dart';
import 'package:bungie_api/models/group_user_info_card.dart';
import 'package:bungie_api/models/user_membership_data.dart';

import 'bungie_api.service.dart';

class AccountService {
  static GroupUserInfoCard? currentMembership;
  static UserMembershipData? membershipData;

  static final AccountService _singleton = AccountService._internal();

  factory AccountService() {
    return _singleton;
  }
  AccountService._internal();

  Future<void> setCurrentMembershipId(String membershipId) async {
    await StorageService.setLocalStorage('currentMembership', membershipId);
  }

  Future<String?> getCurrentMembershipId() async {
    return await StorageService.getLocalStorage('currentMembership');
  }

  Future<UserMembershipData?> updateMembershipData() async {
    UserMembershipData? membershipData =
        await BungieApiService().getMemberships();
    await StorageService.setLocalStorage('membershipData', membershipData);
    return membershipData;
  }

  Future<UserMembershipData?> getMembershipData() async {
    return membershipData ?? await _getStoredMembershipData();
  }

  Future<UserMembershipData?> _getStoredMembershipData() async {
    Map<String, dynamic>? json =
        await StorageService.getLocalStorage('membershipData')
            as Map<String, dynamic>?;
    if (json == null) {
      return null;
    }
    membershipData = UserMembershipData.fromJson(json);
    return membershipData;
  }

  void reset() {
    currentMembership = null;
    membershipData = null;
  }

  Future<GroupUserInfoCard?> getMembership() async {
    if (currentMembership == null) {
      var _membershipData = await _getStoredMembershipData();
      _membershipData ??= await updateMembershipData();
      var _membershipId = await getCurrentMembershipId();
      currentMembership = getMembershipById(_membershipData, _membershipId!);
    }
    return currentMembership;
  }

  GroupUserInfoCard? getMembershipById(
      UserMembershipData? membershipData, String membershipId) {
    return membershipData?.destinyMemberships?.firstWhere(
        (membership) => membership.membershipId == membershipId,
        orElse: () => membershipData.destinyMemberships!.first);
  }

  Future<void> saveMembership(
      UserMembershipData membershipData, String membershipId) async {
    currentMembership = getMembershipById(membershipData, membershipId);
    await StorageService.setLocalStorage(
        'membershipData', membershipData.toJson());
    await StorageService.setLocalStorage('membershipId', membershipId);
  }
}
