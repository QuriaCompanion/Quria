import 'package:bungie_api/enums/destiny_item_type.dart';
import 'package:bungie_api/models/destiny_character_component.dart';
import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/helpers/profileHelper.model.dart';
import 'package:quria/data/services/bungie_api/account.service.dart';
import 'package:quria/data/services/bungie_api/profile.service.dart';
import 'package:quria/data/services/display/display.service.dart';
import 'package:quria/data/services/storage/storage.service.dart';
import 'package:quria/presentation/components/misc/loader.dart';
import 'package:quria/presentation/screens/profile/profile_mobile_scaffold.dart';

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
  late Future<void> _future;
  int index = 0;
  DestinyItemType currentFilter = DestinyItemType.Weapon;
  @override
  void initState() {
    super.initState();
    _future = display.getProfileData(index);
  }

  late double statArmorSpace;
  late double itemSectionSpace;
  late double itemDetailsSidePadding;
  late double itemDetailsChildPadding;
  late double fontSize;
  late double statsFontSize;
  late double pagePadding;
  late double itemDetailsWidth;
  late double middleSpace;
  late double imageSize;
  late double iconSize;
  late double verticalStatWidth;
  late ProfileHelper data;
  bool choosingCharacter = false;

  @override
  Widget build(BuildContext context) {
    statArmorSpace = 40;
    itemSectionSpace = 20;
    itemDetailsSidePadding = 25;
    itemDetailsChildPadding = 10;
    fontSize = 20;
    statsFontSize = 30;
    pagePadding = vw(context) * 0.05;
    itemDetailsWidth = vw(context) * 0.45;
    middleSpace = vw(context) * 0.2;
    imageSize = vw(context) * 0.075;
    verticalStatWidth = vw(context) * 0.06;
    iconSize = imageSize * 0.66;
    if (vw(context) < 1920) {
      fontSize = 15;
      statsFontSize = 25;
    }
    if (vw(context) < 1575) {
      fontSize = 15;
      statsFontSize = 20;
    }
    if (vw(context) < 1250) {
      fontSize = 15;
      statsFontSize = 15;
    }
    if (vw(context) < 1160) {
      iconSize = imageSize * 0.5;
    }
    if (vw(context) < 1020) {
      pagePadding = vw(context) * 0.025;
    }
    return FutureBuilder(
        future: _future,
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          if (snapshot.hasData) {
            List<DestinyCharacterComponent> characters =
                profile.getCharacters();
            DestinyCharacterComponent selectedCharacter = characters[index];
            List<DestinyItemComponent> equipement =
                profile.getCharacterEquipment(selectedCharacter.characterId!);
            DestinyItemComponent selectedCharacterSubclass =
                profile.getSubClassForCharacter(selectedCharacter.characterId!);
            data = ProfileHelper(
                characters: characters,
                selectedCharacter: selectedCharacter,
                selectedCharacterInventory: equipement,
                selectedCharacterSubclass: selectedCharacterSubclass,
                selectedCharacterIndex: index);
            if (vw(context) > 850) {
              return Column(
                children: [],
              );
            } else {
              return ProfileMobileScaffold(
                data: data,
                onCharacterChange: (newIndex) {
                  setState(() {
                    index = newIndex;
                  });
                },
              );
            }
          } else {
            return Container(
                decoration: const BoxDecoration(color: backgroundColor),
                child: const Loader());
          }
        });
  }

  // Widget webView(BuildContext context, ProfileHelper data) {
  //   int backgroundItemHash =
  //       data.selectedCharacterInventory[5].overrideStyleItemHash ??
  //           data.selectedCharacterInventory[5].itemHash!;
  //   return BlocProvider(
  //       create: (context) => AttributsDetailsCubit(),
  //       child: BlocBuilder<AttributsDetailsCubit, AttributsDetailsState>(
  //           builder: (context, attributeState) {
  //         return Container(
  //           decoration: BoxDecoration(
  //               image: DecorationImage(
  //                   image: NetworkImage(DestinyData.bungieLink +
  //                       ManifestService
  //                           .manifestParsed
  //                           .destinyInventoryItemDefinition![
  //                               backgroundItemHash]!
  //                           .screenshot!),
  //                   fit: BoxFit.fitHeight)),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Row(
  //                 children: [
  //                   characterBanner(context),
  //                 ],
  //               ),
  //               Container(
  //                 padding: EdgeInsets.symmetric(horizontal: pagePadding),
  //                 child: Row(
  //                   mainAxisAlignment: characterState is ShowDetailsState
  //                       ? MainAxisAlignment.spaceAround
  //                       : MainAxisAlignment.center,
  //                   crossAxisAlignment: CrossAxisAlignment.center,
  //                   children: [
  //                     ProfileMainNodeWidget(
  //                         imageSize: imageSize,
  //                         itemSectionSpacing: itemSectionSpace,
  //                         verticalStatWidth: verticalStatWidth,
  //                         middleSpace: middleSpace,
  //                         statArmorSpace: statArmorSpace,
  //                         statsFontSize: statsFontSize,
  //                         characterIndex: index,
  //                         data: snapshot.data!),
  //                     if (characterState is ShowDetailsState)
  //                       if (attributeState is AttributsDetailsIdState)
  //                         if (ManifestService
  //                                 .manifestParsed
  //                                 .destinyInventoryItemDefinition![
  //                                     characterState.item.itemHash]!
  //                                 .itemType ==
  //                             DestinyItemType.Subclass)
  //                           SubclassDetailCardWidget(
  //                               width: itemDetailsWidth,
  //                               fontSize: fontSize,
  //                               imageSize: imageSize,
  //                               iconSize: iconSize,
  //                               sidePadding: itemDetailsSidePadding,
  //                               childPadding: itemDetailsChildPadding,
  //                               characterId: snapshot
  //                                   .data!.characters[index].characterId!,
  //                               subclass: characterState.item)
  //                         else if (ManifestService
  //                                     .manifestParsed
  //                                     .destinyInventoryItemDefinition![
  //                                         characterState.item.itemHash]!
  //                                     .itemType !=
  //                                 DestinyItemType.Subclass &&
  //                             ManifestService
  //                                     .manifestParsed
  //                                     .destinyInventoryItemDefinition![
  //                                         characterState.item.itemHash]!
  //                                     .equippingBlock!
  //                                     .equipmentSlotTypeHash ==
  //                                 3284755031)
  //                           AdvancedSubclassDetailsCard(
  //                               childPadding: itemDetailsChildPadding,
  //                               sidePadding: itemDetailsSidePadding,
  //                               width: itemDetailsWidth,
  //                               characterId: snapshot
  //                                   .data!.characters[index].characterId!,
  //                               subclass: characterState.item)
  //                         else
  //                           ItemDetailsWidget(
  //                               width: itemDetailsWidth,
  //                               fontSize: fontSize,
  //                               imageSize: imageSize,
  //                               iconSize: iconSize,
  //                               sidePadding: itemDetailsSidePadding,
  //                               childPadding: itemDetailsChildPadding,
  //                               attributeSocketId: attributeState.id,
  //                               item: characterState.item)
  //                       else
  //                         ItemDetailsWidget(
  //                             width: itemDetailsWidth,
  //                             fontSize: fontSize,
  //                             imageSize: imageSize,
  //                             sidePadding: itemDetailsSidePadding,
  //                             iconSize: iconSize,
  //                             childPadding: itemDetailsChildPadding,
  //                             item: characterState.item)
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           ),
  //         );
  //       }));
  // }
}

// class WebCharacterBanner extends StatelessWidget {
//   final Function(int) onCharacterChange;
//   const WebCharacterBanner({required this.onCharacterChange, Key? key})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           CharacterBanner(
//               width: bannerSelectedWidth,
//               fontSize: bannerSelectedFont,
//               character: snapshot.data!.characters[index]),
//           for (int i = 0; i < snapshot.data!.characters.length; i++)
//             if (i != index)
//               SizedBox(
//                 height: (bannerSelectedWidth / 4.9375),
//                 child: InkWell(
//                   onTap: () {
//                     onCharacterChange(i);
//                   },
//                   child: Padding(
//                     padding: EdgeInsets.only(left: bannerSpacing),
//                     child: Image(
//                       image: NetworkImage(DestinyData.bungieLink +
//                           snapshot.data!.characters[i].emblemPath!),
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ),
//               ),
//           InkWell(
//             onTap: () {
//               profile.fetchProfileData();
//               display.getProfileData(index);
//             },
//             child: Icon(
//               Icons.refresh,
//               color: Colors.white,
//               size: iconSize,
//             ),
//           ),
//         ]);
//   }
// }
