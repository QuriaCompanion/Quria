import 'package:flutter/material.dart';
import 'package:quria/constants/desktop_widgets.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/data/models/helpers/profileHelper.model.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.dart';
import 'package:quria/data/services/bungie_api/enums/inventory_bucket_hash.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';
import 'package:quria/presentation/screens/profile/components/profile_desktop_item_section.dart';
import 'package:quria/presentation/screens/profile/mobile_components/profile_mobile_header.dart';

class ProfileDesktopView extends StatelessWidget {
  final ProfileHelper data;
  const ProfileDesktopView({
    required this.data,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const List<int> buckets = [
      InventoryBucket.kineticWeapons,
      InventoryBucket.energyWeapons,
      InventoryBucket.powerWeapons,
      ...InventoryBucket.armorBucketHashes
    ];
    String icon = data.isNewSubclass
        ? ManifestService
            .manifestParsed.destinyInventoryItemDefinition[data.selectedCharacterSubclass!.itemHash]!.screenshot!
        : ManifestService
            .manifestParsed.destinyInventoryItemDefinition[data.selectedCharacterSubclass!.itemHash]!.secondaryIcon!;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        desktopHeader(
          context,
          image: NetworkImage(
            DestinyData.bungieLink + icon,
          ),
          child: ProfileMobileHeader(
            width: vw(context) * 0.5,
            stats: data.selectedCharacter!.stats,
            characterSuper: data.characterSuper!,
            subclassId: data.selectedCharacterSubclass!.itemInstanceId!,
            characterId: data.selectedCharacter!.characterId!,
            isNewSubclass: data.isNewSubclass,
            subclass: data.selectedCharacterSubclass!,
          ),
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: buckets.length,
          itemBuilder: ((context, index) => ProfileDesktopItemSection(
                data: data,
                bucket: buckets[index],
              )),
        ),
        SizedBox(
          height: globalPadding(context),
        )
      ],
    );
  }
}
