import 'dart:async';
import 'package:quria/data/services/bungie_api/account.service.dart';
import 'package:quria/data/services/storage/storage.service.dart';
import 'package:uni_links/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:bungie_api/models/group_user_info_card.dart';
import 'package:bungie_api/helpers/bungie_net_token.dart';
import 'package:bungie_api/helpers/oauth.dart';

import 'bungie_api/bungie_api.service.dart';

bool initialLinkHandled = false;

class AuthService {
  static BungieNetToken? _currentToken;
  static GroupUserInfoCard? _currentMembership;
  static bool waitingAuthCode = false;
  final Map<String, String> headers = {"Accept": "application/json", "Access-Control-Allow-Origin": "*"};

  static const bungieUrl = "https://www.bungie.net/Platform/";
  static late StreamSubscription<Uri?> linkStreamSub;

  static final AuthService _singleton = AuthService._internal();

  factory AuthService() {
    return _singleton;
  }
  AuthService._internal();

  static Future<BungieNetToken?> _getStoredToken() async {
    var json = await StorageService.getLocalStorage('bungie_token');
    if (json == null) return null;
    return BungieNetToken.fromJson(json);
  }

  static Future<void> _setStoredToken(BungieNetToken token) async {
    await StorageService.setLocalStorage('bungie_token', token);
    await StorageService.setLocalStorage('last_refresh', "${DateTime.now()}");
  }

  static Future<BungieNetToken> refreshToken(BungieNetToken token) async {
    BungieNetToken bNetToken = await BungieApiService().refreshToken(token.refreshToken);
    saveToken(bNetToken);
    return bNetToken;
  }

  static Future<void> saveToken(BungieNetToken token) async {
    await AccountService.setCurrentMembershipId(token.membershipId);
    await _setStoredToken(token);
    await Future.delayed(const Duration(milliseconds: 1));
    _currentToken = token;
  }

  static Future<BungieNetToken?> getToken() async {
    BungieNetToken? token = _currentToken;
    token ??= await _getStoredToken();
    if (token?.accessToken == null || token?.expiresIn == null) {
      return null;
    }

    DateTime now = DateTime.now();
    String? savedString = await StorageService.getLocalStorage('last_refresh');
    DateTime savedDate = DateTime.parse(savedString!);
    DateTime expire = savedDate.add(Duration(seconds: token!.expiresIn));
    DateTime refreshExpire = savedDate.add(Duration(seconds: token.refreshExpiresIn));
    if (refreshExpire.isBefore(now)) {
      return null;
    }
    if (expire.isBefore(now)) {
      token = await refreshToken(token);
    }
    return token;
  }

  static Future<void> removeToken() async {
    _currentToken = null;
    await StorageService.removeLocalStorage('bungie_token');
  }

  static Future<BungieNetToken> requestToken(String code) async {
    BungieNetToken token = await BungieApiService().requestToken(code);
    await saveToken(token);
    return token;
  }

  static Future<String?> checkAuthorizationCode() async {
    Uri? uri;
    if (!initialLinkHandled) {
      uri = await getInitialUri();
      initialLinkHandled = true;
    }

    if (uri?.queryParameters == null) return null;
    if (uri!.queryParameters.containsKey("code") || uri.queryParameters.containsKey("error")) {
      closeInAppWebView();
    }

    if (uri.queryParameters.containsKey("code")) {
      return uri.queryParameters["code"];
    } else {
      String? errorType = uri.queryParameters["error"];
      String errorDescription = uri.queryParameters["error_description"] ?? uri.toString();
      throw OAuthException(errorType!, errorDescription);
    }
  }

  static bool get isLogged {
    return _currentMembership != null;
  }
}
