import 'package:bungie_api/enums/destiny_item_type.dart';
import 'package:bungie_api/models/destiny_class_definition.dart';
import 'package:bungie_api/models/destiny_damage_type_definition.dart';
import 'package:bungie_api/models/destiny_inventory_item_definition.dart';
import 'package:bungie_api/models/destiny_presentation_node_definition.dart';
import 'package:bungie_api/models/destiny_sandbox_perk_definition.dart';
import 'package:bungie_api/models/destiny_stat_definition.dart';
import 'package:bungie_api/models/destiny_talent_grid_definition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/cubit/attributs_details_cubit.dart';
import 'package:quria/cubit/character_cubit.dart';
import 'package:quria/data/models/helpers/profileHelper.model.dart';
import 'package:quria/data/services/bungie_api/account.service.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.enum.dart';
import 'package:quria/data/services/bungie_api/profile.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/data/services/storage/storage.service.dart';
import 'package:quria/presentation/components/item_details_card.dart';
import 'package:quria/presentation/components/loader.dart';
import 'package:quria/presentation/components/subclass_details_card.dart';
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
  static const double statArmorSpace = 40;
  static const double itemSectionSpace = 20;
  static const double itemDetailsSidePadding = 25;
  static const double itemDetailsChildPadding = 10;

  Future<ProfileHelper> getProfileData() async {
    try {
      await ManifestService.getManifest<DestinyInventoryItemDefinition>();
      await ManifestService.getManifest<DestinyDamageTypeDefinition>();
      await ManifestService.getManifest<DestinyStatDefinition>();
      await ManifestService.getManifest<DestinyClassDefinition>();
      await ManifestService.getManifest<DestinySandboxPerkDefinition>();
      await ManifestService.getManifest<DestinyTalentGridDefinition>();
      await ManifestService.getManifest<DestinyPresentationNodeDefinition>();

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
    double bannerTopSpacing = 150;
    double fontSize = 20;
    double statsFontSize = 30;
    double bannerSelectedFont = 50;
    double itemDetailsWidth = MediaQuery.of(context).size.width * 0.45;
    double middleSpace = MediaQuery.of(context).size.width * 0.2;
    double imageSize = MediaQuery.of(context).size.width * 0.075;
    double iconSize = imageSize * 0.66;
    double verticalStatWidth = MediaQuery.of(context).size.width * 0.06;
    double bannerSelectedWidth = MediaQuery.of(context).size.width * 0.28;
    if (MediaQuery.of(context).size.width < 1920) {
      fontSize = 15;
      statsFontSize = 25;
      bannerSelectedFont = 40;
      bannerTopSpacing = 100;
    }
    if (MediaQuery.of(context).size.width < 1575) {
      fontSize = 15;
      statsFontSize = 20;
      bannerSelectedFont = 30;
      bannerTopSpacing = 80;
    }
    if (MediaQuery.of(context).size.width < 1250) {
      fontSize = 15;
      statsFontSize = 15;
      bannerSelectedWidth = 350;
      bannerTopSpacing = 50;
    }

    final double bannerUnselectedWidth = (bannerSelectedWidth / 100) * 66;
    final double bannerUnselectedFont = (bannerSelectedFont / 100) * 66;
    return FutureBuilder(
        future: getProfileData(),
        builder: (BuildContext context, AsyncSnapshot<ProfileHelper> snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: BlocProvider(
                create: (_) => CharacterCubit(),
                child: BlocBuilder<CharacterCubit, CharacterState>(
                  builder: (context, characterState) {
                    int displayHash = snapshot.data!.characterEquipement[5]
                            .overrideStyleItemHash ??
                        snapshot.data!.characterEquipement[5].itemHash!;
                    return BlocProvider(
                      create: (context) => AttributsDetailsCubit(),
                      child: BlocBuilder<AttributsDetailsCubit,
                          AttributsDetailsState>(
                        builder: (context, attributeState) {
                          return RepaintBoundary(
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(DestinyData
                                              .bungieLink +
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
                                    padding: EdgeInsets.only(
                                        left: bannerLeftSpacing,
                                        top: bannerTopSpacing),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          for (int i = 0;
                                              i <
                                                  snapshot
                                                      .data!.characters.length;
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
                                                    character: snapshot
                                                        .data!.characters[i]),
                                              ),
                                            ),
                                        ]),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      ProfileMainNodeWidget(
                                          imageSize: imageSize,
                                          itemSectionSpacing: itemSectionSpace,
                                          verticalStatWidth: verticalStatWidth,
                                          middleSpace: middleSpace,
                                          statArmorSpace: statArmorSpace,
                                          statsFontSize: statsFontSize,
                                          characterIndex: index,
                                          data: snapshot.data!),
                                      if (characterState is ShowDetailsState)
                                        if (attributeState
                                            is AttributsDetailsIdState)
                                          if (ManifestService
                                                  .manifestParsed
                                                  .destinyInventoryItemDefinition![
                                                      characterState
                                                          .item.itemHash]!
                                                  .itemType ==
                                              DestinyItemType.Subclass)
                                            SubclassDetailCardWidget(
                                                width: itemDetailsWidth,
                                                fontSize: fontSize,
                                                imageSize: imageSize,
                                                iconSize: iconSize,
                                                sidePadding:
                                                    itemDetailsSidePadding,
                                                childPadding:
                                                    itemDetailsChildPadding,
                                                characterId: snapshot
                                                    .data!
                                                    .characters[index]
                                                    .characterId!,
                                                subclass: characterState.item)
                                          else
                                            ItemDetailsWidget(
                                                width: itemDetailsWidth,
                                                fontSize: fontSize,
                                                imageSize: imageSize,
                                                iconSize: iconSize,
                                                sidePadding:
                                                    itemDetailsSidePadding,
                                                childPadding:
                                                    itemDetailsChildPadding,
                                                attributeSocketId:
                                                    attributeState.id,
                                                item: characterState.item)
                                        else
                                          ItemDetailsWidget(
                                              width: itemDetailsWidth,
                                              fontSize: fontSize,
                                              imageSize: imageSize,
                                              sidePadding:
                                                  itemDetailsSidePadding,
                                              iconSize: iconSize,
                                              childPadding:
                                                  itemDetailsChildPadding,
                                              item: characterState.item)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            );
          } else {
            return Container(
                decoration: const BoxDecoration(color: backgroundColor),
                child: const Loader());
          }
        });
  }
}
