import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/bungie_api_dart/destiny_inventory_item_definition.dart';
import 'package:quria/data/providers/inspect/inspect_provider.dart';
import 'package:quria/presentation/components/misc/desktop_components/modal_button.dart';
import 'package:quria/presentation/components/misc/mobile_components/equip_modal.dart';
import 'package:quria/presentation/components/misc/mobile_components/in_progress_modal.dart';
import 'package:quria/presentation/components/misc/mobile_components/transfer_modal.dart';
import 'package:quria/presentation/screens/collection/collection_item/collection_item_mobile_view.dart';

Widget desktopHeader(
  BuildContext context, {
  required ImageProvider<Object> image,
  required Widget child,
}) {
  return Container(
    alignment: Alignment.bottomCenter,
    width: vw(context),
    height: vw(context) * 0.2,
    decoration: BoxDecoration(
      image: DecorationImage(
        alignment: Alignment.center,
        fit: BoxFit.cover,
        image: image,
      ),
    ),
    child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            black.withOpacity(0),
            black.withOpacity(1),
          ],
        ),
      ),
      alignment: Alignment.bottomLeft,
      height: vw(context) * 0.15,
      child: SizedBox(
        width: vw(context) / 2,
        child: child,
      ),
    ),
  );
}

Widget desktopItemModal(BuildContext context, {required Widget child}) {
  DestinyItemComponent item = Provider.of<InspectProvider>(context).item!;
  return Stack(
    children: [
      Center(
        child: SizedBox(
          width: vw(context) * 0.4,
          child: Material(
            type: MaterialType.card,
            color: Colors.transparent,
            child: SingleChildScrollView(child: child),
          ),
        ),
      ),
      Positioned(
        top: vh(context) * 0.2,
        right: vw(context) * 0.2,
        child: Material(
          type: MaterialType.card,
          color: Colors.transparent,
          child: Column(
            children: [
              ModalButton(
                callback: () {
                  Navigator.pop(context);
                },
                icon: 'assets/icons/Close.svg',
              ),
              ModalButton(
                callback: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Center(
                          child: SizedBox(
                              width: vw(context) * 0.25,
                              child: EquipModal(
                                itemHash: item.itemHash!,
                                instanceId: item.itemInstanceId!,
                                width: vw(context) * 0.25,
                              )),
                        );
                      });
                },
                icon: 'assets/icons/Equip.svg',
              ),
              ModalButton(
                callback: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Center(
                          child: SizedBox(
                              width: vw(context) * 0.25,
                              child: TransferModal(
                                itemHash: item.itemHash!,
                                instanceId: item.itemInstanceId!,
                                width: vw(context) * 0.25,
                              )),
                        );
                      });
                },
                icon: 'assets/icons/Transfer.svg',
              ),
              ModalButton(
                callback: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Center(
                          child: SizedBox(width: vw(context) * 0.25, child: const InProgressModal()),
                        );
                      });
                },
                icon: 'assets/icons/Share.svg',
              ),
              ModalButton(
                callback: () {
                  Navigator.pop(context);
                  showDialog(
                      context: context,
                      builder: (context) {
                        return desktopCollectionModal(
                          context,
                          child: CollectionItemMobileView(
                            data: Provider.of<InspectProvider>(context).itemDef!,
                            width: vw(context) * 0.25,
                          ),
                        );
                      });
                },
                icon: 'assets/icons/Collection.svg',
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

Widget desktopCollectionModal(BuildContext context, {required Widget child}) {
  return Stack(
    children: [
      Center(
        child: SizedBox(
          width: vw(context) * 0.4,
          child: Material(
            type: MaterialType.card,
            color: Colors.transparent,
            child: SingleChildScrollView(child: child),
          ),
        ),
      ),
      Positioned(
        top: vh(context) * 0.2,
        right: vw(context) * 0.2,
        child: Material(
          type: MaterialType.card,
          color: Colors.transparent,
          child: Column(
            children: [
              ModalButton(
                callback: () {
                  Navigator.pop(context);
                },
                icon: 'assets/icons/Close.svg',
              ),
              ModalButton(
                callback: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Center(
                          child: SizedBox(width: vw(context) * 0.25, child: const InProgressModal()),
                        );
                      });
                },
                icon: 'assets/icons/Share.svg',
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
