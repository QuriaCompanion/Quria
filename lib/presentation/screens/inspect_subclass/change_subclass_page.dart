import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/providers/characters_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quria/data/providers/inventory_provider.dart';
import 'package:quria/data/services/bungie_api/bungie_actions.service.dart';
import 'package:quria/presentation/components/misc/mobile_components/loading_modal.dart';
import 'package:quria/presentation/components/misc/mobile_components/scaffold_burger_and_back_option.dart';
import 'package:quria/presentation/screens/builder/subclass/subclass_mobile_view.dart';
import 'package:quria/presentation/var/routes.dart';

class ChangeSubclassPage extends ConsumerWidget {
  const ChangeSubclassPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final characterId = ref.watch(charactersProvider).first.characterId!;
    final subclasses = ref.watch(subclassesForCharacterProvider(characterId));
    if (isMobile(context)) {
      return ScaffoldBurgerAndBackOption(
        width: vw(context),
        body: SubclassMobileView(
          subclasses: subclasses,
          width: vw(context),
          onSelect: (newSubclass) {
            showMaterialModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) {
                  return LoadingModal(
                    text1: AppLocalizations.of(context)!.equipping,
                    text2: AppLocalizations.of(context)!.please_wait,
                  );
                });
            BungieActionsService()
                .equipItem(
                  context,
                  itemId: newSubclass.itemInstanceId!,
                  characterId: characterId,
                  itemHash: newSubclass.itemHash!,
                )
                .then((_) => Navigator.pop(context))
                .then((_) => Navigator.pushNamed(context, routeProfile));
          },
        ),
      );
    } else {
      return Container();
    }
  }
}
