import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/presentation/components/misc/loader.dart';

class ManifestLoader extends StatefulWidget {
  const ManifestLoader({Key? key}) : super(key: key);

  @override
  State<ManifestLoader> createState() => _ManifestLoaderState();
}

class _ManifestLoaderState extends State<ManifestLoader> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: vh(context),
        width: vw(context),
        decoration: const BoxDecoration(
            image: DecorationImage(fit: BoxFit.cover, image: splashBackground)),
        child: Loader(
          splashColor: Colors.transparent,
          animationSize: vw(context) * 0.5,
        ));
  }
}
