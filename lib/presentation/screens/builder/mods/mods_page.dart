import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/ArmorMods.model.dart';
import 'package:quria/data/models/helpers/builderHelper.model.dart';
import 'package:quria/data/models/helpers/modHelper.model.dart';
import 'package:quria/data/providers/builder/builder_mods_provider.dart';
import 'package:quria/presentation/components/misc/mobile_components/scaffold_steps.dart';
import 'package:quria/presentation/screens/builder/mods/mods_mobile_view.dart';
import 'package:quria/presentation/var/routes.dart';

class ModsPage extends StatelessWidget {
  final ModHelper data;
  const ModsPage({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ModSlots> armorMods = Provider.of<BuilderModsProvider>(context).mods;
    if (vw(context) < 1000) {
      return ScaffoldSteps<BuilderPreparation>(
        route: routeBuilder,
        arguments: BuilderPreparation(
            characterId: data.characterId,
            subclassInstanceId: data.subclassInstanceId,
            statOrder: data.statOrder,
            exoticHash: data.exoticHash,
            armorMods: armorMods,
            subclassMods: data.subclassMods,
            classItemInstanceId: data.classItemInstanceId),
        body: ModsMobileView(
          armorMods: armorMods,
          onChange: (newMods) {
            Provider.of<BuilderModsProvider>(context).setMods(newMods);
          },
        ),
      );
    } else {
      return Container();
    }
  }
}
