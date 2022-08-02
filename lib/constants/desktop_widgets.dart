import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/BuildResponse.model.dart';
import 'package:quria/data/providers/characters_provider.dart';
import 'package:quria/data/providers/inspect/inspect_build_provider.dart';
import 'package:quria/data/providers/inspect/inspect_provider.dart';
import 'package:quria/data/providers/inventory_provider.dart';
import 'package:quria/data/services/builder.service.dart';
import 'package:quria/data/services/bungie_api/bungie_actions.service.dart';
import 'package:quria/data/services/bungie_api/bungie_api.service.dart';
import 'package:quria/presentation/components/misc/desktop_components/modal_button.dart';
import 'package:quria/presentation/components/misc/mobile_components/equip_modal.dart';
import 'package:quria/presentation/components/misc/mobile_components/in_progress_modal.dart';
import 'package:quria/presentation/components/misc/mobile_components/loading_modal.dart';
import 'package:quria/presentation/components/misc/mobile_components/transfer_modal.dart';
import 'package:quria/presentation/screens/builder/subclass/subclass_mobile_view.dart';
import 'package:quria/presentation/screens/collection/collection_item/collection_item_mobile_view.dart';
import 'package:quria/presentation/var/keys.dart';

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
                text: AppLocalizations.of(context)!.close,
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

Widget desktopSubclassModal(BuildContext context, {required Widget child}) {
  final characterId = Provider.of<CharactersProvider>(context, listen: false).currentCharacter!.characterId!;
  final subclasses = Provider.of<InventoryProvider>(context, listen: false).getSubclassesForCharacter(characterId);
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
                text: AppLocalizations.of(context)!.close,
                callback: () {
                  Navigator.pop(context);
                },
                icon: 'assets/icons/closeDesktop.svg',
              ),
              SizedBox(
                height: vw(context) * 0.02,
              ),
              ModalButton(
                text: AppLocalizations.of(context)!.change_subclass,
                callback: () {
                  Navigator.pop(context);
                  showDialog(
                      context: context,
                      builder: ((context) {
                        return desktopRegularModal(
                          context,
                          child: Container(
                            color: black,
                            child: SubclassMobileView(
                              width: vw(context) * 0.4,
                              subclasses: subclasses,
                              onSelect: (newSubclass) {
                                BungieActionsService()
                                    .equipItem(
                                      context,
                                      itemId: newSubclass.itemInstanceId!,
                                      characterId: characterId,
                                      itemHash: newSubclass.itemHash!,
                                    )
                                    .then((_) => Navigator.pop(context));
                              },
                            ),
                          ),
                        );
                      }));
                },
                icon: 'assets/icons/transferDesktop.svg',
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

Widget desktopPostmasterModal(BuildContext context, {required Widget child}) {
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
                text: AppLocalizations.of(context)!.close,
                callback: () {
                  Navigator.pop(context);
                },
                icon: 'assets/icons/closeDesktop.svg',
              ),
              SizedBox(
                height: vw(context) * 0.02,
              ),
              ModalButton(
                text: AppLocalizations.of(context)!.equip,
                callback: () {
                  final characterId =
                      Provider.of<CharactersProvider>(context, listen: false).currentCharacter!.characterId!;
                  showDialog(
                      context: context,
                      builder: ((context) {
                        return Center(
                          child: SizedBox(
                            width: vw(context) * 0.4,
                            height: vw(context) * 0.1,
                            child: LoadingModal(
                              text1: AppLocalizations.of(context)!.equipping,
                              text2: AppLocalizations.of(context)!.please_wait,
                            ),
                          ),
                        );
                      }));
                  BungieApiService()
                      .pullFromPostMaster(
                    itemHash: item.itemHash!,
                    stackSize: 1,
                    itemId: item.itemInstanceId!,
                    characterId: characterId,
                  )
                      .then((value) {
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Provider.of<InventoryProvider>(context, listen: false).pullFromPostmaster(item, characterId);
                    ScaffoldMessenger.of(scaffoldKey.currentContext!).showSnackBar(SnackBar(
                      content: textBodyMedium(
                        AppLocalizations.of(context)!.item_transfered,
                        utf8: false,
                        color: Colors.white,
                      ),
                      backgroundColor: Colors.green,
                    ));
                  }, onError: (_) {
                    Navigator.pop(context);
                    Navigator.pop(context);
                    ScaffoldMessenger.of(scaffoldKey.currentContext!).showSnackBar(SnackBar(
                      content: textBodyMedium(
                        AppLocalizations.of(context)!.error_base,
                        utf8: false,
                        color: Colors.white,
                      ),
                      backgroundColor: crucible,
                    ));
                  });
                },
                icon: 'assets/icons/equipDesktop.svg',
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
                text: AppLocalizations.of(context)!.close,
                callback: () {
                  Navigator.pop(context);
                },
                icon: 'assets/icons/closeDesktop.svg',
              ),
              SizedBox(
                height: vw(context) * 0.02,
              ),
              ModalButton(
                text: AppLocalizations.of(context)!.equip,
                callback: () {
                  final items = BuilderService().changeBuildToListOfItems(context, data: data);
                  BungieActionsService().equipStoredBuild(context, items: items).then((_) => Navigator.pop(context));
                },
                icon: 'assets/icons/equipDesktop.svg',
              ),
              SizedBox(
                height: vw(context) * 0.02,
              ),
              ModalButton(
                text: AppLocalizations.of(context)!.save,
                callback: () {
                  BuilderService().redirectToBuildSaving(context, data: data);
                },
                icon: 'assets/icons/saveDesktop.svg',
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
                text: AppLocalizations.of(context)!.close,
                callback: () {
                  Navigator.pop(context);
                },
                icon: 'assets/icons/closeDesktop.svg',
              ),
              SizedBox(
                height: vw(context) * 0.02,
              ),
              ModalButton(
                text: AppLocalizations.of(context)!.equip,
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
                text: AppLocalizations.of(context)!.transfer,
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
                text: AppLocalizations.of(context)!.share,
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
                text: AppLocalizations.of(context)!.collections,
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
                text: AppLocalizations.of(context)!.close,
                callback: () {
                  Navigator.pop(context);
                },
                icon: 'assets/icons/closeDesktop.svg',
              ),
              SizedBox(
                height: vw(context) * 0.02,
              ),
              ModalButton(
                text: AppLocalizations.of(context)!.share,
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
