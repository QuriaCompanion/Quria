import 'package:bungie_api/destiny2.dart';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quria/constants/desktop_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/constants/web_widgets.dart';
import 'dart:math' as math;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quria/data/models/Item.model.dart';
import 'package:quria/data/providers/characters_provider.dart';
import 'package:quria/data/providers/create_build_provider.dart';
import 'package:quria/data/providers/inventory_provider.dart';
import 'package:quria/data/providers/item_provider.dart';
import 'package:quria/data/services/builder.service.dart';
import 'package:quria/data/services/bungie_api/bungie_api.service.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/bungie_api/enums/inventory_bucket_hash.dart';
import 'package:quria/data/services/display/display.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/misc/error_dialog.dart';
import 'package:quria/presentation/components/misc/rounded_button.dart';
import 'package:quria/presentation/screens/builder/subclass/subclass_mobile_view.dart';
import 'package:quria/presentation/screens/builder/subclass_mods/subclass_mods_mobile_view.dart';
import 'package:quria/presentation/screens/builds/create/create_build_section.dart';
import 'package:quria/presentation/screens/profile/components/character_stats_listing.dart';
import 'package:quria/presentation/var/keys.dart';
import 'package:quria/presentation/var/routes.dart';

class CreateBuildDesktopView extends ConsumerWidget {
  const CreateBuildDesktopView({Key? key}) : super(key: key);

