import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/BuildResponse.model.dart';
import 'package:quria/data/providers/builder/builder_mods_provider.dart';
import 'package:quria/data/providers/builder/builder_subclass_mods_provider.dart';
import 'package:quria/data/providers/builder/builder_subclass_provider.dart';
import 'package:quria/data/providers/characters_provider.dart';
import 'package:quria/data/services/bungie_api/bungie_actions.service.dart';
import 'package:quria/data/services/bungie_api/enums/quick_actions.enum.dart';
import 'package:quria/presentation/components/misc/mobile_components/in_progress_modal.dart';
import 'package:quria/presentation/components/misc/mobile_components/loading_modal.dart';
import 'package:quria/presentation/screens/builder/build_recap/mobile_components/builder_recap_mobile_actions.dart';
import 'package:quria/presentation/screens/builder/build_recap/mobile_components/builder_recap_mobile_item.dart';

class BuilderRecapMobileView extends StatelessWidget {
  final Build data;
  const BuilderRecapMobileView({required this.data, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        mobileHeader(context,
            image: buildHeader,
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  textH1("Base :T${data.stats.base}"),
                  textH1("Final :T${data.stats.max}")
                ],
              ),
            )),
        Padding(
          padding: EdgeInsets.all(globalPadding(context)),
          child: Column(
            children: [
              mobileSection(context,
                  title: AppLocalizations.of(context)!.quick_actions,
                  child: BuilderRecapMobileActions(
                    width: vw(context),
                    onAction: (action) async {
                      switch (action) {
                        case QuickActions.equip:
                          showMaterialModalBottomSheet(
                              context: context,
                              backgroundColor: Colors.transparent,
                              isDismissible: false,
                              expand: false,
                              builder: (context) {
                                return LoadingModal(
                                  text1:
                                      AppLocalizations.of(context)!.equipping,
                                  text2:
                                      AppLocalizations.of(context)!.long_action,
                                );
                              });
                          BungieActionsService()
                              .equipBuild(
                                context,
                                build: data,
                                characterId:
                                    Provider.of<CharactersProvider>(context)
                                        .currentCharacter!
                                        .characterId!,
                                mods: Provider.of<BuilderModsProvider>(context)
                                    .mods,
                                subclassMods:
                                    Provider.of<BuilderSubclassModsProvider>(
                                            context)
                                        .subclassMods,
                                subclassId:
                                    Provider.of<BuilderSubclassProvider>(
                                            context)
                                        .subclassId,
                              )
                              .then((_) => Navigator.pop(context));
                          break;
                        case QuickActions.save:
                          showMaterialModalBottomSheet(
                              context: context,
                              backgroundColor: Colors.transparent,
                              isDismissible: false,
                              expand: false,
                              builder: (context) {
                                return const InProgressModal();
                              });
                          break;
                        case QuickActions.share:
                          showMaterialModalBottomSheet(
                              context: context,
                              backgroundColor: Colors.transparent,
                              isDismissible: false,
                              expand: false,
                              builder: (context) {
                                return const InProgressModal();
                              });
                          break;
                      }
                    },
                  )),
              mobileSection(context,
                  title: AppLocalizations.of(context)!.helmet,
                  child: BuilderRecapMobileItem(
                    width: vw(context),
                    item: data.equipement[0],
                    mods:
                        Provider.of<BuilderModsProvider>(context).mods[0].items,
                  )),
              mobileSection(context,
                  title: AppLocalizations.of(context)!.gauntlets,
                  child: BuilderRecapMobileItem(
                    width: vw(context),
                    item: data.equipement[1],
                    mods:
                        Provider.of<BuilderModsProvider>(context).mods[1].items,
                  )),
              mobileSection(context,
                  title: AppLocalizations.of(context)!.chest,
                  child: BuilderRecapMobileItem(
                    width: vw(context),
                    item: data.equipement[2],
                    mods:
                        Provider.of<BuilderModsProvider>(context).mods[2].items,
                  )),
              mobileSection(context,
                  title: AppLocalizations.of(context)!.legs,
                  child: BuilderRecapMobileItem(
                    width: vw(context),
                    item: data.equipement[3],
                    mods:
                        Provider.of<BuilderModsProvider>(context).mods[3].items,
                  )),
              mobileSection(context,
                  title: AppLocalizations.of(context)!.class_item,
                  child: BuilderRecapMobileItem(
                    width: vw(context),
                    item: data.equipement[4],
                    mods:
                        Provider.of<BuilderModsProvider>(context).mods[4].items,
                  ))
            ],
          ),
        )
      ],
    );
  }
}
