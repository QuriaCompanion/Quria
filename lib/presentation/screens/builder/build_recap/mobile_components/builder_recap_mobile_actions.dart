import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quria/data/services/bungie_api/enums/quick_actions.enum.dart';
import 'package:quria/presentation/components/misc/quick_action.dart';

class BuilderRecapMobileActions extends StatelessWidget {
  final Function(QuickActions) onAction;
  const BuilderRecapMobileActions({required this.onAction, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        QuickAction(
            icon: "assets/icons/Equip.svg",
            title: AppLocalizations.of(context)!.equip,
            onTap: () {
              onAction(QuickActions.equip);
            }),
        QuickAction(
            icon: "assets/icons/Save.svg",
            title: AppLocalizations.of(context)!.save,
            onTap: () => onAction(QuickActions.save)),
        QuickAction(
            icon: "assets/icons/Share.svg",
            title: AppLocalizations.of(context)!.share,
            onTap: () => onAction(QuickActions.share)),
      ],
    );
  }
}
