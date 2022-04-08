import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/presentation/components/misc/mobile_components/burger.dart';
import 'package:quria/presentation/components/misc/rounded_button.dart';

class ScaffoldSteps<T> extends StatelessWidget {
  final Widget body;
  final String route;
  final T arguments;
  const ScaffoldSteps(
      {required this.body,
      required this.route,
      required this.arguments,
      Key? key})
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.all(globalPadding(context)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              backgroundColor: blackLight,
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            RoundedButton(
                text: textBodyBold('Suivant', color: black),
                width: 200,
                height: 50,
                onPressed: () =>
                    Navigator.pushNamed(context, route, arguments: arguments)),
          ],
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
