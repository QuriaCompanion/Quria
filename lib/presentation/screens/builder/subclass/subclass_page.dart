import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/helpers/socketsHelper.model.dart';
import 'package:quria/data/providers/builder_quria_provider.dart';
import 'package:quria/data/providers/characters_provider.dart';
import 'package:quria/data/providers/inventory_provider.dart';
import 'package:quria/data/services/display/display.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/misc/desktop_components/scaffold_desktop.dart';
import 'package:quria/presentation/components/misc/mobile_components/scaffold_steps.dart';
import 'package:quria/presentation/screens/builder/desktop/builder_desktop_view.dart';
import 'package:quria/presentation/screens/builder/subclass/subclass_mobile_view.dart';
import 'package:quria/presentation/var/routes.dart';

@immutable
class SubclassPage extends ConsumerWidget {
  const SubclassPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<DestinyItemComponent> data =
        ref.watch(subclassesForCharacterProvider(ref.watch(charactersProvider).first.characterId!));
    if (isMobile(context)) {
      return ScaffoldSteps(
        actionText: AppLocalizations.of(context)!.next,
        route: routeMod,
        body: SubclassMobileView(
          width: vw(context),
          subclasses: data,
          onSelect: (subclass) {
            if (ref.watch(builderQuriaProvider.select((value) => value.subclass)) !=
                ManifestService.manifestParsed.destinyInventoryItemDefinition[subclass.itemHash]) {
              ref.read(builderQuriaProvider.notifier).setSubclass(subclass.itemInstanceId,
                  ManifestService.manifestParsed.destinyInventoryItemDefinition[subclass.itemHash]);
              SocketsHelper data = DisplayService.getSubclassMods(ref, subclass.itemInstanceId!);
              ref.read(builderQuriaProvider.notifier).setSubclassMods(data.displayedSockets);
            }
            ManifestService
                        .manifestParsed.destinyInventoryItemDefinition[subclass.itemHash]?.talentGrid?.talentGridHash ==
                    0
                ? Navigator.pushNamed(
                    context,
                    routeSubclassMod,
                  )
                : Navigator.pushNamed(
                    context,
                    routeMod,
                  );
          },
        ),
        onNext: () {
          ref.read(builderQuriaProvider.notifier).setSubclass(null, null);
          ref.read(builderQuriaProvider.notifier).setSubclassMods([]);
        },
        previousRoute: routeFilter,
      );
    } else {
      return const ScaffoldDesktop(currentRoute: routeExotic, body: BuilderDesktopView());
    }
  }
}
