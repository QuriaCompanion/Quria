import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/BuildStored.model.dart';
import 'package:quria/data/providers/details_build_provider.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/bungie_api/enums/inventory_bucket_hash.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/screens/builds/details/details_build_mobile_actions.dart';
import 'package:quria/presentation/screens/builds/details/details_build_section.dart';

class DetailsBuildMobileView extends StatefulWidget {
  const DetailsBuildMobileView({Key? key}) : super(key: key);

  @override
  State<DetailsBuildMobileView> createState() => _DetailsBuildMobileViewState();
}

class _DetailsBuildMobileViewState extends State<DetailsBuildMobileView> {
  late final BuildStored _build;
  @override
  void initState() {
    super.initState();
    _build = Provider.of<DetailsBuildProvider>(context, listen: false).buildStored!;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        mobileHeader(
          context,
          image: ManifestService
                      .manifestParsed
                      .destinyInventoryItemDefinition[Provider.of<DetailsBuildProvider>(context, listen: false)
                          .getEquippedItemByBucket(InventoryBucket.subclass)
                          ?.itemHash]
                      ?.screenshot !=
                  null
              ? NetworkImage(DestinyData.bungieLink +
                  ManifestService
                      .manifestParsed
                      .destinyInventoryItemDefinition[Provider.of<DetailsBuildProvider>(context, listen: false)
                          .getEquippedItemByBucket(InventoryBucket.subclass)!
                          .itemHash]!
                      .screenshot!)
              : ghostBuild,
          child: textH1(
            _build.name,
            utf8: false,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(globalPadding(context)),
          child: Column(
            children: [
              mobileSection(context,
                  title: AppLocalizations.of(context)!.quick_actions,
                  child: DetailsBuildMobileActions(width: vw(context))),
              for (final bucket in InventoryBucket.loadoutBucketHashes)
                mobileSection(
                  context,
                  title:
                      ManifestService.manifestParsed.destinyInventoryBucketDefinition[bucket]!.displayProperties!.name!,
                  utf8: true,
                  child: DetailsBuildSection(
                    bucketHash: bucket,
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
