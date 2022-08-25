import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/providers/builder_quria_provider.dart';
import 'package:quria/presentation/components/misc/desktop_components/scaffold_desktop.dart';
import 'package:quria/presentation/components/misc/mobile_components/scaffold_steps.dart';
import 'package:quria/presentation/screens/builder/desktop/builder_desktop_view.dart';
import 'package:quria/presentation/screens/builder/subclass_mods/subclass_mods_mobile_view.dart';
import 'package:quria/presentation/var/routes.dart';

class SubclassModsPage extends ConsumerWidget {
  const SubclassModsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DestinyInventoryItemDefinition subclass = ref.watch(builderQuriaProvider.select((value) => value.subclass!));
    List<DestinyInventoryItemDefinition> chosenSockets =
        ref.watch(builderQuriaProvider.select((value) => value.subclassMods));

    if (isMobile(context)) {
      return ScaffoldSteps(
          actionText: AppLocalizations.of(context)!.next,
          route: routeMod,
          body: SubclassModsMobileView(
            displayedSockets: chosenSockets,
            subclass: subclass,
            onChange: (mods, i) async {
              ref.read(builderQuriaProvider.notifier).setSubclassMods(mods);
            },
            width: vw(context),
          ));
    } else {
      return const ScaffoldDesktop(currentRoute: routeExotic, body: BuilderDesktopView());
    }
  }
}
