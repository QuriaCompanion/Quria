import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/helpers/classItemChoiceHelper.model.dart';
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
  late List<DestinyItemComponent> data;

  @override
  void initState() {
    super.initState();
    data = ProfileService().getSubclassesForCharacter(widget.data.characterId);
  }

  @override
  Widget build(BuildContext context) {
    if (vw(context) < 850) {
      return ScaffoldSteps<ClassItemChoiceHelper>(
        route: routeClassItemChoice,
        arguments: ClassItemChoiceHelper(
            characterId: widget.data.characterId,
            statOrder: widget.data.statOrder,
            exoticHash: widget.data.exoticHash,
            subclassMods: []),
        body: SubclassMobileView(
          data: widget.data,
          subclasses: data,
        ),
      );
    } else {
      return Container();
    }
  }
}
