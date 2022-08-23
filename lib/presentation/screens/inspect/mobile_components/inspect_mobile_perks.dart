import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:bungie_api/models/destiny_item_plug_base.dart';
import 'package:bungie_api/models/destiny_item_socket_state.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/providers/characters_provider.dart';
import 'package:quria/data/providers/inspect/inspect_provider.dart';
import 'package:quria/data/providers/inventory_provider.dart';
import 'package:quria/data/providers/item_provider.dart';
import 'package:quria/data/services/bungie_api/profile.service.dart';
import 'package:quria/presentation/screens/inspect/mobile_components/inspect_mobile_perk_column.dart';

class InspectMobilePerks extends ConsumerWidget {
  final double width;
  const InspectMobilePerks({
    required this.width,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DestinyItemComponent item = ref.watch(inspectProvider.select((value) => value?.item))!;
    List<DestinyItemSocketState> sockets = ref.watch(itemSocketsProvider(item.itemInstanceId));
    Map<String, List<DestinyItemPlugBase>> plugs = ref.watch(itemReusablePlugsProvider(item.itemInstanceId));
    List<List<DestinyInventoryItemDefinition>> perks = ProfileService().getItemPerksAsItemDef(plugs, sockets);

    String characterId =
        ref.watch(itemOwnerProvider(item.itemInstanceId)) ?? ref.watch(charactersProvider).first.characterId!;

    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: globalPadding(context)) * 0.875,
          decoration: const BoxDecoration(color: blackLight, borderRadius: BorderRadius.all(Radius.circular(8))),
          width: width,
          child: Center(
            child: textCaption(
              AppLocalizations.of(context)!.builder_subclass_mods_caption,
              utf8: false,
            ),
          ),
        ),
        SizedBox(height: globalPadding(context)),
        Builder(builder: (context) {
          List<Widget> list = <Widget>[];
          for (int i = 0; i < perks.length; i++) {
            list.add(Padding(
              padding: i != perks.length - 1 ? EdgeInsets.only(right: globalPadding(context)) : EdgeInsets.zero,
              child: InspectMobilePerkColumn(
                  width: width,
                  onSocketsChanged: (newSockets) {
                    ref.read(itemProvider.notifier).setNewSockets(item.itemInstanceId!, newSockets);
                  },
                  instanceId: item.itemInstanceId,
                  characterId: characterId,
                  perkColumn: perks[i],
                  sockets: sockets),
            ));
          }
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: list,
          );
        })
      ],
    );
  }
}
