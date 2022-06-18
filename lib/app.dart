import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';

import 'misc/desktop_components/scaffold_navbar.dart';

class AppView extends StatefulWidget {
  final Widget child;

  const AppView({required this.child, Key? key}) : super(key: key);

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        systemNavigationBarColor: blackLight,
        systemNavigationBarIconBrightness: Brightness.light));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ManifestService.language = AppLocalizations.of(context)!.localeName;
    if (vw(context) > 1000) {
      return ScaffoldNavBar(
        child: Text('test'),
      );
    }
    return Container(
      decoration: blackBackground,
      child: widget.child,
    );
  }
}
