import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/ArmorMods.model.dart';
import 'package:quria/data/providers/builder/builder_mods_provider.dart';
import 'package:quria/presentation/screens/builder/mods/mobile_components/mod_mobile_section.dart';

class BuilderArmorMods extends StatelessWidget {
  const BuilderArmorMods({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<BuilderModsProvider>(context, listen: false).init(context);
    List<ModSlots> armorMods = Provider.of<BuilderModsProvider>(context).mods;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textH1(
          AppLocalizations.of(context)!.builder_mods_title,
          utf8: false,
        ),
        textBodyHighRegular(
          AppLocalizations.of(context)!.builder_mods_subtitle,
          utf8: false,
        ),
        SizedBox(
          height: globalPadding(context),
        ),
        Wrap(
          children: [
            for (var mods in armorMods.asMap().entries)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textH3(mods.value.title),
                  SizedBox(
                    width: vw(context) * 0.15,
                    child: ModsMobileSection(
                        width: vw(context) * 0.3,
                        items: mods.value.items,
                        scoketEntries: mods.value.elementSocketEntries,
                        onChange: (modSlots, index) {
                          armorMods[mods.key].items[index] = modSlots;
                          Provider.of<BuilderModsProvider>(context, listen: false).setMods(armorMods);
                        }),
                  ),
                ],
              )
          ],
        )
      ],
    );
  }
}
