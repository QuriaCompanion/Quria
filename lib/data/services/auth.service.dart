import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:universal_io/io.dart';

import 'package:bungie_api/enums/bungie_membership_type.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quria/data/services/storage/storage.service.dart';
import 'package:uni_links/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:bungie_api/models/group_user_info_card.dart';
import 'package:bungie_api/helpers/bungie_net_token.dart';
import 'package:bungie_api/helpers/oauth.dart';
import 'package:bungie_api/models/user_membership_data.dart';

import 'bungie_api/bungie_api.service.dart';

bool initialLinkHandled = false;

class AuthService {
  late BungieNetToken? _currentToken;
  GroupUserInfoCard? _currentMembership;
  late UserMembershipData? _membershipData;
  bool waitingAuthCode = false;
  final Map<String, String> headers = {
    "Accept": "application/json",
    "Access-Control-Allow-Origin": "*"
  };

  final bungieUrl = "https://www.bungie.net/Platform/";

  late StreamSubscription<String?> linkStreamSub;

  static final AuthService _singleton = AuthService._internal();

  factory AuthService() {
    return _singleton;
  }
  AuthService._internal();

  Future<BungieNetToken?> _getStoredToken() async {
    StorageService storage = StorageService.account();
    var json = await storage.getJson(StorageKeys.latestToken);
    try {
      return BungieNetToken.fromJson(json);
    } catch (e) {
      print(
          "failed retrieving token for account: ${StorageService.getAccount()}");
      print(e);
    }
    return null;
  }

  Future<BungieNetToken> refreshToken(BungieNetToken token) async {
    BungieNetToken bNetToken =
        await BungieApiService().refreshToken(token.refreshToken);
    _saveToken(bNetToken);
    return bNetToken;
  }

  Future<void> _saveToken(BungieNetToken token) async {
    inspect(token);
    if (token.accessToken == null) {
      return;
    }
    await StorageService.setAccount(token.membershipId);
    StorageService storage = StorageService.account();
    await storage.setJson(StorageKeys.latestToken, token.toJson());
    await storage.setDate(StorageKeys.latestTokenDate, DateTime.now());
    await Future.delayed(const Duration(milliseconds: 1));
    _currentToken = token;
  }

  Future<BungieNetToken?> getToken() async {
    BungieNetToken? token = _currentToken;
    token ??= await _getStoredToken();
    if (token?.accessToken == null || token?.expiresIn == null) {
      return null;
    }
    DateTime now = DateTime.now();
    StorageService storage = StorageService.account();
    DateTime? savedDate = storage.getDate(StorageKeys.latestTokenDate);
    DateTime expire = savedDate!.add(Duration(seconds: token!.expiresIn));
    DateTime refreshExpire =
        savedDate.add(Duration(seconds: token.refreshExpiresIn));
    if (refreshExpire.isBefore(now)) {
      return null;
    }
    if (expire.isBefore(now)) {
      token = await refreshToken(token);
    }
    return token;
  }

  Future<BungieNetToken> requestToken(String code) async {
    final clientId = BungieApiService.clientId;
    final clientSecret = BungieApiService.clientSecret;
    final requestHeader = {"Content-Type": "application/x-www-form-urlencoded"};
    var token = await http.post(Uri.parse(bungieUrl + "App/OAuth/token/"),
        headers: requestHeader,
        encoding: Encoding.getByName('utf-8'),
        body: {
          "client_id": clientId,
          "client_secret": clientSecret,
          "grant_type": "authorization_code",
          "code": code
        });

    BungieNetToken response = BungieNetToken.fromJson(jsonDecode(token.body));
    await _saveToken(response);
    return response;
  }

  Future<String?> checkAuthorizationCode() async {
    Uri? uri;
    if (!initialLinkHandled) {
      uri = await getInitialUri();
      initialLinkHandled = true;
    }

    if (uri?.queryParameters == null) return null;
    print("initialURI: $uri");
    if (uri!.queryParameters.containsKey("code") ||
        uri.queryParameters.containsKey("error")) {
      closeWebView();
    }

    if (uri.queryParameters.containsKey("code")) {
      return uri.queryParameters["code"];
    } else {
      String? errorType = uri.queryParameters["error"];
      String errorDescription =
          uri.queryParameters["error_description"] ?? uri.toString();
      throw OAuthException(errorType!, errorDescription);
    }
  }

  Future<String> authorize([bool forceReauth = true]) async {
    var browser = BungieAuthBrowser();
    OAuth.openOAuth(browser, BungieApiService.clientId!, "fr", forceReauth);
    Stream<String?> _stream = linkStream;
    Completer<String> completer = Completer();

    linkStreamSub = _stream.listen((link) {
      Uri uri = Uri.parse(link!);
      if (uri.queryParameters.containsKey("code") ||
          uri.queryParameters.containsKey("error")) {
        closeWebView();
        linkStreamSub.cancel();
      }
      if (uri.queryParameters.containsKey("code")) {
        String? code = uri.queryParameters["code"];
        completer.complete(code);
      } else {
        String? errorType = uri.queryParameters["error"];
        String? errorDescription = uri.queryParameters["error_description"];
        try {
          throw OAuthException(errorType!, errorDescription!);
        } on OAuthException catch (e, stack) {
          completer.completeError(e, stack);
        }
      }
    });

    return completer.future;
  }

  Future<UserMembershipData?> updateMembershipData() async {
    UserMembershipData? membershipData =
        await BungieApiService().getMemberships();
    var storage = StorageService.account();
    await storage.setJson(StorageKeys.membershipData, membershipData);
    return membershipData;
  }

  Future<UserMembershipData?> getMembershipData() async {
    return _membershipData ?? await _getStoredMembershipData();
  }

  Future<UserMembershipData?> _getStoredMembershipData() async {
    var storage = StorageService.account();
    var json = await storage.getJson(StorageKeys.membershipData);
    if (json == null) {
      return null;
    }
    UserMembershipData membershipData = UserMembershipData.fromJson(json);
    return membershipData;
  }

  void reset() {
    _currentMembership = null;
    _currentToken = null;
    _membershipData = null;
  }

  Future<GroupUserInfoCard?> getMembership() async {
    if (_currentMembership == null) {
      var _membershipData = await _getStoredMembershipData();
      var _membershipId = StorageService.getMembership();
      _currentMembership = getMembershipById(_membershipData, _membershipId!);
    }
    if (_currentMembership?.membershipType ==
        BungieMembershipType.TigerBlizzard) {
      var account = StorageService.getAccount();
      StorageService.removeAccount(account);
      return null;
    }
    return _currentMembership;
  }

  GroupUserInfoCard? getMembershipById(
      UserMembershipData? membershipData, String membershipId) {
    return membershipData?.destinyMemberships?.firstWhere(
        (membership) => membership.membershipId == membershipId,
        orElse: () => membershipData.destinyMemberships!.first);
  }

  Future<void> saveMembership(
      UserMembershipData membershipData, String membershipId) async {
    StorageService storage = StorageService.account();
    _currentMembership = getMembershipById(membershipData, membershipId);
    storage.setJson(StorageKeys.membershipData, membershipData.toJson());
    StorageService.setMembership(membershipId);
  }

  bool get isLogged {
    return _currentMembership != null;
  }
}

class BungieAuthBrowser implements OAuthBrowser {
  BungieAuthBrowser() : super();

  @override
  dynamic open(String url) async {
    if (kIsWeb) {
      await launch(url);
    } else if (Platform.isIOS) {
      await launch(url,
          forceSafariVC: true, statusBarBrightness: Brightness.light);
    } else {
      await launch(url, forceSafariVC: true);
    }
  }
}
