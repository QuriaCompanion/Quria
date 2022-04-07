import 'package:flutter/material.dart';
import 'package:quria/data/services/bungie_api/enums/quick_actions.enum.dart';
import 'package:quria/presentation/components/quick_action.dart';

class BuilderRecapMobileActions extends StatelessWidget {
  final Function(quick_actions) onAction;
  const BuilderRecapMobileActions({required this.onAction, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        QuickAction(
            icon: "assets/icons/Equip.svg",
            title: "Equiper",
            onTap: () => onAction(quick_actions.equip)),
        QuickAction(
            icon: "assets/icons/Save.svg",
            title: "Sauvegarder",
            onTap: () => onAction(quick_actions.save)),
        QuickAction(
            icon: "assets/icons/Share.svg",
            title: "Partager",
            onTap: () => onAction(quick_actions.share)),
      ],
    );
  }
}
