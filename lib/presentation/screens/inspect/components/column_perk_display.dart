import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:bungie_api/models/destiny_item_socket_entry_plug_item_randomized_definition.dart';
import 'package:flutter/material.dart';
import 'package:quria/data/models/helpers/inspectHelper.model.dart';
import 'package:quria/data/models/perk.model.dart';
import 'package:quria/data/providers/inspect/inspect_provider.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/detailed_item/item/perk_item_display.dart';
import 'package:quria/presentation/components/detailed_item/item/perk_modal.dart';

@immutable
class ColumnPerkDisplay extends ConsumerWidget {
  const ColumnPerkDisplay({
    required this.item,
    required this.index,
    required this.width,
    Key? key,
  }) : super(key: key);
  final DestinyInventoryItemDefinition item;
  final int index;
  final double width;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<DestinyItemSocketEntryPlugItemRandomizedDefinition>? sockets = ManifestService.manifestParsed
        .destinyPlugSetDefinition[item.sockets!.socketEntries?[index].randomizedPlugSetHash]?.reusablePlugItems;
    final InspectWeaponStatus? status = ref.watch(inspectProvider.select((value) => value?.weaponStatus));
    return Column(
      children: [
        if (item.sockets?.socketEntries?[index].randomizedPlugSetHash != null)
          for (int i = 0; i < sockets!.length; i++)
            Padding(
              padding: EdgeInsets.symmetric(vertical: globalPadding(context) / 2),
              child: InkWell(
                onTap: () {
                  if (width == vw(context)) {
                    showMaterialModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        expand: false,
                        context: context,
                        builder: (context) {
                          return PerkModal(
                            width: vw(context),
                            isCollection: true,
                            isSelected: Conditions.isEquipped(index, sockets[i].plugItemHash, status),
                            perk:
                                ManifestService.manifestParsed.destinyInventoryItemDefinition[sockets[i].plugItemHash]!,
                            onSocketsChanged: (_) {
                              final newPerk = Perk(itemHash: sockets[i].plugItemHash!);
                              switch (index) {
                                case 1:
                                  ref.read(inspectProvider.notifier).setWeaponStatus(status?..firstColumn = newPerk);
                                  break;
                                case 2:
                                  ref.read(inspectProvider.notifier).setWeaponStatus(status?..secondColumn = newPerk);
                                  break;
                                case 3:
                                  ref.read(inspectProvider.notifier).setWeaponStatus(status?..thirdColumn = newPerk);
                                  break;
                                case 4:
                                  ref.read(inspectProvider.notifier).setWeaponStatus(status?..fourthColumn = newPerk);
                                  break;
                                case 5:
                                  ref.read(inspectProvider.notifier).setWeaponStatus(status?..fifthColumn = newPerk);
                                  break;
                              }
                            },
                          );
                        });
                    return;
                  }
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Center(
                          child: SizedBox(
                            width: vw(context) * 0.3,
                            child: PerkModal(
                              width: vw(context) * 0.3,
                              isSelected: Conditions.isEquipped(index, sockets[i].plugItemHash, status),
                              isCollection: true,
                              perk: ManifestService
                                  .manifestParsed.destinyInventoryItemDefinition[sockets[i].plugItemHash]!,
                              onSocketsChanged: (_) {
                                final newPerk = Perk(itemHash: sockets[i].plugItemHash!);
                                switch (index) {
                                  case 1:
                                    ref.read(inspectProvider.notifier).setWeaponStatus(status?..firstColumn = newPerk);
                                    break;
                                  case 2:
                                    ref.read(inspectProvider.notifier).setWeaponStatus(status?..secondColumn = newPerk);
                                    break;
                                  case 3:
                                    ref.read(inspectProvider.notifier).setWeaponStatus(status?..thirdColumn = newPerk);
                                    break;
                                  case 4:
                                    ref.read(inspectProvider.notifier).setWeaponStatus(status?..fourthColumn = newPerk);
                                    break;
                                  case 5:
                                    ref.read(inspectProvider.notifier).setWeaponStatus(status?..fifthColumn = newPerk);
                                    break;
                                }
                              },
                            ),
                          ),
                        );
                      });
                },
                child: PerkItemDisplay(
                  selected: Conditions.isEquipped(index, sockets[i].plugItemHash, status),
                  perk: ManifestService.manifestParsed.destinyInventoryItemDefinition[sockets[i].plugItemHash]!,
                  iconSize: itemSize(context, width),
                ),
              ),
            ),
        if (item.sockets?.socketEntries?[index].randomizedPlugSetHash == null &&
            item.sockets?.socketEntries?[index].singleInitialItemHash != 0)
          Padding(
            padding: EdgeInsets.symmetric(vertical: globalPadding(context) / 2),
            child: InkWell(
              onTap: () {
                if (width == vw(context)) {
                  showMaterialModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    expand: false,
                    context: context,
                    builder: (context) {
                      return PerkModal(
                        width: vw(context),
                        isSelected: true,
                        isCollection: true,
                        perk: ManifestService.manifestParsed
                            .destinyInventoryItemDefinition[item.sockets?.socketEntries?[index].singleInitialItemHash]!,
                      );
                    },
                  );
                  return;
                }
                showDialog(
                    context: context,
                    builder: (context) {
                      return Center(
                        child: SizedBox(
                          width: vw(context) * 0.3,
                          child: PerkModal(
                            width: vw(context) * 0.3,
                            isCollection: true,
                            isSelected: true,
                            perk: ManifestService.manifestParsed.destinyInventoryItemDefinition[
                                item.sockets?.socketEntries?[index].singleInitialItemHash]!,
                          ),
                        ),
                      );
                    });
              },
              child: PerkItemDisplay(
                perk: ManifestService.manifestParsed
                    .destinyInventoryItemDefinition[item.sockets?.socketEntries?[index].singleInitialItemHash]!,
                iconSize: itemSize(context, width),
                selected: true,
              ),
            ),
          )
      ],
    );
  }
}
