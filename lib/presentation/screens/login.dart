// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:io';

import 'package:bungie_api/helpers/oauth.dart';
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

  void authorizeClick(BuildContext context) async {
    try {
      String code = await widget.auth.authorize(widget.forceReauth);
      widget.onLogin!(code);
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
            value: 'logian',
          ),
        ),
      ),
    );
  }
}
