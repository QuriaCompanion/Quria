import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quria/constants/desktop_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:quria/data/models/helpers/socketsHelper.model.dart';
import 'package:quria/data/providers/builder_quria_provider.dart';
import 'package:quria/data/providers/characters_provider.dart';
import 'package:quria/data/providers/inventory_provider.dart';
import 'package:quria/data/services/display/display.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/misc/rounded_button.dart';
import 'package:quria/presentation/screens/builder/subclass/mobile_components/subclass_mobile_card.dart';
import 'package:quria/presentation/screens/builder/subclass_mods/subclass_mods_mobile_view.dart';

class BuilderSubclass extends ConsumerWidget {
  const BuilderSubclass({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<DestinyItemComponent> subclasses =
        ref.watch(subclassesForCharacterProvider(ref.watch(charactersProvider).first.characterId!));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textH1(
          AppLocalizations.of(context)!.builder_subclass_title,
          utf8: false,
        ),
        textBodyHighRegular(
          AppLocalizations.of(context)!.builder_subclass_subtitle,
          utf8: false,
        ),
        SizedBox(
          height: globalPadding(context),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (final subclass in subclasses)
              Container(
                decoration: ref.watch(builderQuriaProvider.select((value) => value.subclass)) ==
                        ManifestService.manifestParsed.destinyInventoryItemDefinition[subclass.itemHash]
                    ? BoxDecoration(
                        border: Border.all(
                          color: vanguard,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      )
                    : null,
                child: InkWell(
                  child: SubclassMobileCard(
                    onTap: (subclassDef) {
                      if (ref.watch(builderQuriaProvider.select((value) => value.subclass)) ==
                          ManifestService.manifestParsed.destinyInventoryItemDefinition[subclass.itemHash]) {
                        ref.read(builderQuriaProvider.notifier).setSubclass(null, null);
                        return;
                      }
                      ref.read(builderQuriaProvider.notifier).setSubclass(subclass.itemInstanceId, subclassDef);

                      SocketsHelper data = DisplayService.getSubclassMods(ref, subclass.itemInstanceId!);
                      ref.read(builderQuriaProvider.notifier).setSubclassMods(data.displayedSockets);
                    },
                    color: grey,
                    subclass: subclass,
                    width: vw(context) * 0.15,
                  ),
                ),
              ),
          ],
        ),
        if (ref.watch(builderQuriaProvider.select((value) => value.subclass)) != null &&
            ref.watch(builderQuriaProvider.select((value) => value.subclass))?.talentGrid?.talentGridHash == 0)
          Padding(
            padding: EdgeInsets.only(top: globalPadding(context)),
            child: Center(
              child: RoundedButton(
                onPressed: () => {
                  showDialog(
                      context: context,
                      barrierColor: const Color.fromARGB(110, 0, 0, 0),
                      builder: (context) {
                        final displayedSockets = ref.watch(builderQuriaProvider.select((value) => value.subclassMods));
                        DestinyInventoryItemDefinition subclass =
                            ref.watch(builderQuriaProvider.select((value) => value.subclass))!;

                        return desktopRegularModal(
                          context,
                          child: SubclassModsMobileView(
                            width: modalWidth(context),
                            displayedSockets: displayedSockets,
                            subclass: subclass,
                            onChange: (mods, i) async {
                              ref.read(builderQuriaProvider.notifier).setSubclassMods(mods);
                            },
                          ),
                        );
                      })
                },
                text: textBodyBold(AppLocalizations.of(context)!.builder_subclass_mods_title,
                    color: Colors.white, utf8: false),
                buttonColor: grey,
                width: 300,
              ),
            ),
          )
      ],
    );
  }
}
