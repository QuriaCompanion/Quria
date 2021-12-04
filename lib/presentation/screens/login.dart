// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:developer';
import 'package:quria/data/services/bungie_api/account.service.dart';
import 'package:universal_io/io.dart';

import 'package:bungie_api/helpers/bungie_net_token.dart';
import 'package:bungie_api/helpers/oauth.dart';
import 'package:bungie_api/models/group_user_info_card.dart';
import 'package:bungie_api/models/user_membership_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quria/data/services/auth.service.dart';
import 'package:quria/data/services/bungie_api/bungie_api.service.dart';
import 'package:quria/data/services/bungie_api/profile.service.dart';
import 'package:quria/presentation/components/button.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
              onTap: () => Navigator.pushNamed(context, "/logged"),
              child:
                  const Button(value: 'Go to home', width: 250.0, height: 60),
            ),
          ],
        ),
      ),
    );
  }

  void authorizeClick(BuildContext context) async {
    try {
      String code = await widget.auth.authorize(widget.forceReauth);
      inspect(code);
      authCode(code);
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
      BungieNetToken token = await widget.auth.requestToken(code);
      checkMembership();
    } catch (e, stackTrace) {
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
    await widget.profile.loadFromCache();
  }

  void showSelectMembership() async {
    UserMembershipData? membershipData = await widget.api.getMemberships();

    if (membershipData?.destinyMemberships?.length == 1) {
      await widget.account.saveMembership(
          membershipData!, membershipData.destinyMemberships![0].membershipId!);
      await loadProfile();
    }
  }
}
