import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:bungie_api/models/destiny_item_talent_grid_component.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:quria/data/models/helpers/inspectSubclassHelper.model.dart';
import 'package:quria/data/models/helpers/socketsHelper.model.dart';
import 'package:quria/data/services/bungie_api/bungie_api.service.dart';
import 'package:quria/data/services/bungie_api/profile.service.dart';
import 'package:quria/data/services/display/display.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/misc/error_dialog.dart';
import 'package:quria/presentation/components/misc/mobile_components/loading_modal.dart';
import 'package:quria/presentation/components/misc/mobile_components/scaffold_base.dart';
import 'package:quria/presentation/screens/builder/subclass_mods/subclass_mods_mobile_view.dart';
import 'package:quria/presentation/screens/builder/subclass_mods/talent_grid_mobile_view.dart';

class InspectSubclassPage extends StatefulWidget {
  final InspectSubclassHelper data;
  const InspectSubclassPage({
    required this.data,
    Key? key,
  }) : super(key: key);

  @override
  State<InspectSubclassPage> createState() => _InspectSubclassPageState();
}

class _InspectSubclassPageState extends State<InspectSubclassPage> {
  late SocketsHelper sockets;
  @override
  void initState() {
    super.initState();
    sockets = DisplayService().getSubclassMods(widget.data.subclassId);
  }

  @override
  Widget build(BuildContext context) {
    if (vw(context) < 1000) {
      return ScaffoldBase(
        body: Builder(builder: (context) {
          return Builder(builder: (context) {
            if (widget.data.isNewSubclass) {
              return SubclassModsMobileView(
                onChange: (mods, index) async {
                  showMaterialModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      isDismissible: false,
                      expand: false,
                      builder: (context) {
                        return const LoadingModal(
                          text1: "Equipement en cours",
                          text2: "Veuillez patienter ...",
                        );
                      });
                  await BungieApiService()
                      .insertSocketPlugFree(
                    widget.data.subclassId,
                    mods[index].hash!,
                    index,
                    widget.data.characterId,
                  )
                      .then((_) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: textBodyMedium(
                        "L'item a bien été équipé",
                        utf8: false,
                        color: Colors.white,
                      ),
                      backgroundColor: Colors.green,
                    ));
                  },
                          onError: (_) => showDialog(
                              context: context,
                              builder: (context) {
                                Navigator.pop(context);
                                return const ErrorDialog();
                              }));
                },
                sockets: sockets.sockets,
                subclass: sockets.def!,
              );
            }
            DestinyItemTalentGridComponent talentGridComponent =
                ProfileService().getTalentGrid(widget.data.subclassId)!;
            DestinyItemComponent itemComponent =
                ProfileService().getItemByInstanceId(widget.data.subclassId)!;
            DestinyInventoryItemDefinition definition = ManifestService
                .manifestParsed
                .destinyInventoryItemDefinition[itemComponent.itemHash]!;
            return TalentGridMobileView(
              talentGrid:
                  ManifestService.manifestParsed.destinyTalentGridDefinition[
                      talentGridComponent.talentGridHash]!,
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
