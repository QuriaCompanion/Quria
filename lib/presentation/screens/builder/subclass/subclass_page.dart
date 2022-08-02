import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/helpers/socketsHelper.model.dart';
import 'package:quria/data/providers/builder/builder_subclass_mods_provider.dart';
import 'package:quria/data/providers/builder/builder_subclass_provider.dart';
import 'package:quria/data/providers/characters_provider.dart';
import 'package:quria/data/providers/inventory_provider.dart';
import 'package:quria/data/services/display/display.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/misc/desktop_components/scaffold_desktop.dart';
import 'package:quria/presentation/components/misc/mobile_components/scaffold_steps.dart';
import 'package:quria/presentation/screens/builder/desktop/builder_desktop_view.dart';
import 'package:quria/presentation/screens/builder/subclass/subclass_mobile_view.dart';
import 'package:quria/presentation/var/routes.dart';

class SubclassPage extends StatefulWidget {
  const SubclassPage({Key? key}) : super(key: key);

  @override
  State<SubclassPage> createState() => _SubclassPageState();
}

class _SubclassPageState extends State<SubclassPage> {
  late List<DestinyItemComponent> data;

  @override
  void initState() {
    super.initState();
    data = Provider.of<InventoryProvider>(context, listen: false).getSubclassesForCharacter(
        Provider.of<CharactersProvider>(context, listen: false).currentCharacter!.characterId!);
  }

  @override
  Widget build(BuildContext context) {
    if (vw(context) < 1000) {
      return ScaffoldSteps(
        actionText: AppLocalizations.of(context)!.next,
        route: routeMod,
        body: SubclassMobileView(
          width: vw(context),
          subclasses: data,
          onSelect: (subclass) {
            if (Provider.of<BuilderSubclassProvider>(context, listen: false).subclass !=
                ManifestService.manifestParsed.destinyInventoryItemDefinition[subclass.itemHash]) {
              Provider.of<BuilderSubclassProvider>(context, listen: false).setSubclass(subclass.itemInstanceId,
                  ManifestService.manifestParsed.destinyInventoryItemDefinition[subclass.itemHash]);
              SocketsHelper data = DisplayService.getSubclassMods(context, subclass.itemInstanceId!);
              Provider.of<BuilderSubclassModsProvider>(context, listen: false).setSubclassMods(data.displayedSockets);
            }
            ManifestService
                        .manifestParsed.destinyInventoryItemDefinition[subclass.itemHash]?.talentGrid?.talentGridHash ==
                    0
                ? Navigator.pushNamed(
                    context,
                    routeSubclassMod,
                  )
                : Navigator.pushNamed(
                    context,
                    routeClassItemChoice,
                  );
          },
        ),
        onNext: () {
          Provider.of<BuilderSubclassProvider>(context, listen: false).reset();
          Provider.of<BuilderSubclassModsProvider>(context, listen: false).reset();
        },
        previousRoute: routeFilter,
      );
    } else {
      return const ScaffoldDesktop(currentRoute: routeExotic, body: BuilderDesktopView());
    }
  }
}
