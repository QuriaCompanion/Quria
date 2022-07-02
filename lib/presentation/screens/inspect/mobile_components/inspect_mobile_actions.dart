import 'package:bungie_api/destiny2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/providers/inspect/inspect_provider.dart';
import 'package:quria/presentation/components/misc/mobile_components/equip_modal.dart';
import 'package:quria/presentation/components/misc/mobile_components/in_progress_modal.dart';
import 'package:quria/presentation/components/misc/mobile_components/transfer_modal.dart';

import 'package:quria/presentation/components/misc/quick_action.dart';
import 'package:quria/presentation/var/routes.dart';

class InspectMobileActions extends StatefulWidget {
  final double width;
  const InspectMobileActions({
    required this.width,
    Key? key,
  }) : super(key: key);

  @override
  State<InspectMobileActions> createState() => _InspectMobileActionsState();
}

class _InspectMobileActionsState extends State<InspectMobileActions> {
  @override
  Widget build(BuildContext context) {
    DestinyItemComponent item = Provider.of<InspectProvider>(context).item!;
    return Padding(
      padding: EdgeInsets.only(top: globalPadding(context) / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          QuickAction(
              icon: "assets/icons/Equip.svg",
              title: AppLocalizations.of(context)!.equip,
              width: widget.width,
              onTap: () {
                showMaterialModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) {
                      return EquipModal(
                        itemHash: item.itemHash!,
                        instanceId: item.itemInstanceId!,
                      );
                    });
              }),
          QuickAction(
              icon: "assets/icons/Transfer.svg",
              title: AppLocalizations.of(context)!.transfer,
              width: widget.width,
              onTap: () {
                showMaterialModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) {
                      return TransferModal(
                        itemHash: item.itemHash!,
                        instanceId: item.itemInstanceId!,
                        onTransfer: () {},
                      );
                    });
              }),
          QuickAction(
              icon: "assets/icons/Share.svg",
              title: AppLocalizations.of(context)!.share,
              width: widget.width,
              onTap: () {
                showMaterialModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) {
                      return const InProgressModal();
                    });
              }),
          QuickAction(
              icon: "assets/icons/Collection.svg",
              title: AppLocalizations.of(context)!.collections,
              width: widget.width,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  routeCollectionItem,
                  arguments: item.itemHash!,
                );
              }),
        ],
      ),
    );
  }
}
