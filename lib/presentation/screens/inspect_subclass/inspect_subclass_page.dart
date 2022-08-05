import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:bungie_api/models/destiny_item_talent_grid_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:quria/data/models/helpers/inspectSubclassHelper.model.dart';
import 'package:quria/data/providers/inventory_provider.dart';
import 'package:quria/data/providers/item_provider.dart';
import 'package:quria/data/services/bungie_api/bungie_api.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/misc/error_dialog.dart';
import 'package:quria/presentation/components/misc/mobile_components/loading_modal.dart';
import 'package:quria/presentation/components/misc/mobile_components/scaffold_steps.dart';
import 'package:quria/presentation/screens/builder/subclass_mods/subclass_mods_mobile_view.dart';
import 'package:quria/presentation/screens/builder/subclass_mods/talent_grid_mobile_view.dart';
import 'package:quria/presentation/var/routes.dart';

class InspectSubclassPage extends StatelessWidget {
  final InspectSubclassHelper data;
  const InspectSubclassPage({
    required this.data,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sockets = Provider.of<ItemProvider>(context).getItemSockets(data.subclassId);
    final displayedSockets =
        sockets.map((e) => ManifestService.manifestParsed.destinyInventoryItemDefinition[e.plugHash]!).toList();
    final def = ManifestService.manifestParsed.destinyInventoryItemDefinition[
        Provider.of<InventoryProvider>(context).getItemByInstanceId(data.subclassId)?.itemHash];
    if (vw(context) < 1000) {
      return ScaffoldSteps(
        actionText: AppLocalizations.of(context)!.change_subclass,
        route: routeChangeSubclass,
        body: Builder(builder: (context) {
          return Builder(builder: (context) {
            if (data.isNewSubclass) {
              return SubclassModsMobileView(
                width: vw(context),
                onChange: (mods, index) async {
                  showMaterialModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      isDismissible: false,
                      expand: false,
                      builder: (context) {
                        return LoadingModal(
                          text1: AppLocalizations.of(context)!.equipping,
                          text2: AppLocalizations.of(context)!.please_wait,
                        );
                      });
                  await BungieApiService()
                      .insertSocketPlugFree(
                    data.subclassId,
                    mods[index].hash!,
                    index,
                    data.characterId,
                  )
                      .then((value) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: textBodyMedium(
                        AppLocalizations.of(context)!.item_equipped,
                        utf8: false,
                        color: Colors.white,
                      ),
                      backgroundColor: Colors.green,
                    ));
                    Provider.of<ItemProvider>(context, listen: false)
                        .setNewSockets(data.subclassId, value?.response?.item?.sockets?.data?.sockets ?? []);
                  }, onError: (_) {
                    Navigator.pop(context);
                    showDialog(
                        context: context,
                        builder: (context) {
                          return const ErrorDialog();
                        });
                  });
                },
                displayedSockets: displayedSockets,
                subclass: def!,
              );
            }
            DestinyItemTalentGridComponent talentGridComponent =
                Provider.of<ItemProvider>(context).getTalentGrid(data.subclassId)!;
            DestinyItemComponent itemComponent =
                Provider.of<InventoryProvider>(context).getItemByInstanceId(data.subclassId)!;
            DestinyInventoryItemDefinition definition =
                ManifestService.manifestParsed.destinyInventoryItemDefinition[itemComponent.itemHash]!;
            return TalentGridMobileView(
              width: vw(context),
              talentGrid:
                  ManifestService.manifestParsed.destinyTalentGridDefinition[talentGridComponent.talentGridHash]!,
              talentGridComponent: talentGridComponent,
              subclass: definition,
            );
          });
        }),
      );
    } else {
      return Container();
    }
  }
}
