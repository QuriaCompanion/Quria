import 'package:flutter/material.dart';
import 'package:quria/presentation/components/quick_action.dart';

class BuilderRecapMobileActions extends StatelessWidget {
  const BuilderRecapMobileActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        QuickAction(
            icon: "assets/icons/Equip.svg", title: "Equiper", onTap: () {}),
        QuickAction(
            icon: "assets/icons/Save.svg", title: "Sauvegarder", onTap: () {}),
        QuickAction(
            icon: "assets/icons/Share.svg", title: "Partager", onTap: () {})
      ],
    );
  }
}
