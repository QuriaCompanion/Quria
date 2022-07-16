import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/BuildResponse.model.dart';
import 'package:quria/data/providers/builder/builder_mods_provider.dart';
import 'package:quria/data/services/builder.service.dart';
import 'package:quria/data/services/bungie_api/bungie_actions.service.dart';
import 'package:quria/data/services/bungie_api/enums/quick_actions.enum.dart';
import 'package:quria/presentation/components/misc/mobile_components/in_progress_modal.dart';
import 'package:quria/presentation/components/misc/mobile_components/loading_modal.dart';
import 'package:quria/presentation/screens/builder/build_recap/mobile_components/builder_recap_mobile_actions.dart';
import 'package:quria/presentation/screens/builder/build_recap/mobile_components/builder_recap_mobile_item.dart';

class BuilderRecapMobileView extends StatelessWidget {
  final Build data;
  final double width;
  const BuilderRecapMobileView({required this.data, Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: black,
      child: Column(
        children: [
          mobileHeader(context,
              width: width,
              image: buildHeader,
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [textH1("Base :T${data.stats.base}"), textH1("Final :T${data.stats.max}")],
                ),
              )),
          Padding(
            padding: EdgeInsets.all(globalPadding(context)),
            child: Column(
              children: [
                if (width == vw(context))
                  mobileSection(context,
                      title: AppLocalizations.of(context)!.quick_actions,
                      child: BuilderRecapMobileActions(
                        width: width,
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
                                      text1: AppLocalizations.of(context)!.equipping,
                                      text2: AppLocalizations.of(context)!.long_action,
                                    );
                                  });
                              final items = BuilderService().changeBuildToListOfItems(context, data: data);
                              BungieActionsService()
                                  .equipStoredBuild(context, items: items)
                                  .then((_) => Navigator.pop(context));
                              break;
                            case QuickActions.save:
                              BuilderService().redirectToBuildSaving(context, data: data);
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
                      width: width,
                      item: data.equipement[0],
                      mods: Provider.of<BuilderModsProvider>(context).mods[0].items,
                    )),
                mobileSection(context,
                    title: AppLocalizations.of(context)!.gauntlets,
                    child: BuilderRecapMobileItem(
                      width: width,
                      item: data.equipement[1],
                      mods: Provider.of<BuilderModsProvider>(context).mods[1].items,
                    )),
                mobileSection(context,
                    title: AppLocalizations.of(context)!.chest,
                    child: BuilderRecapMobileItem(
                      width: width,
                      item: data.equipement[2],
                      mods: Provider.of<BuilderModsProvider>(context).mods[2].items,
                    )),
                mobileSection(context,
                    title: AppLocalizations.of(context)!.legs,
                    child: BuilderRecapMobileItem(
                      width: width,
                      item: data.equipement[3],
                      mods: Provider.of<BuilderModsProvider>(context).mods[3].items,
                    )),
                mobileSection(context,
                    title: AppLocalizations.of(context)!.class_item,
                    child: BuilderRecapMobileItem(
                      width: width,
                      item: data.equipement[4],
                      mods: Provider.of<BuilderModsProvider>(context).mods[4].items,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
