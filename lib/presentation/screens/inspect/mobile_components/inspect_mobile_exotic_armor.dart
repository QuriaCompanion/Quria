import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/providers/inspect/inspect_provider.dart';
import 'package:quria/data/providers/item_provider.dart';
import 'package:quria/presentation/components/detailed_item/item/mod_display.dart';

class InspectMobileExoticArmor extends ConsumerWidget {
  final double width;
  const InspectMobileExoticArmor({
    required this.width,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DestinyInventoryItemDefinition item =
        ref.watch(itemExoticPerkProvider(ref.watch(inspectProvider.select((value) => value?.item?.itemInstanceId))))!;
    return ModDisplay(
        width: vw(context) - globalPadding(context) * 2 - itemSize(context, width),
        iconSize: itemSize(context, width),
        padding: globalPadding(context),
        item: item);
  }
}
