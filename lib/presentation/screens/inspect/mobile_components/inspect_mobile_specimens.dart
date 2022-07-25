import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/providers/inspect/inspect_provider.dart';
import 'package:quria/data/providers/inventory_provider.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/screens/inspect/components/inspect_specimens.dart';

class InspectMobileSpecimens extends StatelessWidget {
  final double width;
  const InspectMobileSpecimens({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final item = Provider.of<InspectProvider>(context).item!;
    return Column(children: [
      for (final item in Provider.of<InventoryProvider>(context, listen: false).getAllSpecimens(item))
        Padding(
          padding: EdgeInsets.only(bottom: globalPadding(context)),
          child: InkWell(
            onTap: () => Provider.of<InspectProvider>(context, listen: false).setInspectItem(
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
