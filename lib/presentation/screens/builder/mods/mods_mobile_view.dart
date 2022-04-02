import 'package:flutter/material.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/ArmorMods.model.dart';
import 'package:quria/presentation/screens/builder/mods/mobile_components/mod_mobile_section.dart';

class ModsMobileView extends StatelessWidget {
  final List<ModSlots> armorMods;
  final void Function(List<ModSlots>) onChange;
  const ModsMobileView(
      {required this.armorMods, required this.onChange, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        mobileHeader(context,
            image: modsHeader,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textH1("Choisis tes mods"),
                textBodyRegular("Selectionne les mods que tu veux Ã©quiper."),
              ],
            )),
        for (var mods in armorMods.asMap().entries)
          mobileSectionInverted(context,
              title: mods.value.title,
              child: ModsMobileSection(
                  items: mods.value.items,
                  scoketEntries: mods.value.elementSocketEntries,
                  onChange: (modSlots, index) {
                    armorMods[mods.key].items[index] = modSlots;
                    onChange(armorMods);
                  })),
        SizedBox(height: globalPadding(context) * 4),
      ],
    );
  }
}
