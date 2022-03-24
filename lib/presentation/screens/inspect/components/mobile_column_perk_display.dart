import 'package:bungie_api/enums/destiny_item_type.dart';
import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:bungie_api/models/destiny_item_socket_state.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/services/bungie_api/bungie_api.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/detailed_item/item/perk_item_display.dart';
import 'package:quria/presentation/detailed_item/item/stat_progress_bar.dart';

class MobileColumnPerkDisplay extends StatefulWidget {
  final List<DestinyInventoryItemDefinition>? perkColumn;
  final List<DestinyItemSocketState> sockets;
  final String? instanceId;
  final Function(List<DestinyItemSocketState>?) onSocketsChanged;
  const MobileColumnPerkDisplay(
      {required this.perkColumn,
      required this.sockets,
      required this.onSocketsChanged,
      this.instanceId,
      Key? key})
      : super(key: key);

  @override
  State<MobileColumnPerkDisplay> createState() =>
      _MobileColumnPerkDisplayState();
}

class _MobileColumnPerkDisplayState extends State<MobileColumnPerkDisplay> {
  late int index;

  @override
  void initState() {
    super.initState();
    index = widget.sockets.indexOf(widget.sockets.firstWhere((socket) {
      if (widget.perkColumn != null) {
        for (DestinyInventoryItemDefinition perk in widget.perkColumn!) {
          if (socket.plugHash == perk.hash) {
            return true;
          }
        }
      }
      return false;
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.perkColumn != null)
          for (DestinyInventoryItemDefinition perk in widget.perkColumn!)
            Padding(
              padding: EdgeInsets.only(bottom: globalPadding(context) / 2),
              child: PerkItemWithFunction(
                  perk: perk,
                  sockets: widget.sockets,
                  instanceId: widget.instanceId,
                  index: index,
                  onSocketsChanged: widget.onSocketsChanged),
            ),
      ],
    );
  }
}

class PerkItemWithFunction extends StatefulWidget {
  final DestinyInventoryItemDefinition perk;
  final List<DestinyItemSocketState> sockets;
  final String? instanceId;
  final int index;
  final Function(List<DestinyItemSocketState>?) onSocketsChanged;
  const PerkItemWithFunction(
      {required this.perk,
      required this.sockets,
      required this.onSocketsChanged,
      required this.index,
      this.instanceId,
      Key? key})
      : super(key: key);

  @override
  State<PerkItemWithFunction> createState() => _PerkItemWithFunctionState();
}

class _PerkItemWithFunctionState extends State<PerkItemWithFunction> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      bool selected =
          widget.sockets.any((socket) => socket.plugHash == widget.perk.hash);
      return InkWell(
        onTap: () {
          showMaterialModalBottomSheet(
              backgroundColor: Colors.transparent,
              expand: false,
              context: context,
              builder: (context) {
                return PerkModal(perk: widget.perk);
              });
        },
        onLongPress: () {
          if (widget.instanceId != null) {
            setState(() {
              loading = true;
            });
            try {
              BungieApiService()
                  .insertSocketPlugFree(
                      widget.instanceId!, widget.perk.hash!, widget.index)
                  .then((value) async {
                setState(() {
                  loading = false;
                  widget.onSocketsChanged(
                      value?.response?.item?.sockets?.data?.sockets);
                });
              });
            } catch (e) {
              print("hello");
              setState(() {
                loading = false;
              });
            }
          }
        },
        child: PerkItemDisplay(
            perk: widget.perk,
            selected: selected,
            loading: loading,
            iconSize: (MediaQuery.of(context).size.width -
                    (globalPadding(context) * 6)) /
                5),
      );
    });
  }
}

class PerkModal extends StatelessWidget {
  const PerkModal({
    Key? key,
    required this.perk,
  }) : super(key: key);

  final DestinyInventoryItemDefinition perk;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(24)), color: black),
      child: Column(children: [
        Padding(
          padding: EdgeInsets.only(
              top: globalPadding(context),
              left: globalPadding(context),
              right: globalPadding(context)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  PerkItemDisplay(
                      perk: perk, iconSize: mobileItemSize(context)),
                  SizedBox(width: globalPadding(context)),
                  SizedBox(
                    width: MediaQuery.of(context).size.width -
                        mobileItemSize(context) -
                        (globalPadding(context) * 3) -
                        40,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textH3(perk.displayProperties?.name ?? ""),
                        textBodyRegular(perk.itemTypeDisplayName ?? "")
                      ],
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () => Navigator.pop(context),
                child: const CircleAvatar(
                  backgroundColor: blackLight,
                  child: Icon(Icons.clear, size: 20, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        const Divider(
          color: blackLight,
          height: 22,
          thickness: 1,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: globalPadding(context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textBodyRegular(perk.displayProperties?.description ?? ""),
              const Divider(
                color: blackLight,
                height: 22,
                thickness: 1,
              ),
              Builder(
                builder: ((context) {
                  List<Widget> list = [];
                  if (perk.investmentStats?.isNotEmpty ?? false) {
                    for (var stat in perk.investmentStats!) {
                      list.add(StatProgressBar(
                          width: MediaQuery.of(context).size.width,
                          fontSize: 20,
                          name: ManifestService
                                  .manifestParsed
                                  .destinyStatDefinition![stat.statTypeHash]!
                                  .displayProperties!
                                  .name ??
                              'error',
                          value: stat.value?.abs() ?? 0,
                          type: DestinyItemType.Armor));
                    }
                    list.add(
                      const Divider(
                        color: blackLight,
                        height: 22,
                        thickness: 1,
                      ),
                    );
                  }
                  return Column(children: list);
                }),
              ),
              Container(
                height: (MediaQuery.of(context).size.width -
                        (globalPadding(context) * 6)) /
                    5,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(100))),
                child: Center(child: textBodyMedium("Equiper", color: black)),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
