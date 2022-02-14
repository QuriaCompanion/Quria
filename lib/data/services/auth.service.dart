import 'dart:async';
import 'package:quria/data/services/bungie_api/account.service.dart';
import 'package:universal_io/io.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quria/data/services/storage/storage.service.dart';
import 'package:uni_links/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:bungie_api/models/group_user_info_card.dart';
import 'package:bungie_api/helpers/bungie_net_token.dart';
import 'package:bungie_api/helpers/oauth.dart';

import 'bungie_api/bungie_api.service.dart';

bool initialLinkHandled = false;

class AuthService {
  BungieNetToken? _currentToken;
  GroupUserInfoCard? _currentMembership;
  static final AccountService accountService = AccountService();

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
    var json = await StorageService.getLocalStorage('bungie_token');
    try {
      return BungieNetToken.fromJson(json);
    } catch (e) {
      print("failed retrieving token ");
      return null;
    }
  }

  Future<void> _setStoredToken(BungieNetToken token) async {
    print(token.accessToken);
    await StorageService.setLocalStorage('bungie_token', token);
    await StorageService.setLocalStorage('last_refresh', "${DateTime.now()}");
  }

  Future<BungieNetToken> refreshToken(BungieNetToken token) async {
    BungieNetToken bNetToken =
        await BungieApiService().refreshToken(token.refreshToken);
    saveToken(bNetToken);
    return bNetToken;
  }

  Future<void> saveToken(BungieNetToken token) async {
    await accountService.setCurrentMembershipId(token.membershipId);
    await _setStoredToken(token);
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
    String? savedString = await StorageService.getLocalStorage('last_refresh');
    DateTime savedDate = DateTime.parse(savedString!);
    DateTime expire = savedDate.add(Duration(seconds: token!.expiresIn));
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
    BungieNetToken token = await BungieApiService().requestToken(code);
    await saveToken(token);
    return token;
  }

  Future<String?> checkAuthorizationCode() async {
    Uri? uri;
    if (!initialLinkHandled) {
      uri = await getInitialUri();
      initialLinkHandled = true;
    }

    if (uri?.queryParameters == null) return null;
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
