import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/presentation/components/misc/mobile_components/burger.dart';
import 'package:quria/presentation/components/misc/rounded_button.dart';

class ScaffoldSteps<T> extends StatelessWidget {
  final Widget body;
  final String route;
  final String? previousRoute;
  const ScaffoldSteps({
    required this.body,
    required this.route,
    this.previousRoute,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Burger(),
      extendBodyBehindAppBar: true,
      backgroundColor: black,
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return InkWell(
              onTap: () => Scaffold.of(context).openDrawer(),
              child: Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top + globalPadding(context),
                ),
                child: SizedBox(
                  width: appBarItem(context),
                  height: appBarItem(context),
                  child: SvgPicture.asset(
                    "assets/icons/Menu.svg",
                    color: Colors.white,
                  ),
                ),
              ),
            );
          },
        ),
        flexibleSpace: SizedBox(
          width: vw(context),
          height: appBarHeight(context),
          child: ClipRect(
              child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: SizedBox(width: vw(context), height: appBarHeight(context)),
          )),
        ),
        backgroundColor: Colors.transparent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.all(globalPadding(context)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: () {
                previousRoute == null ? Navigator.pop(context) : Navigator.pushNamed(context, previousRoute!);
              },
              child: const Icon(
                Icons.chevron_left_rounded,
                color: black,
                size: 35,
              ),
            ),
            RoundedButton(
                text: textBodyBold(
                  AppLocalizations.of(context)!.next,
                  utf8: false,
                  color: black,
                ),
                width: 200,
                height: 56,
                onPressed: () => Navigator.pushNamed(context, route)),
          ],
        ),
      ),
      body: Container(
        decoration: blackBackground,
        child: SingleChildScrollView(
          child: body,
        ),
      ),
    );
  }
}
