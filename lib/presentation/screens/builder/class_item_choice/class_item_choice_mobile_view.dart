import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/helpers/classItemChoiceHelper.model.dart';
import 'package:quria/data/models/helpers/modHelper.model.dart';
import 'package:quria/data/providers/builder/builder_class_item_provider.dart';
import 'package:quria/presentation/components/detailed_item/item/item_component_smart.dart';
import 'package:quria/presentation/var/routes.dart';

class ClassItemChoiceMobileView extends StatelessWidget {
  final ClassItemChoiceHelper data;
  final List<DestinyItemComponent> classItems;
  const ClassItemChoiceMobileView(
      {required this.data, required this.classItems, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        mobileHeader(context,
            image: buildHeader,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textH1("Choisis ton objet de classe"),
                textBodyRegular("SÃ©lectionne l'objet de classe de ton build."),
              ],
            )),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: globalPadding(context)),
          child: Column(
            children: [
              for (DestinyItemComponent item in classItems)
                Column(
                  children: [
                    InkWell(
                        onTap: () {
                          Provider.of<BuilderClassItemProvider>(context)
                              .setClassItem(item.itemInstanceId!);
                          Navigator.pushNamed(context, routeMod,
                              arguments: ModHelper(
                                  characterId: data.characterId,
                                  statOrder: data.statOrder,
                                  subclassMods: data.subclassMods,
                                  exoticHash: data.exoticHash,
                                  subclassInstanceId: data.subclassInstanceId,
                                  classItemInstanceId: item.itemInstanceId!));
                        },
                        child: ItemComponentSmart(item: item)),
                    Divider(
                      height: globalPadding(context) * 2,
                      color: Colors.white,
                    ),
                  ],
                ),
              SizedBox(
                height: globalPadding(context) * 4,
              )
            ],
          ),
        ),
      ],
    );
  }
}
