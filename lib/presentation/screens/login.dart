import 'dart:html' as html;
import 'dart:developer';
import 'package:bungie_api/helpers/bungie_net_token.dart';
import 'package:quria/data/services/bungie_api/account.service.dart';
import 'package:quria/presentation/var/routes.dart';
import 'package:uni_links/uni_links.dart';
import 'package:universal_io/io.dart';

import 'package:bungie_api/helpers/oauth.dart';
import 'package:bungie_api/models/group_user_info_card.dart';
import 'package:bungie_api/models/user_membership_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quria/data/services/auth.service.dart';
import 'package:quria/data/services/bungie_api/bungie_api.service.dart';
import 'package:quria/data/services/bungie_api/profile.service.dart';
import 'package:quria/presentation/components/misc/button.dart';

typedef LoginCallback = void Function(String code);
typedef SkipCallback = void Function();

class LoginWidget extends StatefulWidget {
  final String title = "Login";
  final BungieApiService api = BungieApiService();
  final AuthService auth = AuthService();
  final AccountService account = AccountService();
  final ProfileService profile = ProfileService();
  final LoginCallback? onLogin;
  final SkipCallback? onSkip;
  final bool forceReauth;

  LoginWidget({Key? key, this.onLogin, this.onSkip, this.forceReauth = true})
      : super(key: key);

  @override
  LoginWidgetState createState() => LoginWidgetState();
}

class LoginWidgetState extends State<LoginWidget> {
  @override
  void initState() {
    super.initState();
    getInitialUri().then((value) {
      if (!value.toString().contains('code=')) {
      } else {
        // You are connected, you can grab the code from the url.
        final fragments = value!.toString().split('=');
        authCode(fragments[1].replaceAll("#/", ""));
        Navigator.pushNamed(context, routeProfile);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              authorizeClick(context);
            },
            child:
                const Button(value: 'Se connecter', width: 250.0, height: 60),
          ),
          const SizedBox(
            height: 50.0,
          ),
          InkWell(
            onTap: () => yannisooLogin(),
            child: const Button(
                value: 'se connecter en temps que yannisoo',
                width: 250.0,
                height: 60),
          ),
        ],
      ),
    );
  }

  void authorizeClick(BuildContext context) async {
    try {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        String clientId = BungieApiService.clientId!;
        final authorizationEndpoint =
            "https://www.bungie.net/fr/OAuth/Authorize?client_id=$clientId&response_type=code";
        html.window.location.assign(authorizationEndpoint);
      });
    } on OAuthException catch (e) {
      bool isIOS = Platform.isIOS;
      String platformMessage =
          "If this keeps happening, please try to login with a mainstream browser.";
      if (isIOS) {
        platformMessage =
            "Please dont open the auth process in another safari window, this could prevent you from getting logged in.";
      }
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                actions: <Widget>[
                  MaterialButton(
                    textColor: Colors.blueGrey.shade300,
                    child: const Text("OK"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
                title: Text(e.error),
                content: Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      Text(
                        e.errorDescription ?? "error",
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        platformMessage,
                        textAlign: TextAlign.center,
                      )
                    ])),
              ));
    }
    WidgetsBinding.instance!.renderView.automaticSystemUiAdjustment = false;
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark));
  }

  authCode(String code) async {
    try {
      await widget.auth.requestToken(code);
      checkMembership();
    } catch (e) {
      inspect(e);
    }
  }

  void checkMembership() async {
    GroupUserInfoCard? membership = await widget.account.getMembership();
    if (membership == null) {
      showSelectMembership();
    }
    loadProfile();
  }

  loadProfile() async {
    await widget.profile.loadProfile();
  }

  void showSelectMembership() async {
    UserMembershipData? membershipData = await widget.api.getMemberships();

    if (membershipData?.destinyMemberships?.length == 1) {
      await widget.account.saveMembership(
          membershipData!, membershipData.destinyMemberships![0].membershipId!);
      await loadProfile();
    }
  }

  void yannisooLogin() async {
    final AuthService auth = AuthService();
    final AccountService account = AccountService();
    final ProfileService profile = ProfileService();
    BungieNetToken token = BungieNetToken.fromJson({
      'access_token':
          'CMraAxKGAgAg7dI+0TkMGh2uh5L3BF4tvx/zOmVisBiea6PBQf/lm4zgAAAAnCkNEwBf6Lsvtc6BbSSDmCObyW6vaLiISD453n7Fyy9nbQxiCwK5DqyxBCbsyjiEGe1OZBkiDKwQ345UObPGivziNHHOFaSo9tele6rSu8WqILkkfajnmABN5W3/VNHfkauDmocu4IPBa7ObnHwCQhJ3X0cshmisE+M5UqisIYy3ppOrfHqGnNxxsX5/P1LsjR0Vc8cd1W6eaDZoSAOHlMedKs/XkwIYPOUFcDQChqWk1JdxFaVJ/ycQCG641FDdnS6qfikNvgC6vwaZm6JkkxcrmBQMHNpcr40Z+IJ5oOo=',
      'expires_in': 3600,
      'refresh_token':
          'CMraAxKGAgAgQpzRp7QWUtRVShDD4ebDYWnMQVHHWl1dnZevpWwv6XPgAAAAyHZqrwzy3ymqmzQAKZY5kqYBEtfU1BPAJq19gbF486zsq+lWy3CfAwnra/Gpfg6TkjFonIaYpdbSFLdZ/ij+JWsiRefHapizhxjmztiCB2ML8mnhwMYu6Fnm0bOhkjvIq6kKuEkSR0b5Tk0UcvG/x+wPxWjQvBkakujHmzKaraUa+++wU/YuCP6ZuV9p60tXRS8s4PGKAV3RKHSppsC/pxYHs00lShOd/EJcA5jeCwC6pBFdbUv7mOuTaK4Nk/aQkCzuKJSI5GnawJCMw/VXkwHBAWwb9svUsIBOygOXO0o=',
      'refresh_expires_in': 3600,
      'membership_id': '11319478',
    });

    if (await auth.getToken() == null) await auth.saveToken(token);
    await account.getMembership();
    await profile.loadProfile();
    Navigator.pushNamed(context, routeProfile);
  }
}
