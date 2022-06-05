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

  void redirect() async {
    if (kIsWeb) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        String clientId = BungieApiService.clientId!;
        final authorizationEndpoint =
            "https://www.bungie.net/fr/OAuth/Authorize?client_id=$clientId&response_type=code";
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
          redirect();
        }
        redirect();
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
          "CJuVBBKGAgAgIBzh0g5Snr7GGWorsznREcBvQiZkrfI9lblhLh8dJV7gAAAAwXukbO5Hs3OnuYyeO7vUmpJGlKrqOtkhARN28AOsfYrle/j+kYJg93LGmKuEVy3wTTNJNBoYAnJ9hhhMivhi3l46l+jXBN8bJA0DDFUmX0SFOzhihjovUN8Zv8w8MOL4d1wkD+KH6kfgA8DIcCESA74USgTGu2j+yaG0wSsnxHkQo4u9iKSL8U/QaM6+C7vt2WIX5RXS5Idm0KrOXJmc6mjYD3l40KWsz2GoDfAf2xV4KwrCdx37mkxwankWUPWIRd7lz+EkVagx4rOz5p5nBGXXFSWnVqSF3e007d0KECc=",
      "expires_in": 3600,
      "refresh_token":
          "CJuVBBKGAgAgo/eRoMfrUl4/Dntfyj+Wx6H0sfOIb6tLeX9pEmzUWS3gAAAAjygPOsim+PmUG0IrLana5NK0TN6Cmks6evZ5XfYQpNoRMYWRN290oEW7E/zHqQ2T1OjeIw9LTgOmdn6/hfvK1p9Qn/TPgb/IBE8KmxJMoYf9WbFAw8JZAHPufiyX9PKAIEE6eyjNmGm4wjiUxVCusHIccdVW94sNRhRwHxTzCk92bfai/GVrhh8fxT+qwDhzQp4Yvs/NZQ3001ivJIZKp1QZiAtC+TlKhA1gkqK99kKwLMoDy/wegmtpSuoIF3qw/KAUoLCzGztojxdLDBa3VFwKiKWU6bH3KeuYqTf6vS4=",
      "refresh_expires_in": 7776000,
      "membership_id": "5699852"
    });

    if (await auth.getToken() == null) await auth.saveToken(token);
    await account.getMembership();
    if (!mounted) return;
    Navigator.pushReplacementNamed(context, routeProfile);
  }
}
