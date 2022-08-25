import 'package:bungie_api/enums/destiny_item_sub_type.dart';
import 'package:bungie_api/models/destiny_character_component.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/providers/helpers.dart/inspect_helper.dart';
import 'package:quria/data/providers/builder_quria_provider.dart';
import 'package:quria/data/providers/characters_provider.dart';
import 'package:quria/data/providers/inventory_provider.dart';
import 'package:quria/presentation/components/detailed_item/item/item_component_smart.dart';
import 'package:quria/presentation/components/misc/custom_checkbox.dart';
import 'package:quria/presentation/var/routes.dart';

class ClassItemChoiceMobileView extends ConsumerWidget {
  const ClassItemChoiceMobileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DestinyCharacterComponent character = ref.watch(charactersProvider).first;
    List<DestinyItemComponent> classItems = ref.watch(armorForClassProvider(ArmorForGivenClass(
      classType: character.classType,
      itemSubType: DestinyItemSubType.ClassArmor,
    )));
    return Column(
      children: [
        mobileHeader(
          context,
          image: buildHeader,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textH1(
                AppLocalizations.of(context)!.builder_class_item_title,
                utf8: false,
              ),
              textBodyRegular(
                AppLocalizations.of(context)!.builder_class_item_subtitle,
                utf8: false,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: globalPadding(context)),
          child: Column(
            children: [
              mobileSection(
                context,
                title: AppLocalizations.of(context)!.settings,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: globalPadding(context) / 2),
                      child: CustomCheckbox(
                        text: AppLocalizations.of(context)!.builder_class_item_keep_sunset,
                        value: ref.watch(builderQuriaProvider.select((value) => value.includeSunset)),
                        onChanged: (newValue) => ref.read(builderQuriaProvider.notifier).setRemoveSunset(newValue),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: globalPadding(context) / 2),
                      child: CustomCheckbox(
                        text: AppLocalizations.of(context)!.builder_class_item_assume_masterwork,
                        value: ref.watch(builderQuriaProvider.select((value) => value.includeSunset)),
                        onChanged: (newValue) =>
                            ref.read(builderQuriaProvider.notifier).setConsiderMasterwork(newValue),
                      ),
                    )
                  ],
                ),
              ),
              mobileSection(
                context,
                title: AppLocalizations.of(context)!.class_item,
                child: Column(
                  children: [
                    for (DestinyItemComponent item in classItems)
                      Column(
                        children: [
                          InkWell(
                              onTap: () {
                                ref.watch(builderQuriaProvider.notifier).setClassItem(item);
                                Navigator.pushNamed(context, routeBuilder);
                              },
                              child: ItemComponentSmart(width: vw(context), item: item)),
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
          ),
        )
      ],
    );
  }
}
