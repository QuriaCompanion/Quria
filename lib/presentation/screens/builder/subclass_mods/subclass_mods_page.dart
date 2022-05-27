import 'package:memoize/memoize.dart';
import 'package:provider/provider.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/helpers/classItemChoiceHelper.model.dart';
import 'package:quria/data/models/helpers/socketsHelper.model.dart';
import 'package:quria/data/models/helpers/subclassModHelper.model.dart';
import 'package:quria/data/providers/builder/builder_subclass_mods_provider.dart';
import 'package:quria/data/providers/builder/builder_subclass_provider.dart';
import 'package:quria/data/services/display/display.service.dart';
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
  late SocketsHelper data;
  List<DestinyInventoryItemDefinition> chosenSockets = [];
  SocketsHelper Function(String) getSubclassMods = memo1<String, SocketsHelper>(
      (String id) => DisplayService().getSubclassMods(id));

  @override
  Widget build(BuildContext context) {
    data = getSubclassMods(
        Provider.of<BuilderSubclassProvider>(context).subclassId!);
    final sockets = data.sockets;
    chosenSockets =
        Provider.of<BuilderSubclassModsProvider>(context).subclassMods ??
            data.displayedSockets;

    if (vw(context) < 1000) {
      return ScaffoldSteps<ClassItemChoiceHelper>(
          route: routeClassItemChoice,
          arguments: ClassItemChoiceHelper(
            characterId: widget.data.characterId,
            subclassInstanceId: widget.data.subclassInstanceId,
            statOrder: widget.data.statOrder,
            subclassMods: chosenSockets,
            exoticHash: widget.data.exoticHash,
          ),
          body: SubclassModsMobileView(
            sockets: sockets,
            subclass: widget.data.subclass,
            onChange: (mods, i) async {
              Provider.of<BuilderSubclassModsProvider>(context, listen: false)
                  .setSubclassMods(mods);
            },
          ));
    } else {
      return Container();
    }
  }
}
