import 'package:bungie_api/enums/destiny_item_type.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quria/constants/mobile_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/cubit/attributs_details_cubit.dart';
import 'package:quria/cubit/character_cubit.dart';
import 'package:quria/data/models/helpers/inspectData.model.dart';
import 'package:quria/data/models/helpers/profileHelper.model.dart';
import 'package:quria/data/services/bungie_api/account.service.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/bungie_api/profile.service.dart';
import 'package:quria/data/services/display/display.service.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/data/services/storage/storage.service.dart';
import 'package:quria/presentation/detailed_item/item/item_details_card.dart';
import 'package:quria/presentation/detailed_item/subclass/advanced_subclass_details_card.dart';
import 'package:quria/presentation/components/misc/loader.dart';
import 'package:quria/presentation/detailed_item/subclass/subclass_details_card.dart';
import 'package:quria/presentation/screens/profile/components/character_banner.dart';
import 'package:quria/presentation/screens/profile/components/mobile_character_banner.dart';
import 'package:quria/presentation/screens/profile/components/mobile_profile_header_info.dart';
import 'package:quria/presentation/screens/profile/components/profile_main_node.dart';
import 'package:quria/presentation/screens/profile/components/profile_mobile_item_card.dart';
import 'package:quria/presentation/var/routes.dart';

@immutable
class ProfileWidget extends StatefulWidget {
  const ProfileWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  final display = DisplayService();
  final storage = StorageService();
  final account = AccountService();
  final profile = ProfileService();
  late Future<ProfileHelper> _future;
  late int index;
  @override
  void initState() {
    index = 0;
    super.initState();
    _future = display.getProfileData(index);
  }

  late double bannerSpacing;
  late double statArmorSpace;
  late double itemSectionSpace;
  late double itemDetailsSidePadding;
  late double itemDetailsChildPadding;
  late double fontSize;
  late double statsFontSize;
  late double bannerSelectedFont;
  late double pagePadding;
  late double bannerBotSpacing;
  late double bannerTopSpacing;
  late double itemDetailsWidth;
  late double middleSpace;
  late double imageSize;
  late double iconSize;
  late double verticalStatWidth;
  late double bannerSelectedWidth;
  late DestinyItemComponent subclass;

  @override
  Widget build(BuildContext context) {
    bannerSpacing = 10;
    statArmorSpace = 40;
    itemSectionSpace = 20;
    itemDetailsSidePadding = 25;
    itemDetailsChildPadding = 10;
    fontSize = 20;
    statsFontSize = 30;
    bannerSelectedFont = 50;
    pagePadding = MediaQuery.of(context).size.width * 0.05;
    bannerBotSpacing = MediaQuery.of(context).size.width * 0.02;
    itemDetailsWidth = MediaQuery.of(context).size.width * 0.45;
    middleSpace = MediaQuery.of(context).size.width * 0.2;
    imageSize = MediaQuery.of(context).size.width * 0.075;
    verticalStatWidth = MediaQuery.of(context).size.width * 0.06;
    bannerSelectedWidth = MediaQuery.of(context).size.width * 0.28;
    iconSize = imageSize * 0.66;
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
    if (MediaQuery.of(context).size.width < 1160) {
      iconSize = imageSize * 0.5;
    }
    if (MediaQuery.of(context).size.width < 1020) {
      pagePadding = MediaQuery.of(context).size.width * 0.025;
    }

    return FutureBuilder(
        future: _future,
        builder: (BuildContext context, AsyncSnapshot<ProfileHelper> snapshot) {
          if (snapshot.hasData) {
            subclass = ProfileService().getSubClassForCharacter(
                snapshot.data!.characters[index].characterId!);
            return SingleChildScrollView(
              child: BlocProvider(
                create: (_) => CharacterCubit(),
                child: BlocBuilder<CharacterCubit, CharacterState>(
                    builder: (context, characterState) {
                  int displayHash = snapshot
                          .data!.characterEquipement[5].overrideStyleItemHash ??
                      snapshot.data!.characterEquipement[5].itemHash!;
                  if (MediaQuery.of(context).size.width > 850) {
                    return webView(
                        displayHash, snapshot, characterState, context);
                  } else {
                    return mobileView(
                        displayHash, snapshot, characterState, context);
                  }
                }),
              ),
            );
          } else {
            return Container(
                decoration: const BoxDecoration(color: backgroundColor),
                child: const Loader());
          }
        });
  }

