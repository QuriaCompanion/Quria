import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/ArmorMods.model.dart';
import 'package:quria/data/providers/builder_quria_provider.dart';
import 'package:quria/presentation/screens/builder/mods/mobile_components/mod_mobile_section.dart';

class BuilderArmorMods extends ConsumerWidget {
  const BuilderArmorMods({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(builderQuriaProvider.notifier).init();
    final List<ModSlots> armorMods = ref.watch(builderQuriaProvider).mods;
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
                  textH3(ModSlots.fromIntToName(context, mods.value.slotHash)),
                  SizedBox(
                    width: vw(context) * 0.22,
                    child: ModsMobileSection(
                        width: vw(context) * 0.3,
                        items: mods.value.items,
                        scoketEntries: mods.value.elementSocketEntries,
                        onChange: (modSlots, index) {
                          armorMods[mods.key].items[index] = modSlots;
                          ref.read(builderQuriaProvider.notifier).setMods(armorMods);
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
