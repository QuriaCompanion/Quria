import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/helpers/inspectSubclassHelper.model.dart';
import 'package:quria/data/providers/inventory_provider.dart';
import 'package:quria/data/providers/item_provider.dart';
import 'package:quria/data/services/bungie_api/bungie_api.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/misc/error_dialog.dart';
import 'package:quria/presentation/components/misc/mobile_components/loading_modal.dart';
import 'package:quria/presentation/components/misc/mobile_components/scaffold_steps.dart';
import 'package:quria/presentation/screens/builder/subclass_mods/subclass_mods_mobile_view.dart';
import 'package:quria/presentation/var/routes.dart';

class InspectSubclassPage extends ConsumerWidget {
  final InspectSubclassHelper data;
  const InspectSubclassPage({
    required this.data,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sockets = ref.watch(itemSocketsProvider(data.subclassId));
    final subclassComponent = ref.watch(itemByInstanceIdProvider(data.subclassId))!;
    final displayedSockets =
        sockets.map((e) => ManifestService.manifestParsed.destinyInventoryItemDefinition[e.plugHash]!).toList();
    final def = ManifestService.manifestParsed.destinyInventoryItemDefinition[subclassComponent.itemHash];
    if (isMobile(context)) {
      return ScaffoldSteps(
        actionText: AppLocalizations.of(context)!.change_subclass,
        route: routeChangeSubclass,
        body: Builder(builder: (context) {
          return Builder(builder: (context) {
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
                  ref
                      .read(itemProvider.notifier)
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
          });
        }),
      );
    } else {
      return Container();
    }
  }
}