  Container mobileView(int displayHash, AsyncSnapshot<ProfileHelper> snapshot,
      CharacterState characterState, BuildContext context) {
    bannerSelectedWidth = MediaQuery.of(context).size.width * 0.6;
    imageSize = MediaQuery.of(context).size.width * 0.25;
    iconSize = MediaQuery.of(context).size.width * 0.1;
    itemDetailsSidePadding = MediaQuery.of(context).size.width * 0.02;
    itemDetailsChildPadding = 5;
    if (MediaQuery.of(context).size.width < 630) {
      bannerSelectedWidth = MediaQuery.of(context).size.width * 0.5;
      bannerSelectedFont = 20;
      statsFontSize = 15;
    }
    if (MediaQuery.of(context).size.width < 430) {
      bannerSelectedFont = 10;
      statsFontSize = 15;
    }
    return Container(
      decoration: const BoxDecoration(color: backgroundColor),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            mobileHeader(
              context,
              imageLink: DestinyData.bungieLink +
                  ManifestService
                      .manifestParsed
                      .destinyInventoryItemDefinition![subclass.itemHash]!
                      .screenshot!,
              child: MobileProfileHeaderInfo(
                  stats: snapshot.data!.characters[index].stats,
                  fontSize: statsFontSize,
                  characterId: snapshot.data!.characters[index].characterId!),
            ),
            for (int i = 0; i <= 7; i++)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: InkWell(
                  onTap: () {
                    // open mobile inspect
                    Navigator.pushNamed(context, routeInspectMobile,
                        arguments: InspectData(
                            hash:
                                snapshot.data!.characterEquipement[i].itemHash!,
                            instanceId: snapshot
                                .data!.characterEquipement[i].itemInstanceId!));
                  },
                  child: ProfileMobileItemCard(
                      width:
                          MediaQuery.of(context).size.width - pagePadding * 2,
                      imageSize: imageSize,
                      itemPadding: itemDetailsSidePadding,
                      itemChildPadding: itemDetailsChildPadding,
                      item: snapshot.data!.characterEquipement[i]),
                ),
              )
          ]),
    );
  }

  Widget webView(int displayHash, AsyncSnapshot<ProfileHelper> snapshot,
      CharacterState characterState, BuildContext context) {
    return BlocProvider(
        create: (context) => AttributsDetailsCubit(),
        child: BlocBuilder<AttributsDetailsCubit, AttributsDetailsState>(
            builder: (context, attributeState) {
          return Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(DestinyData.bungieLink +
                        ManifestService
                            .manifestParsed
                            .destinyInventoryItemDefinition![displayHash]!
                            .screenshot!),
                    fit: BoxFit.fitHeight)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    characterBanner(snapshot, context),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: pagePadding),
                  child: Row(
                    mainAxisAlignment: characterState is ShowDetailsState
                        ? MainAxisAlignment.spaceAround
                        : MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                        if (attributeState is AttributsDetailsIdState)
                          if (ManifestService
                                  .manifestParsed
                                  .destinyInventoryItemDefinition![
                                      characterState.item.itemHash]!
                                  .itemType ==
                              DestinyItemType.Subclass)
                            SubclassDetailCardWidget(
                                width: itemDetailsWidth,
                                fontSize: fontSize,
                                imageSize: imageSize,
                                iconSize: iconSize,
                                sidePadding: itemDetailsSidePadding,
                                childPadding: itemDetailsChildPadding,
                                characterId: snapshot
                                    .data!.characters[index].characterId!,
                                subclass: characterState.item)
                          else if (ManifestService
                                      .manifestParsed
                                      .destinyInventoryItemDefinition![
                                          characterState.item.itemHash]!
                                      .itemType !=
                                  DestinyItemType.Subclass &&
                              ManifestService
                                      .manifestParsed
                                      .destinyInventoryItemDefinition![
                                          characterState.item.itemHash]!
                                      .equippingBlock!
                                      .equipmentSlotTypeHash ==
                                  3284755031)
                            AdvancedSubclassDetailsCard(
                                childPadding: itemDetailsChildPadding,
                                sidePadding: itemDetailsSidePadding,
                                width: itemDetailsWidth,
                                characterId: snapshot
                                    .data!.characters[index].characterId!,
                                subclass: characterState.item)
                          else
                            ItemDetailsWidget(
                                width: itemDetailsWidth,
                                fontSize: fontSize,
                                imageSize: imageSize,
                                iconSize: iconSize,
                                sidePadding: itemDetailsSidePadding,
                                childPadding: itemDetailsChildPadding,
                                attributeSocketId: attributeState.id,
                                item: characterState.item)
                        else
                          ItemDetailsWidget(
                              width: itemDetailsWidth,
                              fontSize: fontSize,
                              imageSize: imageSize,
                              sidePadding: itemDetailsSidePadding,
                              iconSize: iconSize,
                              childPadding: itemDetailsChildPadding,
                              item: characterState.item)
                    ],
                  ),
                ),
              ],
            ),
          );
        }));
  }

  Widget characterBanner(
      AsyncSnapshot<ProfileHelper> snapshot, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: pagePadding, top: pagePadding, bottom: bannerBotSpacing),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CharacterBanner(
                width: bannerSelectedWidth,
                fontSize: bannerSelectedFont,
                character: snapshot.data!.characters[index]),
            for (int i = 0; i < snapshot.data!.characters.length; i++)
              if (i != index)
                SizedBox(
                  height: (bannerSelectedWidth / 4.9375),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        index = i;
                        snapshot.data!.characterEquipement =
                            profile.getCharacterEquipment(
                                snapshot.data!.characters[i].characterId!);
                        context.read<CharacterCubit>().hideDetails();
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: bannerSpacing),
                      child: Image(
                        image: NetworkImage(DestinyData.bungieLink +
                            snapshot.data!.characters[i].emblemPath!),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
            InkWell(
              onTap: () {
                profile.fetchProfileData();
                display.getProfileData(index);
              },
              child: Icon(
                Icons.refresh,
                color: Colors.white,
                size: iconSize,
              ),
            ),
          ]),
    );
  }

  Widget characterBannerMobile(
      AsyncSnapshot<ProfileHelper> snapshot, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: pagePadding, top: pagePadding, bottom: bannerBotSpacing),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MobileCharacterBanner(
                width: bannerSelectedWidth,
                fontSize: bannerSelectedFont,
                character: snapshot.data!.characters[index]),
          ]),
    );
  }
}
