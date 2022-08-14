import 'package:bungie_api/models/group_user_info_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:collection/collection.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/services/storage/storage.service.dart';
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
import 'package:webview_flutter/webview_flutter.dart';

class LoginWidget extends StatefulWidget {
  final String title = "Login";
  final BungieApiService api = BungieApiService();
  final bool forceReauth;
  LoginWidget({Key? key, this.forceReauth = true}) : super(key: key);

  @override
  LoginWidgetState createState() => LoginWidgetState();
}

class LoginWidgetState extends State<LoginWidget> {
  @override
  void initState() {
    super.initState();
    getInitialUri().then((Uri? uri) {
      AuthService.getToken().then((value) async {
        String? storedUri = await StorageService.getLocalStorage("initUri");
        StorageService.removeLocalStorage("initUri");
        Uri? previousUri;
        if (storedUri != null) {
          previousUri = Uri.parse(storedUri);
        }
        if (value != null) {
          await checkMembership();
          if (!mounted) return;
          inspect(uri?.path);

          if (uri?.queryParameters["buildId"] != null || previousUri?.queryParameters["buildId"] != null) {
            Navigator.pushReplacementNamed(context, routeForeignBuild,
                arguments: uri?.queryParameters["buildId"] ?? previousUri?.queryParameters["buildId"]);
            return;
          } else {
            Navigator.pushReplacementNamed(context, routeProfile);
            return;
          }
        }
      });
      if (uri.toString().contains('code=')) {
        // You are connected, you can grab the code from the url.
        final fragments = uri!.toString().split('=');
        authCode(fragments[1].replaceAll("#/", ""));
        return;
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
              loadingModal();
              authorizeClick(context);
              // yannisooLogin();
            },
            width: 250.0,
            height: 60),
      ),
      body: Container(
        decoration: BoxDecoration(
            image:
                DecorationImage(fit: BoxFit.cover, image: vw(context) < 1000 ? splashBackground : splashBackgroundWeb)),
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
    final authorizationEndpoint =
        "https://www.bungie.net/$lang/OAuth/Authorize?client_id=${BungieApiService.clientId}&response_type=code&reauth=true";
    if (kIsWeb) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        html.window.location.assign(authorizationEndpoint);
      });
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return WebView(
              initialUrl: authorizationEndpoint,
              javascriptMode: JavascriptMode.unrestricted,
              navigationDelegate: (NavigationRequest request) {
                final uri = Uri.parse(request.url);
                inspect(uri);
                if (uri.scheme == "quria") {
                  if (uri.queryParameters.containsKey("code")) {
                    authCode(uri.queryParameters["code"]!);
                    Navigator.pop(context);
                  } else {
                    String? errorType = uri.queryParameters["error"];
                    String? errorDescription = uri.queryParameters["error_description"];
                    try {
                      throw OAuthException(errorType!, errorDescription!);
                    } on OAuthException catch (_) {
                      rethrow;
                    }
                  }
                  Navigator.pop(context);
                }
                return NavigationDecision.navigate;
              },
            );
          });
    }
  }

  void authorizeClick(BuildContext context) async {
    final Uri? uri = await getInitialUri();
    await StorageService.setLocalStorage("initUri", uri.toString());
    if (!mounted) return;
    try {
      try {
        try {
          if (await AuthService.getToken() != null) {
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
        String platformMessage = "If this keeps happening, please try to login with a mainstream browser.";
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
      SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarBrightness: Brightness.dark));
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
      await AuthService.requestToken(code);
      checkMembership();
    } catch (e) {
      inspect(e);
    }
  }

  Future<void> checkMembership() async {
    GroupUserInfoCard? membership = await AccountService.getMembership();
    if (membership == null) {
      UserMembershipData? membershipData = await widget.api.getMemberships();
      if (membershipData?.destinyMemberships?.firstWhereOrNull((element) => element.crossSaveOverride != null) ==
              null &&
          membershipData?.destinyMemberships?.length != 1) {
        return chooseMembership(membershipData);
      }
      String membershipId = membershipData?.destinyMemberships
              ?.firstWhereOrNull((element) => element.crossSaveOverride == element.membershipType)
              ?.membershipId ??
          membershipData!.destinyMemberships!.firstWhere((element) => element.membershipId != null).membershipId!;

      await AccountService.saveMembership(membershipData!, membershipId);
    }
    final previousUri = await StorageService.getLocalStorage("initUri");
    StorageService.removeLocalStorage("initUri");
    if (!mounted) return;
    if (previousUri != null) {
      final uri = Uri.parse(previousUri);
      inspect(uri);
      if (uri.queryParameters["buildId"] != null) {
        Navigator.pushReplacementNamed(context, routeForeignBuild, arguments: previousUri!.queryParameters["buildId"]);
        return;
      }
    }
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
                onSelected: (membership) async {
                  Navigator.of(context).pop();
                  AccountService.saveMembership(membershipData, membership);
                  final previousUri = await StorageService.getLocalStorage("initUri");
                  StorageService.removeLocalStorage("initUri");
                  final uri = Uri.parse(previousUri);
                  inspect(uri);
                  if (!mounted) return;
                  if (previousUri?.queryParameters["buildId"] != null) {
                    Navigator.pushReplacementNamed(context, routeForeignBuild,
                        arguments: previousUri!.queryParameters["buildId"]);
                    return;
                  } else {
                    Navigator.pushReplacementNamed(context, routeProfile);
                    return;
                  }
                });
          });
    } catch (_) {
      rethrow;
    }
  }

  void yannisooLogin() async {
    BungieNetToken token = BungieNetToken.fromJson({
      "access_token":
          "CN6bBBKGAgAgrMvDXdyzZdbiJQpJq3PPaAgnomvuvk/sZTE81r5NwQDgAAAAfJ2CwAxczR6rHddngJLwbD8nvwq1213DL0oLf6CeK1ewuW0G+Oj3loygH8qq41cWWJrF/S+1ltf7FEY9d+CTiCUs/8/awMAE9AWzGBflsIkU+Aa639TOuK2bGSkm+HSav3as/9R3KbDffyoSj0uZn+s6Qd9lh+ZipWQ3TbywgfZNREC/qlVKV/JteYxzd/tuMmYE0E1EGF+bhJLWLKMxuQ9juylnOCzN+vXPkuViMsTTa3Y9eq7qoUUBLT9Byu33PgSF192J/8kVRD8Amo2cvgJGBSNtoJ9VQZZvft7UTpw=",
      "expires_in": 3600,
      "refresh_token":
          "CN6bBBKGAgAghmsxbN/teX84tgAibAWEI1ayyKQUBX1TEqSW/QAfYo/gAAAAXcP0jUBlvIrp54HJMFpwpfGdAa64YywQSfNBqvqnkhGMaP11naqRVO0XN7luccMHWxp7uUvhQot9FFx2MVkz1xPmpaGQaIC6ucX8LlxNETyjb1VSe7yyNEV4E6PQe1TG4PW+mDj79h49ZjCgp34lTCcprQD1t+OBaxwyeLMeF38U/TOifuHrTTgmm5QtvtXsVxjAABF7LanPEoaXENPuN69B+VQQcuVA4kCFXtvg37EmBZnQzelWZffTOIY80KlZFu+3YE7cOyy7UoeyI63KIBes6kFInvoPa8jTKltrmmo=",
      "refresh_expires_in": 7776000,
      "membership_id": "11319478"
    });

    if (await AuthService.getToken() == null) {
      await AuthService.saveToken(token);
    }
    await AccountService.getMembership();
    if (!mounted) return;
    Navigator.pushReplacementNamed(context, routeProfile);
  }
}
