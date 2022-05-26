import 'package:bungie_api/enums/destiny_item_sub_type.dart';
import 'package:bungie_api/models/destiny_character_component.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/helpers/classItemChoiceHelper.model.dart';
import 'package:quria/data/services/bungie_api/profile.service.dart';
import 'package:quria/presentation/components/misc/mobile_components/scaffold_burger_and_back_option.dart';
import 'package:quria/presentation/screens/builder/class_item_choice/class_item_choice_mobile_view.dart';

class ClassItemChoicePage extends StatefulWidget {
  final ClassItemChoiceHelper data;
  const ClassItemChoicePage({required this.data, Key? key}) : super(key: key);

  @override
  State<ClassItemChoicePage> createState() => _ClassItemChoicePageState();
}

class _ClassItemChoicePageState extends State<ClassItemChoicePage> {
  List<DestinyItemComponent> classItems = [];
  @override
  void initState() {
    super.initState();
    DestinyCharacterComponent? character =
        ProfileService().getCharacter(widget.data.characterId);
    classItems = ProfileService()
        .getAllArmorForClass(character!.classType!,
            itemSubType: DestinyItemSubType.ClassArmor)
        .toSet()
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    if (vw(context) < 1000) {
      return ScaffoldBurgerAndBackOption(
          body: ClassItemChoiceMobileView(
              data: widget.data, classItems: classItems));
    } else {
      return Container();
    }
  }
}
