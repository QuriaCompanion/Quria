import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/presentation/components/misc/mobile_components/burger.dart';

class ScaffoldBurgerAndBackOption extends StatelessWidget {
  final Widget body;
  final double width;
  final String? previousRoute;
  const ScaffoldBurgerAndBackOption({
    required this.body,
    required this.width,
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
          width: width,
          height: appBarHeight(context),
          child: ClipRect(
              child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: SizedBox(width: width, height: appBarHeight(context)),
          )),
        ),
        backgroundColor: Colors.transparent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: globalPadding(context)),
        child: FloatingActionButton(
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
      ),
      body: Container(
        decoration: blackBackground,
        child: SingleChildScrollView(
            child: Column(
          children: [
            body,
            SizedBox(height: 56 + globalPadding(context) * 2),
          ],
        )),
      ),
    );
  }
}
