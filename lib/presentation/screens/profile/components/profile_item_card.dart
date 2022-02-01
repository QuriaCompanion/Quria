import 'package:bungie_api/models/destiny_item_component.dart';
import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/cubit/attributs_details_cubit.dart';
import 'package:quria/cubit/character_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quria/data/services/bungie_api/enums/destiny_data.enum.dart';
import 'package:quria/data/services/manifest/manifest.service.dart';

class ProfileItemCard extends StatelessWidget {
  final DestinyItemComponent displayedItem;
  final double sizes;

  ///this should be the margin between the cards so 1/2 on top and 1/2 on bottom
  final double margin;
  const ProfileItemCard({
    Key? key,
    required this.displayedItem,
    this.sizes = 150,
    this.margin = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final displayHash =
        displayedItem.overrideStyleItemHash ?? displayedItem.itemHash;
    return Container(
      child: InkWell(
        onTap: () {
          context.read<AttributsDetailsCubit>().changeId(0);
          context.read<CharacterCubit>().showDetails(displayedItem);
        },
        child: Container(
          decoration: regularShadow,
          child: Image(
            image: NetworkImage(DestinyData.bungieLink +
                ManifestService
                    .manifestParsed
                    .destinyInventoryItemDefinition![displayHash]!
                    .displayProperties!
                    .icon!),
            fit: BoxFit.fill,
            width: sizes,
            height: sizes,
          ),
        ),
      ),
      margin: EdgeInsets.only(top: margin / 2, bottom: margin / 2),
    );
  }
}
