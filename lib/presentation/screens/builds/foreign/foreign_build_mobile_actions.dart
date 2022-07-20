import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/ArmorMods.model.dart';
import 'package:quria/data/models/BuildStored.model.dart';
import 'package:quria/data/models/helpers/filterHelper.model.dart';
import 'package:quria/data/providers/builder/builder_exotic_provider.dart';
import 'package:quria/data/providers/builder/builder_mods_provider.dart';
import 'package:quria/data/providers/builder/builder_stats_filter_provider.dart';
import 'package:quria/data/providers/builder/builder_subclass_mods_provider.dart';
import 'package:quria/data/providers/builder/builder_subclass_provider.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/misc/quick_action.dart';
import 'package:quria/presentation/var/routes.dart';

class ForeignBuildMobileActions extends StatelessWidget {
  final double width;
  final BuildStored storeBuild;
  const ForeignBuildMobileActions({
    required this.storeBuild,
    required this.width,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: globalPadding(context) / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          QuickAction(
              icon: "assets/icons/Save.svg",
              title: AppLocalizations.of(context)!.save,
              width: width,
              onTap: () {
                if (storeBuild.preset != null) {
                  Provider.of<BuilderExoticProvider>(context, listen: false).setExoticHash(
                      ManifestService.manifestParsed.destinyInventoryItemDefinition[storeBuild.preset?.exoticHash]);
                  final List<ModSlots> armorMods = [
                    // helmet
                    ModSlots(
                        title: AppLocalizations.of(context)!.helmet,
                        elementSocketEntries: ManifestService
                            .manifestParsed.destinyInventoryItemDefinition[3473581026]!.sockets!.socketEntries!,
                        items: [
                          null,
                          for (int index = 0; index < storeBuild.preset!.armorMods["helmet"]!.length; index++)
                            ManifestService.manifestParsed
                                .destinyInventoryItemDefinition[storeBuild.preset!.armorMods["helmet"]?[index]],
                        ]),
                    // gauntlets
                    ModSlots(
                        title: AppLocalizations.of(context)!.gauntlets,
                        elementSocketEntries: ManifestService
                            .manifestParsed.destinyInventoryItemDefinition[2771648715]!.sockets!.socketEntries!,
                        items: [
                          null,
                          for (int index = 0; index < storeBuild.preset!.armorMods["gauntlets"]!.length; index++)
                            ManifestService.manifestParsed
                                .destinyInventoryItemDefinition[storeBuild.preset!.armorMods["gauntlets"]?[index]],
                        ]),
                    // chest
                    ModSlots(
                        title: AppLocalizations.of(context)!.chest,
                        elementSocketEntries: ManifestService
                            .manifestParsed.destinyInventoryItemDefinition[549825413]!.sockets!.socketEntries!,
                        items: [
                          null,
                          for (int index = 0; index < storeBuild.preset!.armorMods["chest"]!.length; index++)
                            ManifestService.manifestParsed
                                .destinyInventoryItemDefinition[storeBuild.preset!.armorMods["chest"]?[index]],
                        ]),
                    // legs
                    ModSlots(
                        title: AppLocalizations.of(context)!.legs,
                        elementSocketEntries: ManifestService
                            .manifestParsed.destinyInventoryItemDefinition[4287863773]!.sockets!.socketEntries!,
                        items: [
                          null,
                          for (int index = 0; index < storeBuild.preset!.armorMods["leg"]!.length; index++)
                            ManifestService.manifestParsed
                                .destinyInventoryItemDefinition[storeBuild.preset!.armorMods["leg"]?[index]],
                        ]),
                    // class items
                    ModSlots(
                        title: AppLocalizations.of(context)!.builder_mods_title,
                        elementSocketEntries: ManifestService
                            .manifestParsed.destinyInventoryItemDefinition[3500810712]!.sockets!.socketEntries!,
                        items: [
                          null,
                          for (int index = 0; index < storeBuild.preset!.armorMods["classItem"]!.length; index++)
                            ManifestService.manifestParsed
                                .destinyInventoryItemDefinition[storeBuild.preset!.armorMods["classItem"]?[index]],
                        ]),
                  ];
                  Provider.of<BuilderModsProvider>(context, listen: false).setMods(armorMods);
                  final filters = [
                    for (int value in storeBuild.preset!.statOrder)
                      FilterHelper(name: fromIntToName(context, value), icon: fromIntToIcon(value), value: value),
                  ];
                  Provider.of<BuilderStatsFilterProvider>(context, listen: false).setNewStatsFilters(filters);
                  Provider.of<BuilderSubclassProvider>(context, listen: false).setSubclass(null,
                      ManifestService.manifestParsed.destinyInventoryItemDefinition[storeBuild.preset!.subclassHash]);
                  Provider.of<BuilderSubclassModsProvider>(context, listen: false).setSubclassMods(storeBuild
                      .preset!.subclassMods
                      .map((e) => ManifestService.manifestParsed.destinyInventoryItemDefinition[e]!)
                      .toList());
                  Navigator.pushNamed(context, routeClassItemChoice);
                }
              }),
        ],
      ),
    );
  }
}
