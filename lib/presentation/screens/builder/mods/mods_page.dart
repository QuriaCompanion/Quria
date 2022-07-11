import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/ArmorMods.model.dart';
import 'package:quria/data/providers/builder/builder_mods_provider.dart';
import 'package:quria/presentation/components/misc/desktop_components/scaffold_desktop.dart';
import 'package:quria/presentation/components/misc/mobile_components/scaffold_steps.dart';
import 'package:quria/presentation/screens/builder/desktop/builder_desktop_view.dart';
import 'package:quria/presentation/screens/builder/mods/mods_mobile_view.dart';
import 'package:quria/presentation/var/routes.dart';

class ModsPage extends StatelessWidget {
  const ModsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<BuilderModsProvider>(context, listen: false).init(context);
    List<ModSlots> armorMods = Provider.of<BuilderModsProvider>(context).mods;

    if (vw(context) < 1000) {
      return ScaffoldSteps(
        route: routeClassItemChoice,
        body: ModsMobileView(
          armorMods: armorMods,
          onChange: (newMods) {
            Provider.of<BuilderModsProvider>(context, listen: false).setMods(newMods);
          },
        ),
      );
    } else {
      return const ScaffoldDesktop(currentRoute: routeExotic, body: BuilderDesktopView());
    }
  }
}
