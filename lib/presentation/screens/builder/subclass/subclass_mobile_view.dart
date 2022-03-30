import 'package:flutter/material.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';

class SubclassMobileView extends StatelessWidget {
  const SubclassMobileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return mobileHeader(context,
        image: subclassHeader,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textH1("Choisis ta doctrine"),
            textBodyRegular("Selectionne ta doctrine pour ton build."),
          ],
        ));
  }
}
