import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/presentation/components/misc/mobile_components/burger.dart';

class ScaffoldBurgerAndBackOption extends StatelessWidget {
  final Widget body;
  const ScaffoldBurgerAndBackOption({required this.body, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Burger(),
      extendBodyBehindAppBar: true,
      backgroundColor: black,
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
            alignment: Alignment.center,
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          );
        }),
        flexibleSpace: SizedBox(
          width: vw(context),
          height: appBarHeight(context),
          child: ClipRect(
              child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          )),
        ),
        backgroundColor: Colors.transparent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.all(globalPadding(context)),
        child: FloatingActionButton(
          backgroundColor: blackLight,
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        decoration: ghostBackground,
        child: SingleChildScrollView(
          child: body,
        ),
      ),
    );
  }
}
