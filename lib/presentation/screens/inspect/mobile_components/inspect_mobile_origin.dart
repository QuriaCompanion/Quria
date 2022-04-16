import 'package:flutter/material.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';

class InspectMobileOrigin extends StatelessWidget {
  final int? collectionHash;
  const InspectMobileOrigin({required this.collectionHash, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String source = ManifestService.manifestParsed
            .destinyCollectibleDefinition[collectionHash]?.sourceString ??
        "source inconnu";
    return textBodyRegular(source);
  }
}
