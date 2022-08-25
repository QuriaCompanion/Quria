import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/providers/builder_quria_provider.dart';
import 'package:quria/presentation/components/misc/desktop_components/scaffold_desktop.dart';
import 'package:quria/presentation/components/misc/mobile_components/scaffold_steps.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quria/presentation/screens/builder/desktop/builder_desktop_view.dart';
import 'package:quria/presentation/screens/builder/mods/mods_mobile_view.dart';
import 'package:quria/presentation/var/routes.dart';

class ModsPage extends ConsumerWidget {
  const ModsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(builderQuriaProvider.notifier).init();
    final armorMods = ref.watch(builderQuriaProvider.select((value) => value.mods));
    if (isMobile(context)) {
      return ScaffoldSteps(
        actionText: AppLocalizations.of(context)!.next,
        route: routeClassItemChoice,
        body: ModsMobileView(
          armorMods: armorMods,
          onChange: (newMods) {
            ref.read(builderQuriaProvider.notifier).setMods(newMods);
          },
        ),
        previousRoute: routeSubclass,
      );
    } else {
      return const ScaffoldDesktop(currentRoute: routeExotic, body: BuilderDesktopView());
    }
  }
}
