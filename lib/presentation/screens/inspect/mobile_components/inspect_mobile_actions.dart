import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/presentation/components/misc/mobile_components/equip_modal.dart';
import 'package:quria/presentation/components/misc/mobile_components/in_progress_modal.dart';
import 'package:quria/presentation/components/misc/mobile_components/transfer_modal.dart';

import 'package:quria/presentation/components/misc/quick_action.dart';

class InspectMobileActions extends StatefulWidget {
  final String instanceId;
  final int itemHash;
  const InspectMobileActions(
      {required this.itemHash, required this.instanceId, Key? key})
      : super(key: key);

  @override
  State<InspectMobileActions> createState() => _InspectMobileActionsState();
}

class _InspectMobileActionsState extends State<InspectMobileActions> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: globalPadding(context) / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          QuickAction(
              icon: "assets/icons/Equip.svg",
              title: "Ãquiper",
              onTap: () {
                showMaterialModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) {
                      return EquipModal(
                        itemHash: widget.itemHash,
                        instanceId: widget.instanceId,
                      );
                    });
              }),
          QuickAction(
              icon: "assets/icons/Transfer.svg",
              title: "TransfÃ©rer",
              onTap: () {
                showMaterialModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) {
                      return TransferModal(
                        itemHash: widget.itemHash,
                        instanceId: widget.instanceId,
                        onTransfer: () {},
                      );
                    });
              }),
          QuickAction(
              icon: "assets/icons/Share.svg",
              title: "Partager",
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
              title: "Collection",
              onTap: () {
                showMaterialModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) {
                      return const InProgressModal();
                    });
              }),
        ],
      ),
    );
  }
}
