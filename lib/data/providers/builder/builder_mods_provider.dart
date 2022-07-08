import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quria/data/models/ArmorMods.model.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';

class BuilderModsProvider with ChangeNotifier {
  List<ModSlots> _mods = [];
  List<ModSlots> get mods => _mods;

  void setMods(
    List<ModSlots> mods,
  ) {
    _mods = mods;
    notifyListeners();
  }

  void init(
    BuildContext context,
  ) {
    if (_mods.isEmpty) {
      final List<ModSlots> armorMods = [
        // helmet
        ModSlots(
            title: AppLocalizations.of(context)!.helmet,
            elementSocketEntries:
                ManifestService.manifestParsed.destinyInventoryItemDefinition[3473581026]!.sockets!.socketEntries!,
            items: [
              null,
              ManifestService.manifestParsed.destinyInventoryItemDefinition[807186981],
              ManifestService.manifestParsed.destinyInventoryItemDefinition[807186981],
              ManifestService.manifestParsed.destinyInventoryItemDefinition[2493100093],
            ]),
        // gauntlets
        ModSlots(
            title: AppLocalizations.of(context)!.gauntlets,
            elementSocketEntries:
                ManifestService.manifestParsed.destinyInventoryItemDefinition[2771648715]!.sockets!.socketEntries!,
            items: [
              null,
              ManifestService.manifestParsed.destinyInventoryItemDefinition[1844045567],
              ManifestService.manifestParsed.destinyInventoryItemDefinition[1844045567],
              ManifestService.manifestParsed.destinyInventoryItemDefinition[2493100093],
            ]),
        // chest
        ModSlots(
            title: AppLocalizations.of(context)!.chest,
            elementSocketEntries:
                ManifestService.manifestParsed.destinyInventoryItemDefinition[549825413]!.sockets!.socketEntries!,
            items: [
              null,
              ManifestService.manifestParsed.destinyInventoryItemDefinition[1659393211],
              ManifestService.manifestParsed.destinyInventoryItemDefinition[1659393211],
              ManifestService.manifestParsed.destinyInventoryItemDefinition[2493100093],
            ]),
        // legs
        ModSlots(
            title: AppLocalizations.of(context)!.legs,
            elementSocketEntries:
                ManifestService.manifestParsed.destinyInventoryItemDefinition[4287863773]!.sockets!.socketEntries!,
            items: [
              null,
              ManifestService.manifestParsed.destinyInventoryItemDefinition[573150099],
              ManifestService.manifestParsed.destinyInventoryItemDefinition[573150099],
              ManifestService.manifestParsed.destinyInventoryItemDefinition[2493100093],
            ]),
        // class items
        ModSlots(
            title: AppLocalizations.of(context)!.builder_mods_title,
            elementSocketEntries:
                ManifestService.manifestParsed.destinyInventoryItemDefinition[3500810712]!.sockets!.socketEntries!,
            items: [
              null,
              ManifestService.manifestParsed.destinyInventoryItemDefinition[1137289077],
              ManifestService.manifestParsed.destinyInventoryItemDefinition[1137289077],
              ManifestService.manifestParsed.destinyInventoryItemDefinition[2493100093],
            ]),
      ];
      _mods = armorMods;
    }
  }

  void reset() {
    _mods = [];
  }
}
