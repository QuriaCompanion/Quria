import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';

class ScaffoldBase extends StatelessWidget {
  final Widget body;
  const ScaffoldBase({required this.body, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: black,
      appBar: AppBar(
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
      body: Container(
        decoration: ghostBackground,
        child: SingleChildScrollView(
          child: body,
        ),
      ),
    );
  }
}
