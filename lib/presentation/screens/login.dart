import 'package:bungie_api/models/group_user_info_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:collection/collection.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/presentation/components/misc/choose_membership.dart';
import 'package:quria/presentation/components/misc/error_dialog.dart';
import 'package:quria/presentation/components/misc/mobile_components/loading_modal.dart';
import 'package:quria/presentation/components/misc/rounded_button.dart';
import "package:universal_html/html.dart" as html;
import 'dart:developer';
import 'package:bungie_api/helpers/bungie_net_token.dart';
import 'package:quria/data/services/bungie_api/account.service.dart';
import 'package:quria/presentation/var/routes.dart';
import 'package:uni_links/uni_links.dart';
import 'package:universal_io/io.dart';

import 'package:bungie_api/helpers/oauth.dart';
import 'package:bungie_api/models/user_membership_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quria/data/services/auth.service.dart';
import 'package:quria/data/services/bungie_api/bungie_api.service.dart';
import 'package:quria/data/services/bungie_api/profile.service.dart';

class LoginWidget extends StatefulWidget {
  final String title = "Login";
  final BungieApiService api = BungieApiService();
  final AuthService auth = AuthService();
  final AccountService account = AccountService();
  final ProfileService profile = ProfileService();
  final bool forceReauth;

  LoginWidget({Key? key, this.forceReauth = true}) : super(key: key);

  @override
  LoginWidgetState createState() => LoginWidgetState();
}

class LoginWidgetState extends State<LoginWidget> {
  @override
  void initState() {
    super.initState();
    widget.auth.getToken().then((value) => {
          if (value != null) {checkMembership()}
        });

    getInitialUri().then((value) {
      if (!value.toString().contains('code=')) {
      } else {
        // You are connected, you can grab the code from the url.
        final fragments = value!.toString().split('=');
        authCode(fragments[1].replaceAll("#/", ""));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: globalPadding(context) * 2),
        child: RoundedButton(
            text: textBodyBold(
              AppLocalizations.of(context)!.login,
              utf8: false,
              color: black,
            ),
            onPressed: () {
              // loadingModal();
              // authorizeClick(context);
              yannisooLogin();
            },
            width: 250.0,
            height: 60),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(fit: BoxFit.cover, image: splashBackground)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                textQuria("QURIA"),
                SvgPicture.asset(
                  "assets/img/Quria.svg",
                  width: 50,
                  height: 50,
                )
              ],
            ),
            textCompanion("D2 COMPANION"),
            SizedBox(
              width: vw(context) * 0.4,
              child: Divider(
                height: globalPadding(context) * 2.5,
                color: Colors.white,
              ),
            ),
            textConnect(
              AppLocalizations.of(context)!.login_splash,
              utf8: false,
            ),
          ],
        ),
      ),
    );
  }

  void redirect(String lang) async {
    if (kIsWeb) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        String clientId = BungieApiService.clientId!;
        final authorizationEndpoint =
            "https://www.bungie.net/$lang/OAuth/Authorize?client_id=$clientId&response_type=code";
        html.window.location.assign(authorizationEndpoint);
      });
    } else {
      String code = await widget.auth.authorize(widget.forceReauth);
      authCode(code);
    }
  }

  void authorizeClick(BuildContext context) async {
    try {
      try {
        try {
          if (await widget.auth.getToken() != null) {
            return checkMembership();
          }
        } catch (_) {
          redirect(AppLocalizations.of(context)!.localeName);
        }
        if (!mounted) return;
        redirect(AppLocalizations.of(context)!.localeName);
      } on OAuthException catch (e) {
        Navigator.of(context).pop();
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
      WidgetsBinding.instance.renderView.automaticSystemUiAdjustment = false;
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark));
    } catch (_) {
      Navigator.of(context).pop();
      showDialog(
          context: context,
          builder: (context) {
            return const ErrorDialog();
          });
    }
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
      UserMembershipData? membershipData = await widget.api.getMemberships();
      if (membershipData?.destinyMemberships?.firstWhereOrNull(
                  (element) => element.crossSaveOverride != null) ==
              null &&
          membershipData?.destinyMemberships?.length != 1) {
        return chooseMembership(membershipData);
      }
      String membershipId = membershipData?.destinyMemberships
              ?.firstWhereOrNull((element) =>
                  element.crossSaveOverride == element.membershipType)
              ?.membershipId ??
          membershipData!.destinyMemberships!
              .firstWhere((element) => element.membershipId != null)
              .membershipId!;

      await widget.account.saveMembership(membershipData!, membershipId);
    }
    if (!mounted) return;
    Navigator.pushReplacementNamed(context, routeProfile);
  }

  void loadingModal() {
    showMaterialModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isDismissible: false,
        expand: false,
        builder: (context) {
          return LoadingModal(
            text1: AppLocalizations.of(context)!.logging_in,
            text2: AppLocalizations.of(context)!.please_wait,
          );
        });
  }

  void chooseMembership(UserMembershipData? membershipData) {
    try {
      showDialog(
          context: context,
          builder: (context) {
            return ChooseMembership(
                memberships: membershipData!.destinyMemberships!,
                onSelected: (membership) {
                  Navigator.of(context).pop();
                  widget.account.saveMembership(membershipData, membership);
                  Navigator.pushReplacementNamed(context, routeProfile);
                  return;
                });
          });
    } catch (_) {
      rethrow;
    }
  }

  void yannisooLogin() async {
    final AuthService auth = AuthService();
    final AccountService account = AccountService();
    BungieNetToken token = BungieNetToken.fromJson({
      "access_token":
          "CLuaBBKGAgAgkSHAaW3wyFmGq7NpPkZCAkSpsikPNDT3Mg2KVhQt/4ngAAAAIk52t87yikuxdY01Dwv/SVBH5IAyHlSnnN+th8FKu1cbUNNnAttLKQ7ogvjR2vlJZ2ckDzP7O1GwD3TCPgAgk2RC2h2pAm1QlSzDzGyNb3HrA1bSVAuzCa2JNUFiOgeDaivuXovJfE63IXLOppYJi18OEH+xwEqoi5GjGuTJAivQgCfJfUUiuwQCMfUQ7uKuOYEbiowebL+zJeniwhWvnGHb78paEo/8hSu0oT4N64bCSQuNAasmEHc7H4QbN6LYb0iA+XJyGzpRr/3DHrmQnI1ZbAICDnvs9Em1p/ZKRkk=",
      "expires_in": 3600,
      "refresh_token":
          "CLuaBBKGAgAg4Lt9PwgTeCL+cabNFbU0+3fF9LEqZRHq0ly1DLoSFlLgAAAAe8btOzwrjGu3D27P7cw/Zk0iRXdT25aeMu1LJb/7P0M4b/QIa0w2X7xNZipAnuc8XU2LWRUGWoYNL0Tx68kqAouZmijphRvg8OwckCPbt13XkxauuWhcmEeh/NeEAZtBwp3Ot+4I2vDE9U91H1Hm7D8BHHm8F9HoBjAa2Z8I3A4edMClY4EYXKtyxzEPJy1hbkAc2+HtsbxXQnDLAAJAl/ddKJx8x6GYCi5kWFrwUrCN9Lx5RmaeC5GMh3L45Bp7CkogdoonUty75yqj02sSkUVLh3XngG4prDpm85oxg/o=",
      "refresh_expires_in": 7776000,
      "membership_id": "11319478"
    });

    if (await auth.getToken() == null) await auth.saveToken(token);
    await account.getMembership();
    if (!mounted) return;
    Navigator.pushReplacementNamed(context, routeProfile);
  }
}
