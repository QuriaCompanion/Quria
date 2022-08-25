import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/BuildResponse.model.dart';
import 'package:quria/data/providers/builder_quria_provider.dart';
import 'package:quria/data/services/builder.service.dart';
import 'package:quria/data/services/bungie_api/bungie_actions.service.dart';
import 'package:quria/data/services/bungie_api/enums/quick_actions.enum.dart';
import 'package:quria/presentation/components/misc/mobile_components/loading_modal.dart';
import 'package:quria/presentation/screens/builder/build_recap/mobile_components/builder_recap_mobile_actions.dart';
import 'package:quria/presentation/screens/builder/build_recap/mobile_components/builder_recap_mobile_item.dart';

class BuilderRecapMobileView extends ConsumerWidget {
  final Build data;
  final double width;
  const BuilderRecapMobileView({required this.data, Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                              final items = BuilderService().changeBuildToListOfItems(ref, data: data);
                              BungieActionsService()
                                  .equipStoredBuild(ref, items: items)
                                  .then((_) => Navigator.pop(context));
                              break;
                            case QuickActions.save:
                              BuilderService().redirectToBuildSaving(context, ref, data: data);
                              break;
                          }
                        },
                      )),
                mobileSection(context,
                    title: AppLocalizations.of(context)!.helmet,
                    child: BuilderRecapMobileItem(
                      width: width,
                      item: data.equipement[0],
                      mods: ref.watch(builderQuriaProvider.select((value) => value.mods[0].items)),
                    )),
                mobileSection(context,
                    title: AppLocalizations.of(context)!.gauntlets,
                    child: BuilderRecapMobileItem(
                      width: width,
                      item: data.equipement[1],
                      mods: ref.watch(builderQuriaProvider.select((value) => value.mods[1].items)),
                    )),
                mobileSection(context,
                    title: AppLocalizations.of(context)!.chest,
                    child: BuilderRecapMobileItem(
                      width: width,
                      item: data.equipement[2],
                      mods: ref.watch(builderQuriaProvider.select((value) => value.mods[2].items)),
                    )),
                mobileSection(context,
                    title: AppLocalizations.of(context)!.legs,
                    child: BuilderRecapMobileItem(
                      width: width,
                      item: data.equipement[3],
                      mods: ref.watch(builderQuriaProvider.select((value) => value.mods[3].items)),
                    )),
                mobileSection(context,
                    title: AppLocalizations.of(context)!.class_item,
                    child: BuilderRecapMobileItem(
                      width: width,
                      item: data.equipement[4],
                      mods: ref.watch(builderQuriaProvider.select((value) => value.mods[4].items)),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
