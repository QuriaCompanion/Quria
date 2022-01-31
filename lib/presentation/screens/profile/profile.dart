import 'package:bungie_api/models/destiny_class_definition.dart';
import 'package:bungie_api/models/destiny_damage_type_definition.dart';
import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:bungie_api/models/destiny_stat_definition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quria/cubit/attributs_details_cubit.dart';
import 'package:quria/cubit/character_cubit.dart';
import 'package:quria/data/models/helpers/profileHelper.model.dart';
import 'package:quria/data/services/bungie_api/account.service.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.enum.dart';
import 'package:quria/data/services/bungie_api/profile.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/data/services/storage/storage.service.dart';
import 'package:quria/presentation/components/attributs_details.dart';
import 'package:quria/presentation/components/loader.dart';
import 'package:quria/presentation/components/stat_progress_bar.dart';
import 'package:quria/presentation/components/header_weapon_details.dart';
import 'package:quria/presentation/components/statisticDisplay.dart';
import 'package:quria/presentation/components/weapon_details_bis.dart';
import 'package:quria/presentation/screens/profile/components/character_banner.dart';
import 'package:quria/presentation/screens/profile/components/profile_main_node.dart';

int index = 0;

@immutable
class ProfileWidget extends StatefulWidget {
  const ProfileWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  final storage = StorageService();
  final account = AccountService();
  final profile = ProfileService();

  static const double bannerSpacing = 10;
  static const double bannerLeftSpacing = 150;
  static const double bannerTopSpacing = 150;
  static const double bannerSelectedWidth = 600;
  static const double bannerUnselectedWidth = (bannerSelectedWidth / 100) * 66;
  static const double bannerSelectedFont = 50;
  static const double bannerUnselectedFont = (bannerSelectedFont / 100) * 66;

  Future<ProfileHelper> getProfileData() async {
    try {
      await ManifestService.getManifest<DestinyInventoryItemDefinition>();
      await ManifestService.getManifest<DestinyDamageTypeDefinition>();
      await ManifestService.getManifest<DestinyStatDefinition>();
      await ManifestService.getManifest<DestinyClassDefinition>();

      final characters = profile.getCharacters();
      ProfileHelper returned = ProfileHelper(
          (await account.getMembership())!,
          characters,
          profile.getCharacterEquipment(characters[index].characterId!));
      return returned;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getProfileData(),
        builder: (BuildContext context, AsyncSnapshot<ProfileHelper> snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: BlocProvider(
                create: (_) => CharacterCubit(),
                child: BlocBuilder<CharacterCubit, CharacterState>(
                  builder: (context, state) {
                    int displayHash = snapshot.data!.characterEquipement[5]
                            .overrideStyleItemHash ??
                        snapshot.data!.characterEquipement[5].itemHash!;
                    return Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(DestinyData.bungieLink +
                                  ManifestService
                                      .manifestParsed
                                      .destinyInventoryItemDefinition![
                                          displayHash]!
                                      .screenshot!),
                              fit: BoxFit.cover)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: bannerLeftSpacing, top: bannerTopSpacing),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  for (int i = 0;
                                      i < snapshot.data!.characters.length;
                                      i++)
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          index = i;
                                          context
                                              .read<CharacterCubit>()
                                              .hideDetails();
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: bannerSpacing / 2,
                                            bottom: bannerSpacing / 2),
                                        child: CharacterBanner(
                                            width: index == i
                                                ? bannerSelectedWidth
                                                : bannerUnselectedWidth,
                                            fontSize: index == i
                                                ? bannerSelectedFont
                                                : bannerUnselectedFont,
                                            character:
                                                snapshot.data!.characters[i]),
                                      ),
                                    ),
                                ]),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ProfileMainNodeWidget(data: snapshot.data!),
                              if (state is ShowDetailsState)
                                DetailsWeaponWidget(item: state.item)
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            );
          } else {
            return Container(
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 109, 102, 92)),
                child: const Loader());
          }
        });
  }
}

