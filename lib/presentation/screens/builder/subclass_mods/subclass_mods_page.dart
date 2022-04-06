import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:bungie_api/models/destiny_item_socket_state.dart';
import 'package:bungie_api/models/destiny_item_talent_grid_component.dart';
import 'package:bungie_api/models/destiny_talent_grid_definition.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/helpers/modHelper.model.dart';
import 'package:quria/data/models/helpers/subclassModHelper.model.dart';
import 'package:quria/data/services/bungie_api/profile.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/misc/mobile_components/scaffold_steps.dart';
import 'package:quria/presentation/screens/builder/subclass_mods/subclass_mods_mobile_view.dart';
import 'package:quria/presentation/var/routes.dart';

class SubclassModsPage extends StatefulWidget {
  final SubclassModHelper data;
  const SubclassModsPage({required this.data, Key? key}) : super(key: key);

  @override
  State<SubclassModsPage> createState() => _SubclassModsPageState();
}

class _SubclassModsPageState extends State<SubclassModsPage> {
  List<DestinyItemSocketState>? sockets;
  DestinyTalentGridDefinition? talentGrid;
  DestinyItemTalentGridComponent? oldSubclass;
  List<DestinyInventoryItemDefinition> chosenSockets = [];

  @override
  void initState() {
    super.initState();
    sockets = ProfileService().getItemSockets(widget.data.subclassInstanceId);
    chosenSockets = sockets!
        .map((e) => ManifestService
            .manifestParsed.destinyInventoryItemDefinition![e.plugHash]!)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    if (vw(context) < 850) {
      return ScaffoldSteps<ModHelper>(
          route: routeMod,
          arguments: ModHelper(
            characterId: widget.data.characterId,
            subclassInstanceId: widget.data.subclassInstanceId,
            statOrder: widget.data.statOrder,
            subclassMods: chosenSockets,
            exoticHash: widget.data.exoticHash,
          ),
          body: SubclassModsMobileView(
            sockets: sockets,
            subclass: widget.data.subclass,
            onChange: (mods) {
              setState(() {
                chosenSockets = mods;
              });
            },
          ));
    } else {
      return Container();
    }
  }
}
