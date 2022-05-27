import 'package:flutter/cupertino.dart';
import 'package:quria/data/models/ArmorMods.model.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';

class BuilderModsProvider with ChangeNotifier {
  List<ModSlots> _mods = [
    // helmet
    ModSlots(
        title: "Casque",
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
        title: "Gantelets",
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
        title: "Armure de torse",
        elementSocketEntries: ManifestService.manifestParsed
            .destinyInventoryItemDefinition[549825413]!.sockets!.socketEntries!,
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
        title: "Armure de jambes",
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
        title: "Objet de classe",
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
  List<ModSlots> get mods => _mods;

  void setMods(
    List<ModSlots> mods,
  ) {
    _mods = mods;
    notifyListeners();
  }
}
