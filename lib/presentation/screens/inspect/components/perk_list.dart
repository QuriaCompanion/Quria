import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quria/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:quria/data/providers/inspect/inspect_provider.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/display/display.service.dart';
import 'package:quria/presentation/components/misc/loader.dart';
import 'package:quria/presentation/screens/inspect/components/column_perk_display.dart';

class PerkList extends ConsumerStatefulWidget {
  const PerkList({
    required this.width,
    Key? key,
  }) : super(key: key);

  final double width;

  @override
  PerkListState createState() => PerkListState();
}

class PerkListState extends ConsumerState<PerkList> {
  late Future<void> _future;
  late DestinyInventoryItemDefinition itemDef;

  @override
  void initState() {
    super.initState();
    itemDef = ref.read(inspectProvider)!.itemDef;
    _future = DisplayService.getCollectionDefinitions(itemDef);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return SizedBox(
              child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                if (itemDef.sockets?.socketEntries != null)
                  for (int index = 0; index < itemDef.sockets!.socketEntries!.length; index++)
                    if (Conditions.perkSockets(itemDef.sockets!.socketEntries![index].singleInitialItemHash))
                      Padding(
                        padding: EdgeInsets.only(right: index != 5 ? globalPadding(context) : 0),
                        child: ColumnPerkDisplay(
                          item: itemDef,
                          index: index,
                          width: widget.width,
                        ),
                      )
              ]),
            );
          }
          return const Loader();
        });
  }
}
