import 'package:bungie_api/enums/destiny_item_type.dart';
import 'package:bungie_api/models/destiny_item_socket_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';
import 'package:quria/data/models/Item.model.dart';
import 'package:quria/data/providers/characters_provider.dart';
import 'package:quria/data/providers/create_build_provider.dart';
import 'package:quria/data/providers/inventory_provider.dart';
import 'package:quria/data/providers/item_provider.dart';
import 'package:quria/data/services/builder.service.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/bungie_api/enums/inventory_bucket_hash.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/components/misc/error_dialog.dart';
import 'package:quria/presentation/components/misc/rounded_button.dart';
import 'package:quria/presentation/screens/builds/create/create_build_section.dart';
import 'package:quria/presentation/var/keys.dart';
import 'package:quria/presentation/var/routes.dart';

class CreateBuildMobileView extends StatefulWidget {
  const CreateBuildMobileView({Key? key}) : super(key: key);

  @override
  State<CreateBuildMobileView> createState() => _CreateBuildMobileViewState();
}

class _CreateBuildMobileViewState extends State<CreateBuildMobileView> {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        mobileHeader(
          context,
          image: ghostBuild,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textH1(
                AppLocalizations.of(context)!.create_build,
                utf8: false,
              ),
              textBodyRegular(
                AppLocalizations.of(context)!.create_build_subtitle,
                utf8: false,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(globalPadding(context)),
          child: Column(
            children: [
              TextField(
                controller: _controller,
                autofocus: false,
                maxLength: 45,
                onChanged: (text) => setState(() => _text),
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1),
                    ),
                    hintText: AppLocalizations.of(context)!.create_build_field,
                    hintStyle: const TextStyle(color: Colors.white)),
              ),
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
                  final inventory = Provider.of<InventoryProvider>(context, listen: false)
                      .getCharacterEquipment(
                        Provider.of<CharactersProvider>(context, listen: false).currentCharacter!.characterId!,
                      )
                      .where((element) => InventoryBucket.loadoutBucketHashes.contains(element.bucketHash));
                  final List<Item> newItems = [];
                  for (var itemComponent in inventory) {
                    List<DestinyItemSocketState> sockets =
                        Provider.of<ItemProvider>(context, listen: false).getItemSockets(itemComponent.itemInstanceId!);

                    final mods = sockets
                        .where((element) {
                          final itemType = ManifestService
                              .manifestParsed.destinyInventoryItemDefinition[itemComponent.itemHash]?.itemType;
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
                  Provider.of<CreateBuildProvider>(context, listen: false).replaceItems(newItems);
                },
              ),
              for (final bucket in InventoryBucket.loadoutBucketHashes)
                mobileSection(
                  context,
                  title:
                      ManifestService.manifestParsed.destinyInventoryBucketDefinition[bucket]!.displayProperties!.name!,
                  utf8: true,
                  child: CreateBuildSection(
                    bucketHash: bucket,
                    width: vw(context),
                  ),
                ),
              if (_controller.value.text.isEmpty)
                textBodyBold(AppLocalizations.of(context)!.build_no_name, color: crucible, utf8: false),
              if (Conditions.isBuildValid(Provider.of<CreateBuildProvider>(context).items))
                textBodyBold(AppLocalizations.of(context)!.build_too_many_exotic, color: crucible, utf8: false),
              RoundedButton(
                  width: vw(context),
                  isDisabled: _controller.value.text.isEmpty ||
                      Conditions.isBuildValid(Provider.of<CreateBuildProvider>(context).items),
                  text: textBodyMedium(AppLocalizations.of(context)!.save, utf8: false, color: black),
                  onPressed: () async {
                    try {
                      if (Provider.of<CreateBuildProvider>(context, listen: false).id != null) {
                        await BuilderService().updateBuild(context, _controller.text).then((value) {
                          ScaffoldMessenger.of(scaffoldKey.currentContext!).showSnackBar(SnackBar(
                            content: textBodyMedium(
                              AppLocalizations.of(context)!.build_update_success,
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
        )
      ],
    );
  }
}
