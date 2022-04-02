import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/helpers/modHelper.model.dart';
import 'package:quria/data/models/helpers/subclassHelper.model.dart';
import 'package:quria/data/services/bungie_api/profile.service.dart';
import 'package:quria/presentation/components/misc/mobile_components/scaffold_steps.dart';
import 'package:quria/presentation/screens/builder/subclass/subclass_mobile_view.dart';
import 'package:quria/presentation/var/routes.dart';

class SubclassPage extends StatefulWidget {
  final SubclassHelper data;
  const SubclassPage({required this.data, Key? key}) : super(key: key);

  @override
  State<SubclassPage> createState() => _SubclassPageState();
}

class _SubclassPageState extends State<SubclassPage> {
  @override
  Widget build(BuildContext context) {
    List<DestinyItemComponent> subclasses =
        ProfileService().getSubclassesForCharacter(widget.data.characterId);
    if (vw(context) < 850) {
      return ScaffoldSteps<ModHelper>(
        route: routeMod,
        arguments: ModHelper(
            characterId: widget.data.characterId,
            statOrder: widget.data.statOrder,
            exoticHash: widget.data.exoticHash,
            subclassMods: []),
        body: SubclassMobileView(
          data: widget.data,
          subclasses: subclasses,
        ),
      );
    } else {
      return Container();
    }
  }
}
