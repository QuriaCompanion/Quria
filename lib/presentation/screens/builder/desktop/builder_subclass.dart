import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:bungie_api/models/destiny_item_socket_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:quria/constants/desktop_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:quria/data/models/helpers/socketsHelper.model.dart';
import 'package:quria/data/providers/builder/builder_subclass_mods_provider.dart';
import 'package:quria/data/providers/builder/builder_subclass_provider.dart';
import 'package:quria/data/providers/characters_provider.dart';
import 'package:quria/data/providers/inventory_provider.dart';
import 'package:quria/data/services/display/display.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/misc/rounded_button.dart';
import 'package:quria/presentation/screens/builder/subclass/mobile_components/subclass_mobile_card.dart';
import 'package:quria/presentation/screens/builder/subclass_mods/subclass_mods_mobile_view.dart';

class BuilderSubclass extends StatelessWidget {
  const BuilderSubclass({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<DestinyItemComponent> subclasses = Provider.of<InventoryProvider>(context, listen: false)
        .getSubclassesForCharacter(
            Provider.of<CharactersProvider>(context, listen: false).currentCharacter!.characterId!);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textH1(
          AppLocalizations.of(context)!.builder_subclass_title,
          utf8: false,
        ),
        textBodyHighRegular(
          AppLocalizations.of(context)!.builder_subclass_subtitle,
          utf8: false,
        ),
        SizedBox(
          height: globalPadding(context),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (final subclass in subclasses)
              Container(
                decoration: Provider.of<BuilderSubclassProvider>(context).subclass ==
                        ManifestService.manifestParsed.destinyInventoryItemDefinition[subclass.itemHash]
                    ? BoxDecoration(
                        border: Border.all(
                          color: vanguard,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      )
                    : null,
                child: InkWell(
                  child: SubclassMobileCard(
                    onTap: (subclassDef) {
                      if (Provider.of<BuilderSubclassProvider>(context, listen: false).subclass ==
                          ManifestService.manifestParsed.destinyInventoryItemDefinition[subclass.itemHash]) {
                        Provider.of<BuilderSubclassProvider>(context, listen: false).setSubclass(null, null);
                        return;
                      }
                      Provider.of<BuilderSubclassProvider>(context, listen: false)
                          .setSubclass(subclass.itemInstanceId, subclassDef);
                    },
                    color: grey,
                    subclass: subclass,
                    width: vw(context) * 0.15,
                  ),
                ),
              ),
          ],
        ),
        if (Provider.of<BuilderSubclassProvider>(context).subclass != null &&
            Provider.of<BuilderSubclassProvider>(context).subclass?.talentGrid?.talentGridHash == 0)
          Padding(
            padding: EdgeInsets.only(top: globalPadding(context)),
            child: Center(
              child: RoundedButton(
                onPressed: () => {
                  showDialog(
                      context: context,
                      barrierColor: const Color.fromARGB(110, 0, 0, 0),
                      builder: (context) {
                        SocketsHelper data = DisplayService.getSubclassMods(
                            context, Provider.of<BuilderSubclassProvider>(context).subclassId!);
                        List<DestinyItemSocketState> sockets = data.sockets;
                        DestinyInventoryItemDefinition subclass =
                            Provider.of<BuilderSubclassProvider>(context).subclass!;
                        List<DestinyInventoryItemDefinition> chosenSockets =
                            Provider.of<BuilderSubclassModsProvider>(context).subclassMods;
                        if (chosenSockets.isEmpty) {
                          chosenSockets = data.displayedSockets;
                        }
                        return desktopRegularModal(
                          context,
                          child: SubclassModsMobileView(
                            width: vw(context) * 0.4,
                            sockets: sockets,
                            subclass: subclass,
                            onChange: (mods, i) async {
                              Provider.of<BuilderSubclassModsProvider>(context, listen: false).setSubclassMods(mods);
                            },
                          ),
                        );
                      })
                },
                text: textBodyBold(AppLocalizations.of(context)!.builder_subclass_mods_title,
                    color: Colors.white, utf8: false),
                buttonColor: grey,
                width: 300,
              ),
            ),
          )
      ],
    );
  }
}
