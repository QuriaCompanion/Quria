import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/constants/web_widgets.dart';
import 'dart:math' as math;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quria/data/models/Item.model.dart';
import 'package:quria/data/providers/characters_provider.dart';
import 'package:quria/data/providers/create_build_provider.dart';
import 'package:quria/data/providers/inventory_provider.dart';
import 'package:quria/data/services/builder.service.dart';
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

class CreateBuildDesktopView extends StatefulWidget {
  const CreateBuildDesktopView({Key? key}) : super(key: key);

  @override
  State<CreateBuildDesktopView> createState() => _CreateBuildDesktopViewState();
}

class _CreateBuildDesktopViewState extends State<CreateBuildDesktopView> {
  late TextEditingController _controller;
  final String _text = '';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController()..text = Provider.of<CreateBuildProvider>(context, listen: false).name ?? '';
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  onpenSubclassModal(BuildContext context) {
    final data = Provider.of<InventoryProvider>(context, listen: false).getSubclassesForCharacter(
        Provider.of<CharactersProvider>(context, listen: false).currentCharacter!.characterId!);

    return showDialog(
      context: context,
      builder: (context) => Center(
        child: Container(
          color: black,
          width: vw(context) * 0.4,
          height: vh(context) * 0.9,
          child: SingleChildScrollView(
            child: SubclassMobileView(
              width: vw(context) * 0.4,
              subclasses: data,
              onSelect: (subclass) {
                Navigator.pop(context);
                final sockets = DisplayService.getSubclassMods(context, subclass.itemInstanceId!);
                final item = Provider.of<CreateBuildProvider>(context, listen: false)
                    .getEquippedItemByBucket(InventoryBucket.subclass);
                final newItem = Item(
                    itemHash: subclass.itemHash!,
                    instanceId: subclass.itemInstanceId!,
                    isEquipped: true,
                    bucketHash: InventoryBucket.subclass,
                    mods: sockets.sockets.where((e) => e.plugHash != null).map((e) => e.plugHash!).toList());
                if (item != null) {
                  Provider.of<CreateBuildProvider>(context, listen: false).replaceItem(item, newItem);
                } else {
                  Provider.of<CreateBuildProvider>(context, listen: false).addItem(newItem);
                }
                if (ManifestService.manifestParsed.destinyInventoryItemDefinition[
                        Provider.of<InventoryProvider>(context, listen: false).getSuperHashForSubclass(
                            context,
                            Provider.of<InventoryProvider>(context, listen: false)
                                .getItemByInstanceId(subclass.itemInstanceId!)!)] ==
                    null) {
                  return;
                }
                showDialog(
                  context: context,
                  builder: (context) {
                    return Center(
                      child: SizedBox(
                        width: vw(context) * 0.4,
                        height: vh(context) * 0.9,
                        child: SingleChildScrollView(
                          child: Container(
                            color: black,
                            child: Column(
                              children: [
                                SubclassModsMobileView(
                                  width: vw(context) * 0.4,
                                  sockets: sockets.sockets,
                                  subclass:
                                      ManifestService.manifestParsed.destinyInventoryItemDefinition[subclass.itemHash]!,
                                  onChange: (newSockets, i) async {
                                    Provider.of<CreateBuildProvider>(context, listen: false).replaceItem(
                                        newItem,
                                        newItem
                                          ..mods =
                                              newSockets.where((e) => e.hash != null).map((e) => e.hash!).toList());
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
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        webHeader(
          context,
          image: ghostBuild,
          child: textDesktopTitle(
            Provider.of<CreateBuildProvider>(context).id == null
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
                        if (Provider.of<CreateBuildProvider>(context)
                                .getEquippedItemByBucket(InventoryBucket.subclass) !=
                            null)
                          InkWell(
                            onTap: () {
                              onpenSubclassModal(context);
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
                                ExtendedImage.network(
                                  DestinyData.bungieLink +
                                      ManifestService
                                          .manifestParsed
                                          .destinyInventoryItemDefinition[Provider.of<CreateBuildProvider>(context)
                                              .items
                                              .where((element) => element.bucketHash == InventoryBucket.subclass)
                                              .first
                                              .itemHash]!
                                          .displayProperties!
                                          .icon!,
                                  height: 75,
                                  width: 75,
                                  timeLimit: const Duration(seconds: 10),
                                  cache: true,
                                  filterQuality: FilterQuality.high,
                                  fit: BoxFit.fill,
                                  printError: false,
                                ),
                              ],
                            ),
                          )
                        else
                          InkWell(
                            onTap: () {
                              onpenSubclassModal(context);
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
                          stats: BuilderService()
                              .buildStatCalculator(context, items: Provider.of<CreateBuildProvider>(context).items),
                          characterId: Provider.of<CharactersProvider>(context).currentCharacter!.characterId!,
                          direction: Axis.horizontal,
                          width: 300,
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: _controller,
                          autofocus: false,
                          onChanged: (text) => setState(() => _text),
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
                        if (_controller.value.text.isEmpty)
                          textBodyBold("You need to name your build!", color: crucible),
                        if (Conditions.isBuildValid(Provider.of<CreateBuildProvider>(context).items))
                          textBodyBold("You have too many exotics!", color: crucible),
                        RoundedButton(
                            width: vw(context),
                            disabledColor: Colors.white,
                            isDisabled: _controller.value.text.isEmpty ||
                                Conditions.isBuildValid(Provider.of<CreateBuildProvider>(context).items),
                            text: textBodyMedium(AppLocalizations.of(context)!.save, utf8: false, color: black),
                            onPressed: () async {
                              try {
                                if (Provider.of<CreateBuildProvider>(context, listen: false).id != null) {
                                  await BuilderService().updateBuild(context, _controller.text).then((value) {
                                    ScaffoldMessenger.of(scaffoldKey.currentContext!).showSnackBar(SnackBar(
                                      content: textBodyMedium(
                                        AppLocalizations.of(context)!.build_created_success,
                                        utf8: false,
                                        color: Colors.white,
                                      ),
                                      backgroundColor: Colors.green,
                                    ));
                                    Provider.of<CreateBuildProvider>(context, listen: false).clear();
                                    Navigator.pushNamed(context, routeListBuilds);
                                  });
                                } else {
                                  await BuilderService().createBuild(context, _controller.text).then((value) {
                                    ScaffoldMessenger.of(scaffoldKey.currentContext!).showSnackBar(SnackBar(
                                      content: textBodyMedium(
                                        AppLocalizations.of(context)!.build_created_success,
                                        utf8: false,
                                        color: Colors.white,
                                      ),
                                      backgroundColor: Colors.green,
                                    ));
                                    Provider.of<CreateBuildProvider>(context, listen: false).clear();
                                    Navigator.pushNamed(context, routeListBuilds);
                                  });
                                }
                              } catch (e) {
                                return showDialog(context: context, builder: (context) => const ErrorDialog());
                              }
                            })
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
                    crossAxisAlignment: WrapCrossAlignment.center,
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
