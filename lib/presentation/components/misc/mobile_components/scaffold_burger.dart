import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/presentation/components/misc/mobile_components/burger.dart';

class ScaffoldBurger extends StatelessWidget {
  final Widget body;
  const ScaffoldBurger({required this.body, Key? key}) : super(key: key);

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
      body: Container(
        decoration: blackBackground,
        child: SingleChildScrollView(
          child: body,
        ),
      ),
    );
  }
}
