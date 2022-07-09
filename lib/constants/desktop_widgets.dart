import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/BuildResponse.model.dart';
import 'package:quria/data/providers/builder/builder_mods_provider.dart';
import 'package:quria/data/providers/builder/builder_subclass_mods_provider.dart';
import 'package:quria/data/providers/builder/builder_subclass_provider.dart';
import 'package:quria/data/providers/characters_provider.dart';
import 'package:quria/data/providers/inspect/inspect_build_provider.dart';
import 'package:quria/data/providers/inspect/inspect_provider.dart';
import 'package:quria/data/services/bungie_api/bungie_actions.service.dart';
import 'package:quria/presentation/components/misc/desktop_components/modal_button.dart';
import 'package:quria/presentation/components/misc/mobile_components/equip_modal.dart';
import 'package:quria/presentation/components/misc/mobile_components/in_progress_modal.dart';
import 'package:quria/presentation/components/misc/mobile_components/transfer_modal.dart';
import 'package:quria/presentation/screens/collection/collection_item/collection_item_mobile_view.dart';

Widget desktopHeader(
  BuildContext context, {
  required ImageProvider<Object> image,
  required Widget child,
  Alignment alignment = Alignment.center,
}) {
  return Container(
    alignment: Alignment.bottomCenter,
    width: vw(context),
    height: vw(context) * 0.2,
    decoration: BoxDecoration(
      image: DecorationImage(
        alignment: alignment,
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

Widget builderContainer(BuildContext context, {required Widget child}) {
  return Center(
    child: Container(
      width: vw(context) * 0.75,
      padding: EdgeInsets.all(globalPadding(context)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: blackLight,
      ),
      child: child,
    ),
  );
}

Widget desktopRegularModal(BuildContext context, {required Widget child}) {
  return Stack(
    children: [
      Center(
        child: SizedBox(
          height: vh(context) * 0.9,
          width: vw(context) * 0.4,
          child: Material(
            type: MaterialType.card,
            color: Colors.transparent,
            child: SingleChildScrollView(child: child),
          ),
        ),
      ),
      Positioned(
        top: vh(context) * 0.15,
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
                icon: 'assets/icons/closeDesktop.svg',
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

Widget desktopBuildModal(BuildContext context, {required Widget child}) {
  Build data = Provider.of<InspectBuildProvider>(context, listen: false).build!;
  return Stack(
    children: [
      Center(
        child: SizedBox(
          height: vh(context) * 0.9,
          width: vw(context) * 0.4,
          child: Material(
            type: MaterialType.card,
            color: Colors.transparent,
            child: SingleChildScrollView(child: child),
          ),
        ),
      ),
      Positioned(
        top: vh(context) * 0.15,
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
                icon: 'assets/icons/closeDesktop.svg',
              ),
              SizedBox(
                height: vw(context) * 0.02,
              ),
              ModalButton(
                callback: () {
                  BungieActionsService().equipBuild(
                    context,
                    build: data,
                    characterId: Provider.of<CharactersProvider>(context, listen: false).currentCharacter!.characterId!,
                    mods: Provider.of<BuilderModsProvider>(context, listen: false).mods,
                    subclassMods: Provider.of<BuilderSubclassModsProvider>(context, listen: false).subclassMods,
                    subclassId: Provider.of<BuilderSubclassProvider>(context, listen: false).subclassId,
                  );
                },
                icon: 'assets/icons/equipDesktop.svg',
              ),
              SizedBox(
                height: vw(context) * 0.02,
              ),
              ModalButton(
                callback: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const InProgressModal();
                      });
                },
                icon: 'assets/icons/saveDesktop.svg',
              ),
              SizedBox(
                height: vw(context) * 0.02,
              ),
              ModalButton(
                callback: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const InProgressModal();
                      });
                },
                icon: 'assets/icons/shareDesktop.svg',
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

Widget desktopItemModal(BuildContext context, {required Widget child}) {
  DestinyItemComponent item = Provider.of<InspectProvider>(context).item!;
  return Stack(
    children: [
      Center(
        child: SizedBox(
          height: vh(context) * 0.9,
          width: vw(context) * 0.4,
          child: Material(
            type: MaterialType.card,
            color: Colors.transparent,
            child: SingleChildScrollView(child: child),
          ),
        ),
      ),
      Positioned(
        top: vh(context) * 0.15,
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
                icon: 'assets/icons/closeDesktop.svg',
              ),
              SizedBox(
                height: vw(context) * 0.02,
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
                icon: 'assets/icons/equipDesktop.svg',
              ),
              SizedBox(
                height: vw(context) * 0.02,
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
                icon: 'assets/icons/transferDesktop.svg',
              ),
              SizedBox(
                height: vw(context) * 0.02,
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
                icon: 'assets/icons/shareDesktop.svg',
              ),
              SizedBox(
                height: vw(context) * 0.02,
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
                            width: vw(context) * 0.4,
                          ),
                        );
                      });
                },
                icon: 'assets/icons/collectionDesktop.svg',
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
          height: vh(context) * 0.9,
          width: vw(context) * 0.4,
          child: Material(
            type: MaterialType.card,
            color: Colors.transparent,
            child: SingleChildScrollView(child: child),
          ),
        ),
      ),
      Positioned(
        top: vh(context) * 0.15,
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
                icon: 'assets/icons/closeDesktop.svg',
              ),
              SizedBox(
                height: vw(context) * 0.02,
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
                icon: 'assets/icons/shareDesktop.svg',
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
