import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/ArmorMods.model.dart';
import 'package:quria/data/models/helpers/builderHelper.model.dart';
import 'package:quria/data/models/helpers/modHelper.model.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/misc/mobile_components/scaffold_steps.dart';
import 'package:quria/presentation/screens/builder/mods/mods_mobile_view.dart';
import 'package:quria/presentation/var/routes.dart';

class ModsPage extends StatefulWidget {
  final ModHelper data;
  const ModsPage({required this.data, Key? key}) : super(key: key);

  @override
  State<ModsPage> createState() => _ModsPageState();
}

class _ModsPageState extends State<ModsPage> {
  List<ModSlots> armorMods = [];
  @override
  void initState() {
    super.initState();

    armorMods = [
      // helmet
      ModSlots(
          title: AppLocalizations.of(context)!.helmet,
          elementSocketEntries: ManifestService
              .manifestParsed
              .destinyInventoryItemDefinition[3473581026]!
              .sockets!
              .socketEntries!,
          items: [
            null,
            ManifestService
                .manifestParsed.destinyInventoryItemDefinition[807186981],
            ManifestService
                .manifestParsed.destinyInventoryItemDefinition[807186981],
            ManifestService
                .manifestParsed.destinyInventoryItemDefinition[2493100093],
          ]),
      // gauntlets
      ModSlots(
          title: AppLocalizations.of(context)!.gauntlets,
          elementSocketEntries: ManifestService
              .manifestParsed
              .destinyInventoryItemDefinition[2771648715]!
              .sockets!
              .socketEntries!,
          items: [
            null,
            ManifestService
                .manifestParsed.destinyInventoryItemDefinition[1844045567],
            ManifestService
                .manifestParsed.destinyInventoryItemDefinition[1844045567],
            ManifestService
                .manifestParsed.destinyInventoryItemDefinition[2493100093],
          ]),
      // chest
      ModSlots(
          title: AppLocalizations.of(context)!.chest,
          elementSocketEntries: ManifestService
              .manifestParsed
              .destinyInventoryItemDefinition[549825413]!
              .sockets!
              .socketEntries!,
          items: [
            null,
            ManifestService
                .manifestParsed.destinyInventoryItemDefinition[1659393211],
            ManifestService
                .manifestParsed.destinyInventoryItemDefinition[1659393211],
            ManifestService
                .manifestParsed.destinyInventoryItemDefinition[2493100093],
          ]),
      // legs
      ModSlots(
          title: AppLocalizations.of(context)!.legs,
          elementSocketEntries: ManifestService
              .manifestParsed
              .destinyInventoryItemDefinition[4287863773]!
              .sockets!
              .socketEntries!,
          items: [
            null,
            ManifestService
                .manifestParsed.destinyInventoryItemDefinition[573150099],
            ManifestService
                .manifestParsed.destinyInventoryItemDefinition[573150099],
            ManifestService
                .manifestParsed.destinyInventoryItemDefinition[2493100093],
          ]),
      // boots
      ModSlots(
          title: AppLocalizations.of(context)!.builder_mods_title,
          elementSocketEntries: ManifestService
              .manifestParsed
              .destinyInventoryItemDefinition[3500810712]!
              .sockets!
              .socketEntries!,
          items: [
            null,
            ManifestService
                .manifestParsed.destinyInventoryItemDefinition[1137289077],
            ManifestService
                .manifestParsed.destinyInventoryItemDefinition[1137289077],
            ManifestService
                .manifestParsed.destinyInventoryItemDefinition[2493100093],
          ]),
    ];
  }

  @override
  Widget build(BuildContext context) {
    if (vw(context) < 1000) {
      return ScaffoldSteps<BuilderPreparation>(
        route: routeBuilder,
        arguments: BuilderPreparation(
            characterId: widget.data.characterId,
            subclassInstanceId: widget.data.subclassInstanceId,
            statOrder: widget.data.statOrder,
            exoticHash: widget.data.exoticHash,
            armorMods: armorMods,
            subclassMods: widget.data.subclassMods,
            classItemInstanceId: widget.data.classItemInstanceId),
        body: ModsMobileView(
          armorMods: armorMods,
          onChange: (newMods) {
            setState(() {
              armorMods = newMods;
            });
          },
        ),
      );
    } else {
      return Container();
    }
  }
}
