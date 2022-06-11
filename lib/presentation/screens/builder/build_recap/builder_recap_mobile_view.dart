import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/services/bungie_api/bungie_actions.service.dart';
import 'package:quria/data/services/bungie_api/enums/quick_actions.enum.dart';
import 'package:quria/data/models/helpers/builderRecapHelper.model.dart';
import 'package:quria/presentation/components/misc/mobile_components/in_progress_modal.dart';
import 'package:quria/presentation/components/misc/mobile_components/loading_modal.dart';
import 'package:quria/presentation/screens/builder/build_recap/mobile_components/builder_recap_mobile_actions.dart';
import 'package:quria/presentation/screens/builder/build_recap/mobile_components/builder_recap_mobile_item.dart';

class BuilderRecapMobileView extends StatelessWidget {
  final BuilderRecapHelper data;
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
                  textH1("Base :T${data.build.stats.base}"),
                  textH1("Final :T${data.build.stats.max}")
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
                                build: data.build,
                                characterId: data.characterId,
                                mods: data.mods,
                                subclassMods: data.subclassMods,
                                subclassId: data.subclassId,
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
                    item: data.build.equipement[0],
                    mods: data.mods[0].items,
                  )),
              mobileSection(context,
                  title: AppLocalizations.of(context)!.gauntlets,
                  child: BuilderRecapMobileItem(
                    width: vw(context),
                    item: data.build.equipement[1],
                    mods: data.mods[1].items,
                  )),
              mobileSection(context,
                  title: AppLocalizations.of(context)!.chest,
                  child: BuilderRecapMobileItem(
                    width: vw(context),
                    item: data.build.equipement[2],
                    mods: data.mods[2].items,
                  )),
              mobileSection(context,
                  title: AppLocalizations.of(context)!.legs,
                  child: BuilderRecapMobileItem(
                    width: vw(context),
                    item: data.build.equipement[3],
                    mods: data.mods[3].items,
                  )),
              mobileSection(context,
                  title: AppLocalizations.of(context)!.class_item,
                  child: BuilderRecapMobileItem(
                    width: vw(context),
                    item: data.build.equipement[4],
                    mods: data.mods[4].items,
                  ))
            ],
          ),
        )
      ],
    );
  }
}