  onpenSubclassModal(BuildContext context, WidgetRef ref) {
    final data = ref.watch(subclassesForCharacterProvider(ref.watch(charactersProvider).first.characterId!));

    return showDialog(
      context: context,
      builder: (context) => desktopRegularModal(
        context,
        child: Container(
          color: black,
          child: SubclassMobileView(
            width: modalWidth(context),
            subclasses: data,
            onSelect: (subclass) {
              Navigator.pop(context);
              final sockets = DisplayService.getSubclassMods(ref, subclass.itemInstanceId!);
              final item = ref.read(createBuildEquippedItemByBucketProvider(InventoryBucket.subclass));
              final newItem = Item(
                  itemHash: subclass.itemHash!,
                  instanceId: subclass.itemInstanceId!,
                  isEquipped: true,
                  bucketHash: InventoryBucket.subclass,
                  mods: sockets.sockets.where((e) => e.plugHash != null).map((e) => e.plugHash!).toList());
              if (item != null && item.itemHash != newItem.itemHash) {
                ref.read(createBuildProvider.notifier).replaceItem(item, newItem);
              } else if (item != null) {
                ref.read(createBuildProvider.notifier).replaceItem(item, newItem..mods = item.mods);
              } else {
                ref.read(createBuildProvider.notifier).addItem(newItem);
              }
              if (ManifestService
                      .manifestParsed.destinyInventoryItemDefinition[ref.read(superHashSubclassProvider(subclass))!] ==
                  null) {
                return;
              }
              showDialog(
                context: context,
                builder: (context) {
                  final displayedSockets =
                      ref.watch(createBuildEquippedItemByBucketProvider(InventoryBucket.subclass))?.mods ?? [];
                  return desktopRegularModal(
                    context,
                    child: Container(
                      color: black,
                      child: Column(
                        children: [
                          SubclassModsMobileView(
                            width: modalWidth(context),
                            displayedSockets: displayedSockets
                                .where((e) => ManifestService.manifestParsed.destinyInventoryItemDefinition[e] != null)
                                .map((e) => ManifestService.manifestParsed.destinyInventoryItemDefinition[e]!)
                                .toList(),
                            subclass: ManifestService.manifestParsed.destinyInventoryItemDefinition[subclass.itemHash]!,
                            onChange: (newSockets, i) async {
                              ref.read(createBuildProvider.notifier).replaceItem(newItem,
                                  newItem..mods = newSockets.where((e) => e.hash != null).map((e) => e.hash!).toList());
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.all(globalPadding(context)),
                            child: RoundedButton(
                              width: vw(context),
                              text: textBodyMedium(
                                AppLocalizations.of(context)!.save,
                                color: black,
                                utf8: false,
                              ),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController(text: '');
    return Column(
      children: [
        webHeader(
          context,
          image: ghostBuild,
          child: textDesktopTitle(
            ref.watch(createBuildProvider.select((value) => value.id)) == null
                ? AppLocalizations.of(context)!.create_build
                : AppLocalizations.of(context)!.update_build,
            utf8: false,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(globalPadding(context)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(globalPadding(context)),
                    width: 400,
                    decoration: BoxDecoration(
                      color: blackLight,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        if (ref.watch(createBuildEquippedItemByBucketProvider(InventoryBucket.subclass)) != null)
                          InkWell(
                            onTap: () {
                              onpenSubclassModal(context, ref);
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Transform.rotate(
                                  angle: -math.pi / 4,
                                  child: Container(
                                    height: 70,
                                    width: 70,
                                    decoration: BoxDecoration(border: Border.all(color: Colors.white)),
                                  ),
                                ),
                                Image.network(
                                  '${DestinyData.bungieLink}${ManifestService.manifestParsed.destinyInventoryItemDefinition[ref.watch(createBuildEquippedItemByBucketProvider(InventoryBucket.subclass))!.itemHash]!.displayProperties!.icon!}?t={${BungieApiService.randomUserInt}}123456',
                                  height: 75,
                                  width: 75,
                                  filterQuality: FilterQuality.high,
                                  fit: BoxFit.fill,
                                ),
                              ],
                            ),
                          )
                        else
                          InkWell(
                            onTap: () {
                              onpenSubclassModal(context, ref);
                            },
                            child: const SizedBox(
                              width: 80,
                              height: 80,
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        const SizedBox(height: 16),
                        CharacterStatsListing(
                          stats: BuilderService().buildStatCalculator(ref,
                              items: ref.watch(createBuildProvider.select((value) => value.items))),
                          characterId: ref.watch(charactersProvider).first.characterId!,
                          direction: Axis.horizontal,
                          width: 300,
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: controller,
                          autofocus: false,
                          maxLength: 45,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white, width: 1),
                              ),
                              hintText: AppLocalizations.of(context)!.create_build_field,
                              hintStyle: const TextStyle(color: Colors.white)),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        if (controller.value.text.isEmpty)
                          textBodyBold(
                            AppLocalizations.of(context)!.build_no_name,
                            color: crucible,
                            utf8: false,
                          ),
                        if (Conditions.isBuildValid(ref.watch(createBuildProvider.select((value) => value.items))))
                          textBodyBold(
                            AppLocalizations.of(context)!.build_too_many_exotic,
                            color: crucible,
                            utf8: false,
                          ),
                        RoundedButton(
                            width: vw(context),
                            disabledColor: Colors.white,
                            isDisabled: controller.value.text.isEmpty ||
                                Conditions.isBuildValid(ref.watch(createBuildProvider.select((value) => value.items))),
                            text: textBodyMedium(AppLocalizations.of(context)!.save, utf8: false, color: black),
                            onPressed: () async {
                              try {
                                if (ref.watch(createBuildProvider.select((value) => value.id)) != null) {
                                  await BuilderService().updateBuild(ref, controller.text).then((value) {
                                    ScaffoldMessenger.of(scaffoldKey.currentContext!).showSnackBar(
                                      SnackBar(
                                        content: textBodyMedium(
                                          AppLocalizations.of(context)!.build_update_success,
                                          utf8: false,
                                          color: Colors.white,
                                        ),
                                        backgroundColor: Colors.green,
                                      ),
                                    );
                                    ref.read(createBuildProvider.notifier).clear();
                                    Navigator.pushNamed(context, routeListBuilds);
                                  });
                                } else {
                                  await BuilderService().createBuild(ref, controller.text).then((value) {
                                    ScaffoldMessenger.of(scaffoldKey.currentContext!).showSnackBar(
                                      SnackBar(
                                        content: textBodyMedium(
                                          AppLocalizations.of(context)!.build_created_success,
                                          utf8: false,
                                          color: Colors.white,
                                        ),
                                        backgroundColor: Colors.green,
                                      ),
                                    );
                                    ref.read(createBuildProvider.notifier).clear();
                                    Navigator.pushNamed(context, routeListBuilds);
                                  });
                                }
                              } catch (e) {
                                return showDialog(context: context, builder: (context) => const ErrorDialog());
                              }
                            }),
                        const SizedBox(height: 16),
                        RoundedButton(
                          width: vw(context),
                          disabledColor: Colors.transparent,
                          buttonColor: Colors.transparent,
                          textColor: Colors.white,
                          text: textBodyMedium(
                            AppLocalizations.of(context)!.use_my_stuff,
                            utf8: false,
                            color: Colors.white,
                          ),
                          onPressed: () async {
                            final inventory = ref
                                .read(characterEquipmentProvider(ref.read(charactersProvider).first.characterId!))
                                .where((element) => InventoryBucket.loadoutBucketHashes.contains(element.bucketHash));
                            final List<Item> newItems = [];
                            for (var itemComponent in inventory) {
                              List<DestinyItemSocketState> sockets =
                                  ref.read(itemSocketsProvider(itemComponent.itemInstanceId!));

                              final mods = sockets
                                  .where((element) {
                                    final itemType = ManifestService.manifestParsed
                                        .destinyInventoryItemDefinition[itemComponent.itemHash]?.itemType;
                                    if (itemType == DestinyItemType.Armor) return Conditions.armorSockets(element);
                                    if (itemType == DestinyItemType.Weapon) {
                                      return Conditions.perkSockets(element.plugHash);
                                    }
                                    return true;
                                  })
                                  .where((element) => element.plugHash != null)
                                  .map((element) => element.plugHash!)
                                  .toList();
                              newItems.add(Item(
                                  itemHash: itemComponent.itemHash!,
                                  instanceId: itemComponent.itemInstanceId!,
                                  isEquipped: true,
                                  bucketHash: itemComponent.bucketHash!,
                                  mods: mods));
                            }
                            ref.read(createBuildProvider.notifier).replaceItems(newItems);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: globalPadding(context)),
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    children: [
                      for (final bucket in InventoryBucket.loadoutNoSubclass)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16, right: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              textH3(
                                ManifestService
                                    .manifestParsed.destinyInventoryBucketDefinition[bucket]!.displayProperties!.name!,
                              ),
                              const SizedBox(height: 16),
                              CreateBuildSection(
                                bucketHash: bucket,
                                width: 400,
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
