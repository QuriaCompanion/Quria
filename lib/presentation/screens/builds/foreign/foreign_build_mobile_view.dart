import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/BuildStored.model.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/bungie_api/enums/inventory_bucket_hash.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/screens/builds/foreign/foreign_build_mobile_actions.dart';
import 'package:quria/presentation/screens/builds/foreign/foreign_build_section.dart';

class ForeignBuildMobileView extends StatefulWidget {
  final BuildStored foreignBuild;
  const ForeignBuildMobileView({Key? key, required this.foreignBuild}) : super(key: key);

  @override
  State<ForeignBuildMobileView> createState() => _ForeignBuildMobileViewState();
}

class _ForeignBuildMobileViewState extends State<ForeignBuildMobileView> {
  DestinyInventoryItemDefinition? subclass;
  @override
  void initState() {
    super.initState();
    final int? subclassHash = widget.foreignBuild.items
        .firstWhereOrNull((item) => item.isEquipped && item.bucketHash == InventoryBucket.subclass)
        ?.itemHash;
    subclass = ManifestService.manifestParsed.destinyInventoryItemDefinition[subclassHash];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        mobileHeader(
          context,
          image:
              subclass?.screenshot != null ? NetworkImage(DestinyData.bungieLink + subclass!.screenshot!) : ghostBuild,
          child: textH1(
            widget.foreignBuild.name,
            utf8: false,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(globalPadding(context)),
          child: Column(
            children: [
              mobileSection(
                context,
                title: AppLocalizations.of(context)!.quick_actions,
                child: ForeignBuildMobileActions(
                  width: vw(context),
                ),
              ),
              for (final bucket in InventoryBucket.loadoutBucketHashes)
                mobileSection(
                  context,
                  title:
                      ManifestService.manifestParsed.destinyInventoryBucketDefinition[bucket]!.displayProperties!.name!,
                  utf8: true,
                  child: ForeignBuildSection(
                    item: widget.foreignBuild.items.firstWhereOrNull((element) => element.bucketHash == bucket),
                    width: vw(context),
                  ),
                ),
            ],
          ),
        )
      ],
    );
  }
}
