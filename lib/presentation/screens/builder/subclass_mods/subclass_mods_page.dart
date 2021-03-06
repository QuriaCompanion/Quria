import 'package:provider/provider.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/providers/builder/builder_subclass_mods_provider.dart';
import 'package:quria/data/providers/builder/builder_subclass_provider.dart';
import 'package:quria/presentation/components/misc/desktop_components/scaffold_desktop.dart';
import 'package:quria/presentation/components/misc/mobile_components/scaffold_steps.dart';
import 'package:quria/presentation/screens/builder/desktop/builder_desktop_view.dart';
import 'package:quria/presentation/screens/builder/subclass_mods/subclass_mods_mobile_view.dart';
import 'package:quria/presentation/var/routes.dart';

class SubclassModsPage extends StatelessWidget {
  const SubclassModsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DestinyInventoryItemDefinition subclass = Provider.of<BuilderSubclassProvider>(context).subclass!;
    List<DestinyInventoryItemDefinition> chosenSockets = Provider.of<BuilderSubclassModsProvider>(context).subclassMods;

    if (vw(context) < 1000) {
      return ScaffoldSteps(
          route: routeMod,
          body: SubclassModsMobileView(
            displayedSockets: chosenSockets,
            subclass: subclass,
            onChange: (mods, i) async {
              Provider.of<BuilderSubclassModsProvider>(context, listen: false).setSubclassMods(mods);
            },
            width: vw(context),
          ));
    } else {
      return const ScaffoldDesktop(currentRoute: routeExotic, body: BuilderDesktopView());
    }
  }
}
