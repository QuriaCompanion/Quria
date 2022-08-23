import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/providers/inspect/inspect_provider.dart';
import 'package:quria/data/providers/inventory_provider.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/screens/inspect/components/inspect_specimens.dart';

class InspectMobileSpecimens extends ConsumerWidget {
  final double width;
  const InspectMobileSpecimens({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(inspectProvider.select((value) => value?.item))!;
    return Column(children: [
      for (final item in ref.watch(allSpecimensProvider(item)))
        Padding(
          padding: EdgeInsets.only(bottom: globalPadding(context)),
          child: InkWell(
            onTap: () => ref.read(inspectProvider.notifier).setInspectItem(
                item: item, itemDef: ManifestService.manifestParsed.destinyInventoryItemDefinition[item.itemHash]!),
            child: InspectSpecimens(
              item: item,
              width: width,
            ),
          ),
        ),
    ]);
  }
}
