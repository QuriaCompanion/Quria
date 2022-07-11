import 'package:memoize/memoize.dart';
import 'package:provider/provider.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/helpers/socketsHelper.model.dart';
import 'package:quria/data/providers/builder/builder_subclass_mods_provider.dart';
import 'package:quria/data/providers/builder/builder_subclass_provider.dart';
import 'package:quria/data/services/display/display.service.dart';
import 'package:quria/presentation/components/misc/desktop_components/scaffold_desktop.dart';
import 'package:quria/presentation/components/misc/mobile_components/scaffold_steps.dart';
import 'package:quria/presentation/screens/builder/desktop/builder_desktop_view.dart';
import 'package:quria/presentation/screens/builder/subclass_mods/subclass_mods_mobile_view.dart';
import 'package:quria/presentation/var/routes.dart';

class SubclassModsPage extends StatefulWidget {
  const SubclassModsPage({Key? key}) : super(key: key);

  @override
  State<SubclassModsPage> createState() => _SubclassModsPageState();
}

class _SubclassModsPageState extends State<SubclassModsPage> {
  late SocketsHelper data;
  late SocketsHelper Function(String) getSubclassMods;
  List<DestinyInventoryItemDefinition> chosenSockets = [];
  @override
  void initState() {
    super.initState();
    getSubclassMods = memo1<String, SocketsHelper>((String id) => DisplayService.getSubclassMods(context, id));
  }

  @override
  Widget build(BuildContext context) {
    data = getSubclassMods(Provider.of<BuilderSubclassProvider>(context).subclassId!);
    final sockets = data.sockets;
    DestinyInventoryItemDefinition subclass = Provider.of<BuilderSubclassProvider>(context).subclass!;
    chosenSockets = Provider.of<BuilderSubclassModsProvider>(context).subclassMods;
    if (chosenSockets.isEmpty) {
      chosenSockets = data.displayedSockets;
    }

    if (vw(context) < 1000) {
      return ScaffoldSteps(
          route: routeMod,
          body: SubclassModsMobileView(
            sockets: sockets,
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
