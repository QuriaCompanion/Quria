import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/presentation/components/misc/loader.dart';

class PageLoader extends StatelessWidget {
  const PageLoader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: vh(context),
      width: vw(context),
      decoration: BoxDecoration(
          image:
              DecorationImage(fit: BoxFit.cover, image: vw(context) < 1000 ? splashBackground : splashBackgroundWeb)),
      child: Loader(
        splashColor: Colors.transparent,
        animationSize: vw(context) * 0.5,
      ),
    );
  }
}
