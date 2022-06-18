import 'package:bungie_api/enums/destiny_item_sub_type.dart';
import 'package:bungie_api/models/destiny_character_component.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/providers/characters_provider.dart';
import 'package:quria/data/services/bungie_api/profile.service.dart';
import 'package:quria/presentation/components/misc/mobile_components/scaffold_burger_and_back_option.dart';
import 'package:quria/presentation/screens/builder/class_item_choice/class_item_choice_mobile_view.dart';

class ClassItemChoicePage extends StatefulWidget {
  const ClassItemChoicePage({Key? key}) : super(key: key);

  @override
  State<ClassItemChoicePage> createState() => _ClassItemChoicePageState();
}

class _ClassItemChoicePageState extends State<ClassItemChoicePage> {
  List<DestinyItemComponent> classItems = [];
  @override
  void initState() {
    super.initState();
    DestinyCharacterComponent? character = ProfileService().getCharacter(
        Provider.of<CharactersProvider>(context, listen: false)
            .currentCharacter!
            .characterId!);
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
          width: vw(context),
          body: ClassItemChoiceMobileView(classItems: classItems));
    } else {
      return Container();
    }
  }
}
