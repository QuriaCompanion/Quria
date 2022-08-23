import 'package:bungie_api/enums/destiny_item_sub_type.dart';
import 'package:bungie_api/enums/item_state.dart';
import 'package:bungie_api/models/destiny_character_component.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/providers/builder_quria_provider.dart';
import 'package:quria/data/providers/characters_provider.dart';
import 'package:quria/data/providers/inventory_provider.dart';
import 'package:quria/data/providers/item_provider.dart';
import 'package:quria/presentation/components/misc/custom_checkbox.dart';
import 'package:quria/presentation/components/misc/icon_item.dart';

class BuilderCustomInfo extends StatelessWidget {
  const BuilderCustomInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DestinyCharacterComponent character = Provider.of<CharactersProvider>(context).currentCharacter!;
    List<DestinyItemComponent> classItems = Provider.of<InventoryProvider>(context).getArmorForClass(
      character.classType!,
      itemSubType: DestinyItemSubType.ClassArmor,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textH1(
          AppLocalizations.of(context)!.builder_class_item_title,
          utf8: false,
        ),
        textBodyHighRegular(
          AppLocalizations.of(context)!.builder_class_item_subtitle,
          utf8: false,
        ),
        mobileSection(
          context,
          dividerColor: grey,
          title: AppLocalizations.of(context)!.settings,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomCheckbox(
                  color: grey,
                  text: AppLocalizations.of(context)!.builder_class_item_keep_sunset,
                  value: Provider.of<BuilderCustomInfoProvider>(context).includeSunset,
                  onChanged: (newValue) =>
                      Provider.of<BuilderCustomInfoProvider>(context, listen: false).setRemoveSunset(newValue),
                  tooltip: AppLocalizations.of(context)!.builder_custom_sunset_tooltip,
                ),
              ),
              SizedBox(
                width: globalPadding(context),
              ),
              Expanded(
                child: CustomCheckbox(
                    color: grey,
                    text: AppLocalizations.of(context)!.builder_class_item_assume_masterwork,
                    value: Provider.of<BuilderCustomInfoProvider>(context).considerMasterwork,
                    onChanged: (newValue) =>
                        Provider.of<BuilderCustomInfoProvider>(context, listen: false).setConsiderMasterwork(newValue)),
              ),
            ],
          ),
        ),
        mobileSection(context,
            dividerColor: grey,
            title: AppLocalizations.of(context)!.class_item,
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (DestinyItemComponent item in classItems)
                  Container(
                    width: 80,
                    height: 80,
                    decoration: Provider.of<BuilderCustomInfoProvider>(context).classItem == item
                        ? BoxDecoration(
                            border: Border.all(
                              color: vanguard,
                              width: 3,
                            ),
                          )
                        : null,
                    child: InkWell(
                      onTap: () {
                        if (Provider.of<BuilderCustomInfoProvider>(context, listen: false).classItem == item) {
                          Provider.of<BuilderCustomInfoProvider>(context, listen: false).setClassItem(null);
                          return;
                        }
                        Provider.of<BuilderCustomInfoProvider>(context, listen: false).setClassItem(item);
                      },
                      child: ItemIcon(
                        displayHash: item.overrideStyleItemHash ?? item.itemHash!,
                        imageSize: 80,
                        isMasterworked: item.state == ItemState.Masterwork || item.state == const ItemState(5),
                        element: ref.watch(itemElementProvider(item)),
                        powerLevel: ref.watch(itemPowerLevelProvider(item.itemInstanceId)),
                      ),
                    ),
                  ),
              ],
            )),
      ],
    );
  }
}
