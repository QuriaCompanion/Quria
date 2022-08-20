import 'package:bungie_api/enums/item_state.dart';
import 'package:bungie_api/models/destiny_item_component.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/providers/builder/builder_custom_info_provider.dart';
import 'package:quria/data/providers/builder/builder_exotic_provider.dart';
import 'package:quria/data/providers/builder/builder_stats_filter_provider.dart';
import 'package:quria/data/providers/builder/builder_subclass_provider.dart';
import 'package:quria/data/providers/item_provider.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/presentation/components/misc/icon_item.dart';
import 'package:quria/presentation/components/misc/rounded_button.dart';
import 'package:quria/presentation/var/routes.dart';

class BuilderInfoRow extends StatelessWidget {
  const BuilderInfoRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 1,
                    ),
                  ),
                  height: vw(context) * .05,
                  width: vw(context) * .05,
                  child: Image.network(
                    '${DestinyData.bungieLink}${Provider.of<BuilderExoticProvider>(context).exotic?.displayProperties?.icon ?? DestinyData.exoticArmorLogo}?t=123456',
                    height: vw(context) * .05,
                    width: vw(context) * .05,
                    colorBlendMode: BlendMode.clear,
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.fill,
                  ),
                ),
                textCaption(AppLocalizations.of(context)!.exotic, utf8: false)
              ],
            ),
            Container(
              height: 5,
              width: 50,
              color: Colors.white,
            ),
            Column(
              children: [
                SvgPicture.asset(
                  "assets/icons/${Provider.of<BuilderStatsFilterProvider>(context).filters[0].icon}",
                  height: vw(context) * .05,
                  width: vw(context) * .05,
                  color: Colors.white,
                ),
                textCaption(AppLocalizations.of(context)!.statistics, utf8: false)
              ],
            ),
            Container(
              height: 5,
              width: 50,
              color: Colors.white,
            ),
            Column(
              children: [
                Image.network(
                  '${DestinyData.bungieLink}${Provider.of<BuilderSubclassProvider>(context).subclass?.displayProperties?.icon ?? DestinyData.exoticArmorLogo}?t=123456',
                  height: vw(context) * .05,
                  width: vw(context) * .05,
                  colorBlendMode: BlendMode.clear,
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.fill,
                ),
                textCaption(AppLocalizations.of(context)!.subclass, utf8: false)
              ],
            ),
            Container(
              height: 5,
              width: 50,
              color: Colors.white,
            ),
            Column(
              children: [
                Image.network(
                  '${DestinyData.bungieLink}${DestinyData.modsLogo}?t=123456',
                  height: vw(context) * .05,
                  width: vw(context) * .05,
                  colorBlendMode: BlendMode.clear,
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.fill,
                ),
                textCaption(AppLocalizations.of(context)!.armor_mods, utf8: false)
              ],
            ),
            Container(
              height: 5,
              width: 50,
              color: Colors.white,
            ),
            Column(
              children: [
                if (Provider.of<BuilderCustomInfoProvider>(context).classItem == null)
                  Image.network(
                    '${DestinyData.bungieLink}${DestinyData.classItemLogo}?t=123456',
                    height: vw(context) * .05,
                    width: vw(context) * .05,
                    colorBlendMode: BlendMode.clear,
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.fill,
                  ),
                if (Provider.of<BuilderCustomInfoProvider>(context).classItem != null)
                  Builder(builder: (context) {
                    DestinyItemComponent item = Provider.of<BuilderCustomInfoProvider>(context).classItem!;
                    return ItemIcon(
                      displayHash: item.overrideStyleItemHash ?? item.itemHash!,
                      imageSize: vw(context) * .05,
                      isMasterworked: item.state == ItemState.Masterwork || item.state == const ItemState(5),
                      element: Provider.of<ItemProvider>(context).getItemElement(item),
                      powerLevel: Provider.of<ItemProvider>(context).getItemPowerLevel(item.itemInstanceId!),
                    );
                  }),
                textCaption(AppLocalizations.of(context)!.class_item, utf8: false)
              ],
            ),
          ],
        ),
        RoundedButton(
            buttonColor: yellow,
            isDisabled: Provider.of<BuilderCustomInfoProvider>(context).classItem == null,
            text: textBodyBold(
              AppLocalizations.of(context)!.see_builds,
              color: black,
              utf8: false,
            ),
            onPressed: () => {Navigator.pushNamed(context, routeBuilder)}),
      ],
    );
  }
}
