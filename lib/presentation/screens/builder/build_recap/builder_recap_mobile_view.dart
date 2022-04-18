import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/services/bungie_api/bungie_actions.service.dart';
import 'package:bottom_loader/bottom_loader.dart';
import 'package:quria/data/services/bungie_api/enums/quick_actions.enum.dart';
import 'package:quria/data/models/helpers/builderRecapHelper.model.dart';
import 'package:quria/presentation/components/misc/loader.dart';
import 'package:quria/presentation/components/misc/mobile_components/in_progress_modal.dart';
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
              mobileSection(context, title: "Actions rapides",
                  child: BuilderRecapMobileActions(
                onAction: (action) async {
                  switch (action) {
                    case quick_actions.equip:
                      var bl = BottomLoader(context,
                          isDismissible: false, loader: const Loader());
                      bl.display();
                      BungieActionsService()
                          .equipBuild(
                            build: data.build,
                            characterId: data.characterId,
                            mods: data.mods,
                            subclassMods: data.subclassMods,
                            subclassId: data.subclassId,
                          )
                          .then((value) => bl.close());
                      break;
                    case quick_actions.save:
                      showMaterialModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.transparent,
                          isDismissible: false,
                          expand: false,
                          builder: (context) {
                            return const InProgressModal();
                          });
                      break;
                    case quick_actions.share:
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
                  title: "Casque",
                  child: BuilderRecapMobileItem(
                    item: data.build.equipement[0],
                    mods: data.mods[0].items,
                  )),
              mobileSection(context,
                  title: "Gantelets",
                  child: BuilderRecapMobileItem(
                    item: data.build.equipement[1],
                    mods: data.mods[1].items,
                  )),
              mobileSection(context,
                  title: "Armure de torse",
                  child: BuilderRecapMobileItem(
                    item: data.build.equipement[2],
                    mods: data.mods[2].items,
                  )),
              mobileSection(context,
                  title: "Armure de bottes",
                  child: BuilderRecapMobileItem(
                    item: data.build.equipement[3],
                    mods: data.mods[3].items,
                  )),
              mobileSection(context,
                  title: "Objet de classe",
                  child: BuilderRecapMobileItem(
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
