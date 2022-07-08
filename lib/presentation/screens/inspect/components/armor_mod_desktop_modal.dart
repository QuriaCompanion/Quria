import 'package:bungie_api/models/destiny_item_plug.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/providers/inspect/armor_mod_modal_provider.dart';
import 'package:quria/data/providers/plugs_provider.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/detailed_item/item/armor_mod_icon_display.dart';
import 'package:quria/presentation/components/detailed_item/item/mod_display.dart';
import 'package:quria/presentation/components/misc/rounded_button.dart';

class ArmorModDesktopModal extends StatelessWidget {
  final Future<void> Function(int) onSocketChange;
  final int plugSetsHash;
  const ArmorModDesktopModal({
    required this.onSocketChange,
    required this.plugSetsHash,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<DestinyItemPlug> plugs =
        Provider.of<PlugsProvider>(context, listen: false).getPlugSets(context, plugSetsHash).toSet().toList();
    return Container(
      decoration: BoxDecoration(color: black, borderRadius: BorderRadius.circular(8)),
      padding: EdgeInsets.all(globalPadding(context)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textH1(AppLocalizations.of(context)!.mod_equip, utf8: false),
              InkWell(
                onTap: () => Navigator.pop(context),
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.clear, size: 20, color: black),
                ),
              ),
            ],
          ),
          const Divider(
            color: Colors.white,
            height: 22,
            thickness: 1,
          ),
          ModDisplay(
              width: vw(context) * 0.3,
              padding: globalPadding(context),
              iconSize: iconSize(context, vw(context) * 0.3),
              item: Provider.of<ArmorModModalProvider>(context).armorMod!),
          const Divider(
            color: Colors.white,
            height: 22,
            thickness: 1,
          ),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (DestinyItemPlug plug in plugs)
                Container(
                  width: 55,
                  height: 55,
                  decoration: Provider.of<ArmorModModalProvider>(context).armorMod ==
                          ManifestService.manifestParsed.destinyInventoryItemDefinition[plug.plugItemHash]!
                      ? BoxDecoration(
                          border: Border.all(
                            color: vanguard,
                            width: 3,
                          ),
                        )
                      : null,
                  child: InkWell(
                    onTap: () {
                      Provider.of<ArmorModModalProvider>(context, listen: false).setSelectedMod(
                          ManifestService.manifestParsed.destinyInventoryItemDefinition[plug.plugItemHash]!);
                    },
                    child: ArmorModIconDisplay(
                      iconSize: 55,
                      socket: ManifestService.manifestParsed.destinyInventoryItemDefinition[plug.plugItemHash]!,
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: globalPadding(context)),
          RoundedButton(
              width: vw(context) * 0.5,
              text: textBodyMedium(
                AppLocalizations.of(context)!.equip,
                utf8: false,
                color: black,
              ),
              onPressed: () {
                onSocketChange(Provider.of<ArmorModModalProvider>(context, listen: false).armorMod!.hash!).then(
                  (_) => Navigator.pop(context),
                );
              })
        ],
      ),
    );
  }
}