class CharacterStatsWidget extends StatelessWidget {
  final ProfileHelper? data;
  const CharacterStatsWidget({
    Key? key,
    required this.data,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const double fontsize = 30;
    const double width = 110;
    const double height = 50;
    return Container(
      margin: const EdgeInsets.only(right: 50),
      child: SizedBox(
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (int i = 0; i < 6; i++)
              StatisticDisplay(
                value:
                    data!.characters[index].stats![DestinyData.armorStats[i]]!,
                icon: DestinyData.statsIcon[i],
                width: width,
                height: height,
                fontsize: fontsize,
                padding: 8.0,
              ),
          ],
        ),
      ),
    );
  }
}

@immutable
class DetailsWeaponWidget extends StatelessWidget {
  final profile = ProfileService();
  final DestinyItemComponent item;
  DetailsWeaponWidget({
    required this.item,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int displayHash = item.overrideStyleItemHash ?? item.itemHash!;
    final stats = profile.getPrecalculatedStats(item.itemInstanceId!);
    return Container(
      width: 800,
      height: 800,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.black54,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Container(
        margin: const EdgeInsets.only(left: 14),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 140,
                  width: 140,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade700,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Image(
                      image: NetworkImage(DestinyData.bungieLink +
                          ManifestService
                              .manifestParsed
                              .destinyInventoryItemDefinition![displayHash]!
                              .displayProperties!
                              .icon!),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                // HeaderWeaponDetails(
                //     name: utf8.decode(ManifestService.manifestParsed
                //         .destinyInventoryItemDefinition![item.itemHash]!
                //         .displayProperties!
                //         .name!
                //         .runes
                //         .toList()),
                //     typeOfAmmo: 'typeOfAmmo',
                //     typeOfAmmoImg:
                //         'https://www.bungie.net/common/destiny2_content/screenshots/1715842350.jpg',
                //     typeOfWeapon: 'typeOfWeapon',
                //     type: 'type',
                //     typeImg:
                //         'https://www.bungie.net/common/destiny2_content/screenshots/1715842350.jpg',
                //     value: 100),
              ],
            ),
            SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (int statHash in DestinyData.linearStatBySubType[
                        ManifestService
                            .manifestParsed
                            .destinyInventoryItemDefinition![item.itemHash]!
                            .itemSubType!]!)
                      StatProgressBar(
                          name: ManifestService
                                  .manifestParsed
                                  .destinyStatDefinition![statHash]!
                                  .displayProperties!
                                  .name ??
                              'error',
                          value: stats![statHash.toString()]?.value ??
                              ManifestService
                                  .manifestParsed
                                  .destinyInventoryItemDefinition![
                                      item.itemHash]!
                                  .stats
                                  ?.stats![statHash.toString()]
                                  ?.value ??
                              0,
                          type: ManifestService
                              .manifestParsed
                              .destinyInventoryItemDefinition![item.itemHash]!
                              .itemType!),
                  ]),
            ),
            SizedBox(height: 30),
            BlocProvider(
                create: (_) => AttributsDetailsCubit(),
                child:
                    BlocBuilder<AttributsDetailsCubit, AttributsDetailsState>(
                        builder: (context, state) {
                  if (state is AttributsDetailsIdState) {
                    return AttributsDetails(item: item, socketId: state.id);
                  } else {
                    return AttributsDetails(item: item);
                  }
                })),
            WeaponDetailsBis(
                charger: stats!['3871231066']?.value,
                zoom: ManifestService
                    .manifestParsed
                    .destinyInventoryItemDefinition![item.itemHash]!
                    .stats
                    ?.stats!['3555269338']
                    ?.value,
                strokesMinutes: stats['4284893193']?.value,
                retreatDirection: ManifestService
                    .manifestParsed
                    .destinyInventoryItemDefinition![item.itemHash]!
                    .stats
                    ?.stats!['2715839340']
                    ?.value),
          ],
        ),
      ),
    );
  }
}
