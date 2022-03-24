import 'package:flutter/material.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';

class MobileItemOrigin extends StatelessWidget {
  final int collectionHash;
  const MobileItemOrigin({required this.collectionHash, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String source = ManifestService.manifestParsed
            .destinyCollectibleDefinition?[collectionHash]?.sourceString ??
        "source inconnu";
    return mobileSection(
      context,
      title: 'Obtention',
      children: [
        textBodyRegular(source),
        const Divider(
          color: blackLight,
          height: 22,
          thickness: 1,
        ),
      ],
    );
  }
}
