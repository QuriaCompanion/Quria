import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/ArmorMods.model.dart';
import 'package:quria/data/providers/builder/builder_mods_provider.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/misc/mobile_components/scaffold_steps.dart';
import 'package:quria/presentation/screens/builder/mods/mods_mobile_view.dart';
import 'package:quria/presentation/var/routes.dart';

class ModsPage extends StatelessWidget {
  const ModsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ModSlots> armorMods = Provider.of<BuilderModsProvider>(context).mods;

    if (armorMods.isEmpty) {
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
      Provider.of<BuilderModsProvider>(context, listen: false).init(armorMods);
    }
    if (vw(context) < 1000) {
      return ScaffoldSteps(
        route: routeClassItemChoice,
        body: ModsMobileView(
          armorMods: armorMods,
          onChange: (newMods) {
            Provider.of<BuilderModsProvider>(context, listen: false)
                .setMods(newMods);
          },
        ),
      );
    } else {
      return Container();
    }
  }
}
