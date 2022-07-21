import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/presentation/components/misc/loader.dart';

class PageLoader extends StatelessWidget {
  final bool isBuilderWeb;
  const PageLoader({
    Key? key,
    this.isBuilderWeb = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: vh(context),
      width: vw(context),
      decoration: BoxDecoration(
          image:
              DecorationImage(fit: BoxFit.cover, image: vw(context) < 1000 ? splashBackground : splashBackgroundWeb)),
      child: Column(
        children: [
          Loader(
            splashColor: Colors.transparent,
            animationSize: vw(context) * 0.5,
          ),
          if (isBuilderWeb) textH1(AppLocalizations.of(context)!.desktop_ghost_1, utf8: false),
          if (isBuilderWeb) textH1(AppLocalizations.of(context)!.desktop_ghost_2, utf8: false)
        ],
      ),
    );
  }
}
