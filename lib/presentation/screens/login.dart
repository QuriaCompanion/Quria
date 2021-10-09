// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:developer';
import 'dart:io';

import 'package:bungie_api/helpers/bungie_net_token.dart';
import 'package:bungie_api/helpers/oauth.dart';
import 'package:bungie_api/models/group_user_info_card.dart';
import 'package:bungie_api/models/user_membership_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quria/data/services/auth.service.dart';
import 'package:quria/data/services/bungie_api/bungie_api.service.dart';
import 'package:quria/presentation/components/Header/button.dart';
import 'package:url_launcher/url_launcher.dart';

typedef LoginCallback = void Function(String code);
typedef SkipCallback = void Function();

class LoginWidget extends StatefulWidget {
  final String title = "Login";
  final BungieApiService api = BungieApiService();
  final AuthService auth = AuthService();
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
      appBar: AppBar(
        title: const Text("QuriaCompanion"),
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            authorizeClick(context);
          },
          child: Button(
            value: 'logan',
          ),
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
      print("ba");
      BungieNetToken token = await widget.auth.requestToken(code);
      print("da");
      print(token.accessToken);
    } catch (e, stackTrace) {
      print("dooup");
      inspect(e);
    }
  }

  // checkMembership() async {
  //   GroupUserInfoCard? membership = await widget.auth.getMembership();
  //   if (membership == null) {
  //     return showSelectMembership();
  //   }
  //   return loadProfile();
  // }

  // loadProfile() async {
  //   await widget.auth.loadFromCache();
  // }

  // showSelectMembership() async {
  //   UserMembershipData membershipData =
  //       await this.widget.apiService.getMemberships();

  //   if (membershipData?.destinyMemberships?.length == 1) {
  //     await this.widget.auth.saveMembership(
  //         membershipData, membershipData?.destinyMemberships[0].membershipId);
  //     await loadProfile();
  //     return;
  //   }

  //   SelectPlatformWidget widget = SelectPlatformWidget(
  //       membershipData: membershipData,
  //       onSelect: (String membershipId) async {
  //         if (membershipId == null) {
  //           this.showLogin();
  //           return;
  //         }
  //         await this.widget.auth.saveMembership(membershipData, membershipId);
  //         await loadProfile();
  //       });
  //   this.changeContent(widget, widget.title);
  // }
}
